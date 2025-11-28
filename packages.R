
# CRAN packages set-up
setup <- function(){
  needed <- c(
    "adegenet", "ape", "dplyr", "ggplot2", "hierfstat", "pegas", 
    "poppr", "purrr", "reshape2", "rnaturalearth", 
    "rnaturalearthdata", "scales", "sf", "tidyr", "vcfR", "viridis"
  )
  for(package in needed){
    if(!sum(installed.packages() %in% package)){
      install.packages(package)
    }
    
    require(package, character.only = TRUE)
  }
}

setup()

# Bioconductor packages set-up

bioc_setup <- function() {
  needed <- c(
    "treeio", "ggtree", "dartR.base", "SNPRelate", "snpStats"
  )
  
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    suppressMessages(install.packages("BiocManager", quiet = TRUE))
  }
  
  # First, install all packages if missing
  for (pkg in needed) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      suppressMessages(
        BiocManager::install(pkg, ask = FALSE, update = FALSE, quiet = TRUE)
      )
    }
  }
  
  # Then load all packages
  for (pkg in needed) {
    suppressPackageStartupMessages(library(pkg, character.only = TRUE))
  }
}

# Run the function
bioc_setup()