.. title: stable requests with a special outcome
.. slug: stable-requests-with-a-special-outcome
.. date: 2007-08-23 23:10:19 UTC+01:00
.. tags: gentoo
.. link:
.. description: Life as tester is hard sometimes, sheer amount of requests...
.. type: text

Back on Tuesday I finally got into the mental feeling of holidays (yey, first holidays in one and a half year) and decided to spend the whole day for Gentoo work. So what comes to mind first? Check for open bugs..

As member of x86 arch team, I decided to start there. After open the site it felt a bit like bad news. ~30 requests being normal, 67 that day. :crazy:
So either there were just some slackers over the weekend or some herd woke up and filed requests like drinking coffee. Neither was the case though.
Only possible solution: boot up all boxes and have them compile...

All boxes.. my pc, my desktop,my errrrr... ok that's it. (As weird as it may sound to people who've never done Arch Team stuff, even with two devices it's much to do). Our "Gentoo Arch Tester Tool" (aka gatt) does a good job there by guessing packages just via bugzie ids though it's still a lot of work and quite a lot of time. Only to find out $package doesn't even build. Worked through ~20 bugs (and 3 failures) in about 8 hours. Not that efficient from what it felt like. :roll:
Luckily the php guys needed some help on getting stuff over from the overlay to portage and the day had a positive ending.

But I would like to have a tool that does a build on request to verify it atleast compiles on a default stable profile, maybe with a slightly polished make.conf. A quick look around returned only a "hey, let's build whole portage tree" script and some non-working or "I run emerge via cron" scripts. Both won't clearly do the job here.
Result: It's open source environment -- "Don't moan, code yourself".

First starting as a base on the build whole tree script I mentioned but then it quickly turned out that it wouldn't do the job for me. So more or less, inspired by the stuff seen in that script, start coding from scratch. ;)

After like 12 hours of intensive coding work on wednesday evening I finally had a basic tool thing done

What does it do?

#. Update system and world
#. clean out unneeded build and non-world packages (world only contains 4 pkgs there)
#. calculate minimum requirements for package X
#. build those and make binpkgs of them for later use

What are the next steps?
Obviously the request handling. Though another thing comes to mind: if there is more than one request at a time, parallel building on more than one box would be cool. Also there has do be at least a minimalistic bit of status overview.

I tried some build environments for the job, finally good old BuildBot was chosen as candidate. The setup is easy, all of the build boxes already have Python on it so not much overhead and I know the lang so can extend it if needed later on.

After reading through some docs to get the deeper know-how about how to distribute a buildjob, the next step was done and could be easily clicked on

RL wanted some attention today so I didn't put that much energy into it. Tomorrow will be our next LUG event so I think Sunday will be the time for more steps towards a request tinderbox (as only request handling stuff is left now).

`Tinderbox HTML Snapshot from WayBack Machine </htmls/tinderbox-sample.html>`_

If you want the (not yet documented) tinderbox script, "bzr get http://dev.gentooexperimental.org/~jokey/tinderbox/"