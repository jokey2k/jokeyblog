.. title: AVR Net IO
.. slug: avr-net-io
.. date: 2010-05-03 18:13:04 UTC+01:00
.. tags: linux,embedded
.. link:
.. description:
.. type: text

Eine Serverüberwachung ist ja gut und schön, aber was nützt es einem, wenn sie nur SMS und E-Mails schicken kann. Eine schön blinkende LED würde doch viel eher auffallen.

Um diesem Rechnung zu tragen, wird nun mein NSLU2, welches als Printserver dient, nunmehr auch den Dienst der Alarmierung übernehmen, wenn mein Netzwerkalarm auslöst. Dafür hab ich eine kleine, jedoch superhelle LED an einem kleinen Atmel, der auch seinerseits über Netzwerk ansteuerbar ist.
Ferner ist das Konstrukt über XMLRPC ansteuerbar und es gibt 4 verschiedene Blinkarten mit Quittierfunktion. Sourcen werden in Kürze hier zu haben sein.

UPDATE: Nun hat das Ding sogar einen Quittiertaster und einen Schlüsselschalter zur Alarmdeaktivierung
