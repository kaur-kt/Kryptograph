Krüpteerib sisendfailis soolaga täiendatud isikukoodid algoritmiga SHA-256,
kasutades selleks moodulit -> digest.

Sisendfail (päisega) csv kujul:
ID - isikukood (11 kohaline kood)
NIMI - inimese nimi
VANUS - numbrilisel kujul vanus

Tulemuseks (päisega) väljundfail csv kujul:
ID - räsi mis saadakse ID+salt algoritmiga SHA256 krüpteerides
NIMI - nimi algsel kujul
VANUS - vanus muutmata kujul
