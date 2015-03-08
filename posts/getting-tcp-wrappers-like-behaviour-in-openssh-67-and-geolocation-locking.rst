.. title: Getting tcp wrappers like behaviour in OpenSSH 6.7 and GeoLocation Locking
.. slug: getting-tcp-wrappers-like-behaviour-in-openssh-67-and-geolocation-locking
.. date: 2015-03-08 13:11:42 UTC+01:00
.. tags: gentoo,linux
.. link:
.. description:
.. type: text

So during a system-update on a long non-maintained gentoo box (shame on me), I noticed::

	Note: openssh-6.7 versions no longer support USE=tcpd as upstream has dropped it.  Make sure to update any configs that you might have.

Until I realized that it means that my hosts.allow rules will not work anymore, fail2ban already exploded in attempts.
Some googling indicated that a lot of people were already trying various workarounds, one being using inetd which feels kind of awkward...

So instead of following that path, and as a heavy user of "Match exec" in ssh_config, I wanted that to be in my sshd as well. Luckily Damien Miller already started working on it (it just being a function copy from readconf.c to servconf.c and some followup header patchings)

To use it as a geolocation filter, which worked pretty well for me in the past, you need 3 steps:

#. Patch your sshd using `openssh-6.7_p1-match-exec.patch </patches/openssh-6.7_p1-match-exec.patch>`_
#. Install free geoip tools
#. Put filterscript in place
#. Enable script in sshd_config

.. note:: The solution presented here does NOT protect against openssh key exchange exploits as the connection will be made and the auth system will startup, just fail immediately without checking anything as we reach MaxAuthTries right from the beginning.


Patch your sshd
---------------

On a Gentoo box, this is already too easy::

    $ wget http://www.markus-ullmann.de/patches/openssh-6.7_p1-match-exec.patch
    $ mkdir -p /etc/portage/patches/net-misc/openssh
    $ cp openssh-6.7_p1-match-exec.patch /etc/portage/patches/net-misc/openssh
    $ emerge -av1 net-misc/openssh

During the merge, you should see something like this::

    >>> Preparing source in /home/tmp/portage/net-misc/openssh-6.7_p1-r4/work/openssh-6.7p1 ...
    * Applying openssh-6.7_p1-sshd-gssapi-multihomed.patch ...                     [ ok ]
    [...]
    * Applying user patches from /etc/portage/patches/net-misc/openssh ...
    *   openssh-6.7_p1-match-exec.patch ...                                        [ ok ]
    * Done with patching

After the rebuild completes, you're ready to go.

Install free GeoIP tools
------------------------

As I am personally only interested in limiting ssh access to a per-country basis, I use the `GeoLite2 Free Downloadable Database <http://dev.maxmind.com/geoip/geoip2/geolite2/>`_.

Installation is just as easy::

    $ flaggie dev-libs/geoip +ipv6
    $ emerge -a dev-libs/geoip
    $ geoipupdate.sh -f

This gives you a basic setup to work with, namely a database to work with and geoiplookup commandline tools.

Put filterscript in place
-------------------------

Downloading to the right place should be enough in most cases::

    $ cd /usr/local/bin
    $ wget http://www.markus-ullmann.de/scripts/openssh-make-exec-sshfilter.sh
    $ chmod a+x openssh-make-exec-sshfilter.sh

The header part in that script holds variables called ALLOW_COUNTRIES, ALLOW_COUNTRIES_V4 and ALLOW_COUNTRIES_V6 which you likely have to adapt to your needs.

Testing the setup
-----------------

Now that we have the script in place, let's try if it actually works (replace with your own IP::

    $ /usr/local/bin/openssh-make-exec-sshfilter.sh 62.112.43.239
    $ grep 'sshd connection from' /var/log/auth.log
    Mar  8 13:38:14 eas3 sshd[30018]: ALLOW sshd connection from 62.112.43.239 (DE)

Notice that it says "sshd" here. The script is not actually sshd but given I inject these things to fail2ban I need to make sure it looks like a sshd line.

Enable filtering in sshd_config
-------------------------------

.. warning:: As the GeoIP tools only accept ip adresses (and there are cases when hostnames have different geo information on IPv4 and IPv6, hello SixXS tunnel users), we have to disable DNS resolution in sshd.

To enable the filtering, add the following lines to your sshd_config::

    UseDNS no
    Match exec "/usr/local/bin/openssh-make-exec-sshfilter.sh '%h'"
        # Keep indentation here, otherwise no login anymore!
        MaxAuthTries 0

The final step left is **restarting** sshd as we rebuilt the binary and we're done. Phew.