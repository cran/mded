\name{mded}
\alias{mded}
\alias{print.mded}

\title{
Measuring the difference between two empirical distributions
}
\description{
The function measures the difference between two independent or non-independent empirical distributions and returns a significance level of the difference.
}
\usage{
mded(distr1, distr2, detail = FALSE, independent = TRUE)

\method{print}{mded}(x, digits = max(3, getOption("digits") - 3), ...)

}
\arguments{
  \item{distr1}{
A vector of empirical distribution. \code{distr1} is greater than \code{distr2}.
}
  \item{distr2}{
A vector of empirical distribution.
}
  \item{detail}{
If \code{TRUE}, a vector of the difference between \code{distr1} and \code{distr2} is returned.
}
  \item{independent}{
Set as \code{FALSE} when \code{distr1} and \code{distr2} are not independent of each other.
}
  \item{x}{
An object of S3 class 'mded.'
}
  \item{digits}{
A number of significant digits.
}
  \item{...}{
Arguments passed to the function \code{print}.
}
}
\details{
The function measures the difference between two independent or non-independent empirical distributions and returns a significance level of the difference on the basis of the methods proposed by Poe et al. (1997, 2005). Such calculations are frequently needed in empirical econometric studies wherein (marginal) willingness-to-pay distributions that are estimated using contingent valuation methods or discrete choice experiments have to be compared to each other.

Let us assume that X and Y are empirical distributions, which are depicted by the vector \bold{x} = (x1, x2, ..., xm), and \bold{y} = (y1, y2, ..., yn). The null hypothesis (H0) is X - Y = 0, while the alternative hypothesis (H1) is X - Y > 0. When X and Y are independent of each other, the complete combinatorial method (Poe et al. 2005) provides the one-sided significance level of H0 that is calculated by #\{xi - yj <= 0\} / m * n, where #\{\emph{cond}\} provides the number of times that \emph{cond} is true. When X and Y are not independent of each other, the paird difference method (Poe et al. 1997) provides the one-sided significance level of H0 that is calculated by #\{xi - yi <= 0\} / m, where m is equal to n. 

Note that the function may take quite long, and would require large amount of memory to calculate the difference between two \emph{independent} distributions if the argument \code{detail} is set as \code{TRUE} because the resulting difference is stored as a vector. For example, when \code{distr1} and \code{distr2} each contain 10,000 elements (observations), the vector of the difference contains 100,000,000 elements. If memory is lacking, R would stop running the function, showing an error message related to memory limitaion.
}
\value{
  \item{stat }{
One-side significance level of the difference between \code{distr1} and \code{distr2}.
}
  \item{means }{
A vector of mean values of \code{distr1} and \code{distr2}.
}
  \item{cases }{
A vector of integer values describing a number of cases wherein the \emph{cond} is true and that is false.
}
  \item{distr1 }{
A vector assigned to \code{distr1}.
}
  \item{distr2 }{
A vector assigned to \code{distr2}.
}
  \item{distr.names }{
A vector of the names of objects assigned to \code{distr1} and \code{distr2}.
}
  \item{diff }{
A vector of the difference. If \code{detail = TRUE}, it is returned.
}
}
\references{
Poe GL, Giraud KL, Loomis JB (2005). Computational methods for measuring the difference of empirical distributions. \emph{American Journal of Agricultural Economics}, \bold{87}, 353--365.

Poe GL, Severance-Lossin EK, Welsh WP (1994). Measuring the difference (X - Y) of simulated distributions: A convolutions approach. \emph{American Journal of Agricultural Economics}, \bold{76}, 904--915.

Poe GL, Welsh MP, Champ PA (1997). Measuring the difference in mean willingness to pay when dichotomous choice contingent valuation responses are not independent. \emph{Land Economics}, \bold{73}, 255--267.
}
\author{
Hideo Aizaki
}
\examples{
set.seed(123)
x <- rnorm(100, 3)
y <- rnorm(100, 1)

out <- mded(distr1 = x, distr2 = y, detail = TRUE)
out
}
\keyword{ htest }

