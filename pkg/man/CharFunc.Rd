% Part of the prob package, http://www.prob.rfor.org
% Copyright 2009 G. Jay Kerns
% Distributed under GPL 2 or later

\name{CharFunc}
\alias{cbeta}
\alias{cbinom}
\alias{ccauchy}
\alias{cchisq}
\alias{cexp}
\alias{cf}
\alias{cgamma}
\alias{cgeom}
\alias{chyper}
\alias{clogis}
\alias{clnorm}
\alias{cnbinom}
\alias{cnorm}
\alias{cpois}
\alias{ct}
\alias{cunif}
\alias{cweibull}
\title{Characteristic functions}
\description{
  The characteristic function for selected probability distributions supported
  by \R.  All base distributions are included, with the exception of a few noncentral
  distributions.  For more resources see the References, and for complete
  details and formulas see the vignette "charfunc", which can be accessed by
  \code{vignette("charfunc")} at the command prompt.

}
\usage{
cbeta(x, shape1, shape2, ncp = 0)
cbinom(t, size, prob)
ccauchy(x, location = 0, scale = 1)
cchisq(t, df, ncp=0)
cexp(x, rate = 1)
cf(t, df1, df2, ncp)
cgamma(x, shape, rate = 1, scale = 1/rate)
cgeom(x, prob)
chyper(x, m, n, k)
clnorm(x, meanlog = 0, sdlog = 1)
clogis(x, location = 0, scale = 1)
cnbinom(x, size, prob, mu
cnorm(x, mean = 0, sd = 1)
cpois(x, lambda)
ct(x, df, ncp)
cunif(x, min=0, max=1)
cweibull(x, shape, scale = 1)
}
\arguments{
  \item{t}{numeric vector.}
  \item{df}{degrees of freedom (\eqn{> 0}, maybe non-integer)}
  \item{df1, df2}{numerator and denominator degrees of freedom}
  \item{k}{the number of balls drawn from the urn.}
  \item{lambda}{vector of (non-negative) means.}
  \item{location, scale}{(logis) location and scale parameters.}
  \item{m}{the number of white balls in the urn.}
  \item{meanlog, sdlog}{mean and standard deviation of the distribution
    on the log scale with default values of \code{0} and \code{1} respectively.}
  \item{mean}{vector of means.}
  \item{min,max}{(unif) lower and upper limits of the distribution.  Must be finite.}
  \item{mu}{(nbinom) alternative parametrization via mean}
  \item{n}{the number of black balls in the urn.}
  \item{ncp}{non-centrality parameter \eqn{\delta}}  
  \item{prob}{probability of success in each trial.}
  \item{rate}{an alternative way to specify the scale.}  
  \item{sd}{vector of standard deviations.}
  \item{size}{(binom) number of trials (zero or more).}
  \item{shape, scale}{(gamma) shape and scale parameters.  Must be positive,
    \code{scale} strictly.}
  \item{shape1, shape2}{positive parameters of the Beta distribution.}  
  \item{size}{(nbinom) target for number of successful trials, or dispersion
    parameter (the shape parameter of the gamma mixing distribution).
    Must be strictly positive.}
  \item{shape, scale}{(weibull) shape and scale parameters, the latter defaulting to 1.}  
}
\value{
  The value of the characteristic function, as a complex number in rectangular
  (cartesian) coordinates.
}


\details{
  The characteristic function \eqn{f} of a random variable \eqn{X} is defined by
  \deqn{
    f(t) = E e^{itX} }{
    f(x) = E exp^(-itX)}
  for all \eqn{-\infty < t < \infty}.
  
  Every random variable has a characteristic function, and every characteristic function
  uniquely determines the distribution of its associated random variable.  For
  more details on characteristic functions and their properties, see Lukacs (1970).
  
}



\section{Beta distribution}{
For the probability density function, see \code{\link{dbeta}}.

_{1}F_{1}(shape1; shape1 + shape2, it)

F  is the confluent hypergeometric function, kummerM in the fAsianOptions package.

}


\section{Binomial distribution}{
For the probability mass function, see \code{\link{dbinom}}.

(pe^{it} + (1-p))^n

}


\section{Cauchy Distribution}{
For the probability density function, see \code{\link{dcauchy}}.

e^(i*t*theta - sigma*|t|)

}
\section{Chi-square Distribution}{
For the probability density function, see \code{\link{dchisq}}.

\frac{\exp(\frac{i\delta t}{1 - 2it})}{(1 - 2it)^{df/2}}



}
\section{Exponential Distribution}{
For the probability density function, see \code{\link{dexp}}.

Special case of gamma when alpha = 1

}
\section{F Distribution}{
For the probability density function, see \code{\link{df}}.



For the central F we use confluent hypergeometric function of the second kind,
also known as kummerU, again from the fAsianOptions package,

For noncentral F we use confluent hypergeometric function of the first kind.

}
\section{Gamma Distribution}{
For the probability density function, see \code{\link{dgamma}}.

(1 - beta*i*t)^(-alpha)

}
\section{Geometric Distribution}{
For the probability mass function, see \code{\link{dgeom}}.

Special case of negative binomial when r = 1.

}



\section{Hypergeometric Distribution}{
For the probability mass function, see \code{\link{dhyper}}.

\frac{ _{2}F_{1} }{

}

Gaussian hypergeometric series, see hypergeo in package hypergeo
}


\section{Logistic Distribution}{
For the probability density function, see \code{\link{dlogis}}.

\pi t \cosech \pi t  where

\cosech (x) = 1/\sinh(x)


}


\section{Lognormal Distribution}{
For the probability density function, see \code{\link{dlnorm}}.

This characteristic function is uniquely complicated and delicate.  See the
References.

}
\section{Negative Binomial Distribution}{
For the probability mass function, see \code{\link{dnbinom}}.

(p/(1-(1-p)*e^{it}))^r

}
\section{Normal Distribution}{
For the probability density function, see \code{\link{dnorm}}.

exp(i*mu*t + t^2 * sigma^2 /2)

}
\section{Poisson Distribution}{
For the probability mass function, see \code{\link{dpois}}.

e^(lambda*(e^it - 1))

}



\section{Student's t Distribution}{
For the probability density function, see \code{\link{dt}}.


Modified Bessel Function of the Second kind
K_{\nu}(x) = \frac{\pi}{2}\frac{I_{-\nu}(x) - I_{-\nu}(x)}{\sin(\nu \pi)}

where

I_{\alpha}(x) = i^{-\alpha}J_{\alpha}(ix)


}


\section{Continuous Uniform Distribution}{
For the probability density function, see \code{\link{dunif}}.

\frac{e^(itb) - e^(ita)}{(b - a)it}

}
\section{Weibull Distribution}{
For the probability density function, see \code{\link{dweibull}}.

See the references.


}


\references{

  Lukacs, E. (1970)
  \emph{Characteristic Functions},
  Second Edition. London: Griffin.

  Johnson, N. L., Kotz, S., and Kemp, A. W. (1992)
  \emph{Univariate Discrete Distributions},
  Second Edition. New York: Wiley.

  Johnson, N. L., Kotz, S. and Balakrishnan, N. (1995)
  \emph{Continuous Univariate Distributions}, volume 1.
  Wiley, New York.
  
  Johnson, N. L., Kotz, S. and Balakrishnan, N. (1995)
  \emph{Continuous Univariate Distributions}, volume 2. 
  Wiley, New York.

  Abramowitz, M. and Stegun, I. A. (1972)
  \emph{Handbook of Mathematical Functions.} New York: Dover.
  Chapter 6: Gamma and Related Functions.

}
\seealso{
  \code{\link{exp}} for the exponential function,
  \code{\link{dgamma}} for the gamma distribution and
  \code{\link{dweibull}} for the Weibull distribution, both of which
  generalize the exponential.
}

\examples{
cexp(1)
}
\keyword{distribution}
