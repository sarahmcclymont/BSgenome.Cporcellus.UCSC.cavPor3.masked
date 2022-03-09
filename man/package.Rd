\name{BSgenome.Cporcellus.UCSC.cavPor3.masked}
\docType{package}

\alias{BSgenome.Cporcellus.UCSC.cavPor3.masked-package}
\alias{BSgenome.Cporcellus.UCSC.cavPor3.masked}

\title{Full masked genome sequences for Cavia porcellus (UCSC version cavPor3)}

\description{
  Full masked genome sequences for Cavia porcellus (Guinea pig) as provided by UCSC (cavPor3)
}

\details{
  
}

\note{
  The masks in this BSgenome data package were made from the following
  source data files:
  \preformatted{
AGAPS masks: gap.txt.gz from https://hgdownload.soe.ucsc.edu/goldenPath/cavPor3/database/ RM masks: cavPor3.fa.out.gz  from https://hgdownload.soe.ucsc.edu/goldenPath/cavPor3/bigZips/ TRF masks: cavPor3.trf.bed.gz  from https://hgdownload.soe.ucsc.edu/goldenPath/cavPor3/bigZips/
  }

  See \code{?\link[BSgenome.Cporcellus.UCSC.cavPor3]{BSgenome.Cporcellus.UCSC.cavPor3}} in the
  \pkg{BSgenome.Cporcellus.UCSC.cavPor3} package for information about how the sequences
  were obtained.

  See \code{?\link[BSgenome]{BSgenomeForge}} and the BSgenomeForge
  vignette (\code{vignette("BSgenomeForge")}) in the \pkg{BSgenome}
  software package for how to make a BSgenome data package.
}

\author{Sarah McClymont}

\seealso{
  \itemize{
    \item \link[BSgenome.Cporcellus.UCSC.cavPor3]{BSgenome.Cporcellus.UCSC.cavPor3} in the \pkg{BSgenome.Cporcellus.UCSC.cavPor3} package
          for information about how the sequences were obtained.
    \item \link[BSgenome]{BSgenome} objects and the
          \code{\link[BSgenome]{available.genomes}} function
          in the \pkg{BSgenome} software package.
    \item \link[Biostrings]{MaskedDNAString} objects in the \pkg{Biostrings}
          package.
    \item The BSgenomeForge vignette (\code{vignette("BSgenomeForge")})
          in the \pkg{BSgenome} software package for how to make a BSgenome
          data package.
  }
}

\examples{
BSgenome.Cporcellus.UCSC.cavPor3.masked
genome <- BSgenome.Cporcellus.UCSC.cavPor3.masked
head(seqlengths(genome))


if ("AGAPS" \%in\% masknames(genome)) {

  ## Check that the assembly gaps contain only Ns:
  checkOnlyNsInGaps <- function(seq)
  {
    ## Replace all masks by the inverted AGAPS mask
    masks(seq) <- gaps(masks(seq)["AGAPS"])
    unique_letters <- uniqueLetters(seq)
    if (any(unique_letters != "N"))
        stop("assembly gaps contain more than just Ns")
  }

  ## A message will be printed each time a sequence is removed
  ## from the cache:
  options(verbose=TRUE)

  for (seqname in seqnames(genome)) {
    cat("Checking sequence", seqname, "... ")
    seq <- genome[[seqname]]
    checkOnlyNsInGaps(seq)
    cat("OK\n")
  }
}

## See the GenomeSearching vignette in the BSgenome software
## package for some examples of genome-wide motif searching using
## Biostrings and the BSgenome data packages:
if (interactive())
    vignette("GenomeSearching", package="BSgenome")
}

\keyword{package}
\keyword{data}
