.. title: OpenSSL CSR and key in one go
.. slug: openssl-csr-and-key-in-one-go
.. date: 2015-03-28 10:21:59 UTC+01:00
.. tags: linux
.. category:
.. link:
.. description:
.. type: text

As a small reminder to myself for generating new ssl keys and cert requests, here is a version to generate a sha256 key and csr in one go::

    openssl req -new -nodes -newkey rsa:2048 -sha256 -keyout server.key -out server.csr

