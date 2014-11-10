.. title: OpenID und Sicherheit
.. slug: openid-und-sicherheit
.. date: 2010-07-07 18:59:12 UTC+01:00
.. tags: german,security
.. link:
.. description:
.. type: text

OpenID fristet teilweise noch ein Nischen Dasein, zu unrecht wie ich finde.

Was ist OpenID?
---------------
Nunja, im Prinzip soll es die Kombination von Benutzername und Passwort an einer Stelle zusammenführen und dort noch mit optionalem Token (ein Zertifikat, ein Handy, ein digitaler Schlüsselanhänger oder ähnlich greifbares) absichern. Dann loggt man sich dort mit dem Browser ein, besucht danach eine Seite, wo man sich mit dieser ID einloggen kann (z.B. stackoverflow.com) und dann ganz ohne Passwort.

Sicherheit bei OpenID?
----------------------
Zunächst kommt dann erstmal große Paranoia auf, weil man ja nur einmal diese Daten hacken müsste. Im Prinzip richtig, aber dafür gibts ja eben besagtes Token. Und dafür hat z.B. Verisign für alle gängigen Handys und Smartphones eine Software geschrieben, die alle 30 Sekunden einen 6 stelligen einmaligen Zugriffscode erzeugt. Die Technologie dieser Sicherheitscodes kommt auch bei Paypal und eBay zum Einsatz, sofern man dies wünscht. Ein Zeichen, dass dieses also eine gute Technologie ist. Ferner soll es ja nur Benutzername und Passwort ersetzen. Und mal Hand aufs Herz, man speichert Passwörter immer im Browser, weil man sie sich nicht merken kann oder noch schlimmer, man hat nur ein Einziges. Da ist das doch eine deutlich sicherere Alternative, weil zumindest beim OpenID-Provider dann Benutzername, Passwort und besagter 30 Sekunden Code geknackt werden müssen. Für letzteren hat man nur 3 Versuche, dann muss man auf einen neuen Code warten. Aufwand also ungleich größer. Verhalten kann man auch einstellen, also ob die Login Session pauschal nach 30 Minuten abläuft oder nur solange die Seite in einem Tab offen ist, je nach dem, was subjektiv mehr zusagt.

Wer kann OpenID Server betreiben?
---------------------------------
Im Prinzip kann das jeder. Jedoch gibt es eine kleine Einschränkung. Große, bekannte Seiten akzeptieren neue Betreiber nur nach eingehender Prüfung, um sicherzustellen, dass nicht jedermann hier einen unsicheren Dienst betreibt und damit in dortiges Netz eindringen kann.

Fazit
-----
Da beim Anbieter kein Passwort mehr hinterlegt ist, wird das Hackrisiko sehr stark zentralisiert und ist damit gut abzusichern. Tip: Manche Seitenbetreiber speichern Passwörter im Klartext in einer Datenbank. Ein Hack der Seite (genannt SQL Injections, für Interessierte) und schon ist das vermeintlich tolle Passwort bekannt. Da man meist nur eins oder zwei hat, lohnt sich für die Hacker ein Ausprobieren auf großen, bekannten Seiten, da dort wahrscheinlich der Benutzername dann identisch ist und schon ist z.B. das Facebook Profil gekapert. Danach viel Spass beim Ändern der ganzen Passwörter, es ist ja nicht zentralisiert möglich. Wesentlich mehr Sicherheit als eine Benutzer/Passwortkombination soll OpenID auch nicht bieten und das tut es sehr gut. Ferner wenn das Passwort an dieser einen Stelle regelmäßig geändert wird, braucht man sich ja auch nur wieder dieses eine zu merken. Daher: Verbreitet OpenID, auch eure Webseite kann das nutzen!

Links
-----
`Bekannte Anbieter von OpenIDs <http://bit.ly/dtQx9L>`_

`Japanische Regierung akzeptiert OpenID auf Webseite <http://bit.ly/cNz7Zb>`_
