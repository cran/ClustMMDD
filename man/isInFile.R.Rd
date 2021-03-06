% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ClustMMDD.R
\name{isInFile.R}
\alias{isInFile.R}
\title{Find a model in a file.
}

\usage{
isInFile.R(K, S, file, header)
}

\arguments{
\item{K}{The number of clusters.}

\item{S}{A vector of logicals of length equal to the number of variables, that indicates the clustering variables.}

\item{file}{A file where to find the model.}

\item{header}{A logical indicating if the file contains a header or not.}
}
\value{
 A list :
	\itemize{
		\item{TrueFalse : }{A logical indicating if the given model was found and the following if TRUE.}
		\item{line : }{The line where the given is in the file.}
		\item{N : }{The size of the dataset from which the model was estimated.}
		\item{logLik : }{The log-likelihood.}
		\item{dim : }{The dimension of the model = number of free parameters.}
		\item{entropy : }{The entropy associated to estimated parameters of the models.}
	}
}
\description{
Find a given model defined by (K, S) in a file.
}
\examples{
data(genotype1)
head(genotype1) 
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)

S = c(rep(TRUE, 8), rep(FALSE, 2))
\dontrun{
outPut = selectK.R(genotype2, S, Kmax = 6, ploidy = 2, Kmin=1)
isInFile.R(K = 5, S, "genotype2_ExploredModels.txt", header = TRUE)
isInFile.R(K = 5, rep(TRUE, 10), "genotype2_ExploredModels.txt", header = TRUE)

file.remove("genotype2_ExploredModels.txt")
}}
\author{
Wilson Toussile
}
\references{
\itemize{
		\item  \href{http://projecteuclid.org/euclid.ejs/1379596773}{Dominique Bontemps and Wilson Toussile (2013)} : Clustering and 	variable selection for categorical multivariate data. Electronic Journal of Statistics, Volume 7, 2344-2371, ISSN.
		
		\item 	\href{http://link.springer.com/article/10.1007\%2Fs11634-009-0043-x}{Wilson Toussile and Elisabeth Gassiat (2009)} : Variable 	selection in model-based clustering using multilocus genotype data. Adv Data Anal Classif, Vol 3, number 2, 109-134.
	}
}

