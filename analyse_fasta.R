# TP bioinformatique : analyse du FASTA UniProt "cytokine"
# Personne 2 : lecture du fichier et symboles distincts

getwd()
list.files()

# Chemin du fichier (à adapter selon l'ordinateur)
fichier <- "C:/Users/PMS/Downloads/uniprotkb_cytokine_2026_11_10.fasta.gz"

# Lecture du fichier compressé
con <- gzfile(fichier, "r")
lignes <- readLines(con)
close(con)

# Les lignes qui commencent par ">" sont les en-têtes (1 par entrée)
est_entete <- startsWith(lignes, ">")
cat("Nombre d'entrées :", sum(est_entete), "\n")

# Les autres lignes contiennent les acides aminés
lignes_seq <- lignes[!est_entete]
sequence_totale <- paste(lignes_seq, collapse = "")
sequence_totale <- toupper(sequence_totale)
residus <- strsplit(sequence_totale, NULL)[[1]]

# Symboles distincts et fréquences
symboles_distincts <- sort(unique(residus))
print(symboles_distincts)
print(sort(table(residus), decreasing = TRUE))
