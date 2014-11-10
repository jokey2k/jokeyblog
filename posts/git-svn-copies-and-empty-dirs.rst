.. title: git-svn, copies and empty dirs
.. slug: git-svn-copies-and-empty-dirs
.. date: 2007-10-22 21:16:43 UTC+01:00
.. tags: gentoo,svn
.. link:
.. description:
.. type: text

Up to now, when working on sunrise with git-svn, I faced two minor issues that it didn't handle nicely.

#. When copying stuff from sunrise/ to reviewed/ so that it goes out via layman, the file was added although it was merged.
#. It left empty dirs behind when I kicked an app (as it went over to gentoo-x86)

After reading a bunch of mailinglists and forums posts, I finally had a working solution. Just add these lines to .git/config file:

.. code-block:: ini

	[diff]
	renames = copies

	[svn]
	findcopiesharder = 1
	rmdir = 1
