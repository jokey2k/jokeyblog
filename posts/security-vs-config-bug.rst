.. title: Security vs. config bug
.. slug: security-vs-config-bug
.. date: 2006-05-23 22:33:36 UTC+01:00
.. tags: gentoo
.. link:
.. description: Prefer security with potential system breakage or config mess?
.. type: text

Okay, now we have a really weird situation....

On the one hand, OpenLDAP 2.3.23 has a problem with new-style slapd.d

.. code-block:: shell

	slapadd -v -F /etc/openldap/slapd.d -l /root/200605191201.ldif
	slapadd: ldif.c:416: r_enum_tree: Assertion `itmp.bv_val[ 0 ] != '-'' failed.
	Aborted

(bug #133898 on bugs.gentoo.org)

On the other hand we have a (hard to abuse) weakness in slurpd (which is used for some older replication setups)
(bug #134010 on bugs.gentoo.org)

But masking 2.3 completely would really end up in breaking many setups and databases, so no option as well...
