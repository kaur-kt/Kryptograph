#######
#  Krüpteerib sisendfailis soolaga täiendatud isikukoodid algoritmiga SHA-256
#  kasutades selleks moodulit -> digest 
# #####

# Vajalik pakett
if (!require("digest")) {
  install.packages("digest")
  library(digest)
}

# Failinimed
sisendfail <- "sisend.csv"
valjundfail <- "valjund.csv"

# Defineerime salt (soovitatav: juhuslik string) – siin võiks muidugi midagi randomiga ka genereerida
salt <- "test123"

# Loeme andmed sisendfailist
andmed <- read.csv(sisendfail, stringsAsFactors = FALSE)

# Kontrollime ID ja VANUS, et ID oleks 11 kohaline kood ja VANUS numbri kujul
andmed$ID <- as.character(andmed$ID)
andmed <- andmed[nchar(andmed$ID) == 11 & grepl("^[0-9]+$", andmed$ID), ]
andmed$VANUS <- as.numeric(andmed$VANUS)
andmed <- andmed[!is.na(andmed$VANUS), ]

# SHA256 + salt, krüpteerimise funktsioon
krupteeri_ID <- function(id, salt) {
  digest(paste0(id, salt), algo = "sha256", serialize = FALSE)
}

# Krüpteerime ID väljad
andmed$ID <- sapply(andmed$ID, krupteeri_ID, salt = salt)

# Kirjutame krüpteeritud andmed faili
write.csv(andmed, valjundfail, row.names = FALSE)


cat("Andmed töödeldud ja kirjutatud faili:", valjundfail, "\n")
