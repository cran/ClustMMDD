% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ClustMMDD.R
\name{em.cluster.R}
\alias{em.cluster.R}
\title{Compute estimates of the parameters by Expectation and Maximization algorithm.}

\description{
Compute an approximation of the maximum likelihood estimates of parameters using Expectation and Maximization (EM) algorithm. 
A maximum a posteriori classification is then derived from the estimated set of parameters.
}

\usage{
em.cluster.R(xdata, K, S, ploidy = 1, emOptions = list(epsi = NULL,
  typeSmallEM = NULL, typeEM = NULL, nberSmallEM = NULL, nberIterations = NULL,
  nberMaxIterations = NULL, putThreshold = NULL), cte = 1)
}
\arguments{
\item{xdata}{A matrix of strings with the number of columns equal to ploidy * (number of variables).}

\item{K}{The number of clusters (or populations).}

\item{S}{The subset of clustering variables in the form of a vector of logicals indicating the selected variables. \eqn{S} gathers variables that are not identically distributed in at least two clusters.}

\item{ploidy}{The number of unordered observations represented by a string in \code{xdata}. For example, for genotypic data from diploid individual, \eqn{ploidy = 2}.}

\item{emOptions}{A list of EM options (see \code{\link{EmOptions}} and \code{\link{setEmOptions}}).}

\item{cte}{A double used as a value of \eqn{\lambda} in the penalty function \eqn{pen(K,S)=\lambda*dim\left(K,S\right)},
    where \eqn{dim\left(K,S\right)} is the number of free parameters in the model defined by \eqn{\left(K,S\right)}.}
}
\value{
A list of
	\itemize{
		\item{N : }{The size (number of lines) of the dataset.}
		\item{K : }{The number of clusters (populations).}
		\item{S : }{A vector of logicals indicating the selected variables for clustering.}
		\item{dim : }{The number of free parameters.}
		\item{pi_K : }{The vector of mixing proportions.}
		\item{prob : }{A list of matrices, each matrix being the probabilities of a variable in different clusters.}
		\item{logLik : }{The log-likelihood.}
		\item{entropy : }{The entropy.}
		\item{criteria : }{Criteria values c(BIC, AIC, ICL, CteDim).}
		\item{Tik : }{A stochastic matrix given the a posteriori membership probabilities.}
		\item{mapClassif : }{Maximum a posteriori classification.}
		\item{NbersLevels : }{The numbers of observed levels of the considered categorical variables.}
		\item{levels : }{The observed levels.}
	}
}

\examples{
data(genotype1)
head(genotype1)
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)

#See the EM options
EmOptions() # Options can be set by \code{\link{setEmOptions()}}
par5 = em.cluster.R (genotype2, K = 5, S = c(rep(TRUE, 8), rep(FALSE, 2)), ploidy = 2)
slotNames(par5)
head(par5["membershipProba"])
par5["mixingProportions"]
par5
}
\author{
Wilson Toussile.
}
\references{
\itemize{
		\item  \href{http://projecteuclid.org/euclid.ejs/1379596773}{Dominique Bontemps and Wilson Toussile (2013)} : Clustering and 
		variable selection for categorical multivariate data. Electronic Journal of Statistics, Volume 7, 2344-2371, ISSN.
		
		\item 	\href{http://link.springer.com/article/10.1007\%2Fs11634-009-0043-x}{Wilson Toussile and Elisabeth Gassiat (2009)} : Variable 
		selection in model-based clustering using multilocus genotype data. Adv Data Anal Classif, Vol 3, number 2, 109-134.
	}
}
\seealso{
\code{\link{dataR2C}} for transformation of a classic data frame, \code{\link{backward.explorer}}, \code{\link{selectK.R}}, 
\code{\link{dimJump.R}}, \code{\link{model.selection.R}} for both model selection and classification. 
}
\keyword{Classification}
\keyword{Clustering}
\keyword{Expectation and Maximization}
\keyword{Stochastic Expectation and Maximization}
\keyword{Classification Expectation and Maximization}
\keyword{Maximum a posteriori classification}


