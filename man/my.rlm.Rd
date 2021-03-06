\name{my.rlm}
\alias{my.rlm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{MM-regression estimators. 
%%  ~~function to do ... ~~
}
\description{This function computes MM-regression estimators.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
my.rlm(x, y, control = rlm.control())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Design matrix, each vector of covariates in a row.
%%     ~~Describe \code{x} here~~
}
  \item{y}{Vector of response variables.
%%     ~~Describe \code{y} here~~
}
  \item{control}{List of control options as returned by \code{\link{rlm.control}}.
%%     ~~Describe \code{control} here~~
}
}
\details{This function computes an MM-regression estimator. 
%%  ~~ If necessary, more details than the description above ~~
}
\value{The function returns a list with the following components:
\item{coef }{Vector of MM-regression estimates}
\item{scale }{Estimated residual scale}
\item{coef.s }{Vector of S-regression estimates}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{Matias Salibian-Barrera
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{rlm.control}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, y, control = rlm.control()) 
{
    x <- as.matrix(x)
    M <- control$M
    Nres <- control$Nres
    seed <- control$seed
    fixed <- control$fixed
    tuning.chi <- control$tuning.chi
    tuning.psi <- control$tuning.psi
    max.it <- control$max.it
    groups <- control$groups
    n.group <- control$n.group
    k.fast.s <- control$k.fast.s
    n <- nrow(x)
    p <- ncol(x)
    a <- .C("R_S_rlm", as.double(x), as.double(y), as.integer(n), 
        as.integer(p), as.integer(Nres), as.integer(max.it), 
        s = as.double(0), beta.s = as.double(rep(0, p)), beta.m = as.double(rep(0, 
            p)), as.integer(1), as.integer(seed), as.double(tuning.chi), 
        as.double(tuning.psi), as.integer(groups), as.integer(n.group), 
        as.integer(k.fast.s))
    return(list(coef = a$beta.m, scale = a$s, coef.s = a$beta.s))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
