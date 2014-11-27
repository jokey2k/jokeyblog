.. title: Migrating from Openfire to Prosody
.. slug: migrating-from-openfire-to-prosody
.. date: 2014-11-27 23:39:50 UTC+01:00
.. tags: linux,java,gentoo
.. link:
.. description:
.. type: text

For some friends of mine, I run a dedicated jabber server for some years now. Ever since I have been using Openfire as my server software of choice. But in recent time the server is facing some issues regarding compatibility and given it's a Java based tool, it takes about 150MB to run without external gateways or something.

Recently I have been told about an alternative that grew to something stable in the last months. Its name: Prosody

The server is written in Lua, thus the memory footprint should be way better than Openfires' and it has a good set of base plugins as well as a huge set of contributed modules for everything you can wrap your head around. Only issue at hand: The documentation is rare.

So what are the important steps?

User migration
--------------

After digging around a bit, I came across a blog post http://jontai.me/blog/2011/11/openfire-to-prosody/ where someone was facing the same issue.

Basically, just use Openfire user im/export plugin to export the current user and roster database to xml. Then fetch the openfire2prosody.php script from below and run::

    $ mkdir output
    $ php openfire2prosody.php export.xml output"

to get prosody flat file configurations. Later you will move the directories contents into prosodys data dir. Commonly it is /var/lib/prosody, on Gentoo Linux it is /var/spool/jabber for whatever reason

.. warning:: The XML as well as the converted files contain passwords in plain text so be careful with them!

First start configuration
-------------------------

A basic file comes with the installation of the package. Gentoo example::

    cp /etc/jabber/prosody.cfg.lua.dist /etc/jabber/prosody.cfg.lua
    vim /etc/jabber/prosody.cfg.lua

Tweak the settings as you feel, I recommend setting at least an admin account to be granted setup permissions later

Some settings are there for you to provide, which are unfortunately not part of the documentation. I put these right under the admin setting::

    prosody_user = "jabber"
    prosody_group = "jabber"
    pidfile = "/var/run/jabber/prosody.pid"

These are important when you run it on gentoo, as the defaults are "prosody" for user and group which do not exist on Gentoo systems.

Now you can start the server with::

    /etc/init.d/prosody start

Summary
-------

After using Prosody for some time now, it's really nice, small and fast. And the plugins allow you basically doing anything with just downloading a module and adding it to modules_enabled list.

openfire2prosody.php
--------------------

.. gist:: 1363677

