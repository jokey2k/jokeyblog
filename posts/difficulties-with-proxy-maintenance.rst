.. title: difficulties with proxy maintenance
.. slug: difficulties-with-proxy-maintenance
.. date: 2008-03-17 14:26:48 UTC+01:00
.. tags: gentoo
.. link:
.. description: Proxy-Maintenance still has only scripts at best. This needs change
.. type: text

Some of us devs do so-called proxy maintenance with some users who just like to get 2-3 packages updated in our tree, yet for them it hardly makes sense to become dev.

I have always been a fan of this, as it involves more people and I have nothing to do except reviewing patches and committing that. 5-10 packages are easy to handle for any dev, so no big drama.

Though when I joined our php team as commitmonkey, things started to become a bit hairy. There are like 200 packages who want regular revisit. Soonish there is a missing file on commit or whatever lil' fault you can think of as grepping changes from one dir and applying them to another is not that userfriendly when cvs is part of that game.

So some really bad scripts magically appeared to do that task yet they failed as well sometimes due to not recognizing same versions and whatnot. End of story: A GUI was needed to get a visual impression about what is going on there. Doing copy of selected files and run some commands after the copy (like cvs add and whatnot).

2 1/2 days of coding later, we have a candidate :)

It's part of the upcoming maintainer-helper release (yah I know, I was slacking at that project), so keep fingers tight or grep the live version :)
