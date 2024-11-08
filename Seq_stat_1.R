library(seqinr)
library(rentrez)

# Function to fetch the sequence from NCBI using accession number
get_ncbiseq_rentrez <- function(accession) {
  # Fetch the sequence from the NCBI nucleotide database
  seq_data <- tryCatch({
    # Fetch the sequence in FASTA format
    entrez_fetch(db = "nucleotide", id = accession, rettype = "fasta", retmode = "text")
  }, error = function(e) {
    return(paste("Error fetching sequence:", e$message))
  })
  
  return(seq_data)
}

# Example usage with the accession number for Monkeypox virus
monkeypox_seq <- get_ncbiseq_rentrez("ON563414.3")

# Check if we have valid sequence data
if (!grepl("^>", monkeypox_seq)) {
  stop("Failed to fetch sequence data.")
}

# Extract the sequence and save it to a file in FASTA format
# The `monkeypox_seq` is already in FASTA format, so we can directly write it
writeLines(monkeypox_seq, "Monkeypox.fasta")

# Check the contents of the file
cat("Sequence saved to 'Monkeypox.fasta'.")


monkey <-read.fasta(file = "Monkeypox.fasta")

#converting the file to a vector
monkeyseq <-monkey[[1]]

#length of a sequence
length(monkeyseq)

#base composition of sequence
table(monkeyseq)

#GC content of DNA
GC(monkeyseq)

#Find frequency of DNA words
count(monkeyseq,3)
#Gives like nth element of table has what value
monkeytable[[3]]
#Count how many particular frequencies are present 
monkeytable[['tcc']]

