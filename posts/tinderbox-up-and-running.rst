.. title: Tinderbox up and running
.. slug: tinderbox-up-and-running
.. date: 2007-09-03 19:54:03 UTC+01:00
.. tags: gentoo
.. link:
.. description: Title says it all :D Being proud...
.. type: text

To be honest, I didn't expect the thing to last that long though it was worth it. As the topic suggests, the beast is working now.

While the actual build script was done in one day, getting all involved things to play nice and friendly was really a hard job. Involved were cachings, optimizations for different VCSs and many minor corner cases.
Facing facts I'm abusing a system which was designed to fetch source from some repository then run tests on it and if multiple requests come in, just work on latest one. This is partially what I want and the other part is the opposite. So I had to dig deep into BuildBot to solve all outstanding issues.

Job management was more like coding top down (no really hard task after all) though needed tweaks along the road as well.

But as I said it was worth it. The thing has no dark corners anymore for me ;)

And: there are pre-stable tests now for the incoming requests :)

Note for interested people:
Repo of it has moved to dev.gentoo.org/~jokey/tinderbox-bzr
URL of the BuildBot Status Page: http://buildbot.gentooext.net/