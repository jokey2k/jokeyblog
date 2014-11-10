.. title: PostgreSQL/Psycopg2 64bit OS X issue
.. slug: postgresqlpsycopg2-64bit-os-x-issue
.. date: 2010-05-10 15:13:54 UTC+01:00
.. tags: osx,hint
.. link:
.. description:
.. type: text

Many have issues getting their Psycopg2 to work on Snow Leopard. Let’s try to solve issues appearing down the road
Fist of all, we’re not going to use any ports, MacPorts or whatever here, plain PostgreSQL, virtualenv and gcc

Now let’s go to work.

#. Download a i386/x86_64 fat binary from here.
#. Open up the dmg and install it, it will live in /usr/local/pgsql
#. Init a virtualenv or source an existing one
#. Almost done already, now just install your psycopg2 instance with something like::

	PATH=$PATH:/usr/local/pgsql/bin/ easy_install psycopg2
	# or if you use distribute already (it’s worth it, trust me!)
	PATH=$PATH:/usr/local/pgsql/bin/ pip install psycopg2

That’s it. Now enjoy your ‘import psycopg2’ in 64bit mode :)