library(dplyr)
library(tidyr)

# Fonction pour séparer les valeurs séparées par des virgules en colonnes distinctes
separer_valeurs <- function(data, colonne) {
  valeurs <- strsplit(data[[colonne]], ",")
  max_valeurs <- max(sapply(valeurs, length))
  noms_colonnes <- paste0(colonne, "_", 1:max_valeurs)
  
  valeurs <- lapply(valeurs, function(x) {
    if (length(x) < max_valeurs) {
      x <- c(x, rep(NA, max_valeurs - length(x)))
    }
    as.numeric(x)
  })
  
  data[noms_colonnes] <- as.data.frame(do.call(rbind, valeurs))
  data
}

# Fonction pour calculer le 1RM
calculer_1RM <- function(poids, reps) {
  # Formule d'estimation du 1RM basée sur la formule d'Epley
  return(round(poids / (1.0279 - (0.0278*reps)),1))
}