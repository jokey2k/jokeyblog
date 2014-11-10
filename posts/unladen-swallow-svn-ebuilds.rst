.. title: Unladen Swallow SVN Ebuilds
.. slug: unladen-swallow-svn-ebuilds
.. date: 2010-04-30 12:12:16 UTC+01:00
.. tags: gentoo,german
.. link:
.. description:
.. type: text

Nach einiger Arbeit und einem Patch von Brian Harring, ist nun eine erste Version eines Live Ebuilds in meinem Developer Overlay für Google’s optimierten Python 2.6 Zweig verfügbar.

Das Projekt beruht darauf, mittels LLVM Laufzeitoptimierungen vorzunehmen, indem Funktionen zur Laufzeit beobachtet werden und ggf. in Maschinencode zur schnelleren Ausführung übersetzt werden.

Das Live Ebuild integriert sich als eigenen Python Zweig, das Binary heißt “python2.6-unladen”, so dass eine Kollision mit Systempaketen vermieden wird.
