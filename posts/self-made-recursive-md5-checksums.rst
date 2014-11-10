.. title: Self-made recursive md5 checksums
.. slug: self-made-recursive-md5-checksums
.. date: 2006-05-20 13:42:46 UTC+01:00
.. tags: python,script
.. link:
.. description: Fast scripting as it should be
.. type: text

For those who have a need to fast-build a recursive md5 hashtable without big tools, here's a script to do it with python:

.. code-block:: python
   :number-lines:

    import hashlib
    import os

    startdir = os.getcwd()

    for root, dirs, files in os.walk(startdir):
        for filename in files:
            fullpath = root + '/' + filename
            m = hashlib.md5()
            with open(fullpath, "rb") as checkfile:
                block = checkfile.read(1048576)
                if block:
                    m.update(block)
            print fullpath + " " + m.hexdigest()
            del m
