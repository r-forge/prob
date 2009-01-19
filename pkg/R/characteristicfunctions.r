
#  Characteristic functions
#  Released under GPL 2 or greater
#  Copyright January 2009, G. Jay Kerns


cbeta <- function(t, shape1, shape2){
    require(fAsianOptions)
    kummerM(1i*t, shape1, shape1 + shape2)
}


cbinom <- function(t, size, prob){
    (prob*exp(1i*t) + (1 - prob))^size
}


ccauchy = function(t, location = 0, scale = 1){
    exp(1i*location*t)*exp(-scale*abs(t))  
}

cchisq <- function(t, df, ncp = 0){
    exp(1i*ncp*t/(1-2i*t))/(1 - 2i*t)^(df/2)
}

cexp <- function(t, rate = 1){
    cgamma(t, shape = 1, scale = 1/rate)
}

cf <- function(t, df1, df2, ncp = 0, kmax = 10){
    require(fAsianOptions)
    if( identical(all.equal(ncp, 0), TRUE) ){
        gamma((df1+df2)/2) / gamma(df2/2) * kummerU(-1i*df2*t/df1, df1/2, 1 - df2/2)
    } else {
        exp(-ncp/2)*sum((ncp/2)^(0:kmax)/factorial(0:kmax)*kummerM(-1i*df2*t/df1, df1/2 + 0:kmax, -df2/2))
    }
}


cgamma <- function(t, shape, rate = 1, scale = 1/rate){
    (1-scale*1i*t)^(-shape)
}


cgeom <- function(t, prob){
    cnbinom(t, size = 1, prob = prob)
}



chyper <- function(t, m, n, k){
    require(hypergeo)
    hypergeo(-k, -m, n - k + 1, exp(1i*t))/hypergeo(-k, -m, n - k + 1, 1)
}



clogis <- function(t, location = 0, scale = 1){
    ifelse( identical(all.equal(t, 0), TRUE),
            return(1),
            return(exp(1i*location)*pi*scale*t/sinh(pi*scale*t)))
}


cnbinom <- function(t, size, prob, mu){
     if (!missing(mu)) {
        if (!missing(prob)) 
            stop("'prob' and 'mu' both specified")
        prob <- size/(size+mu)
    }
    (prob/(1-(1-prob)*exp(1i*t)))^size
}


cnorm <- function(t, mean = 0, sd = 1){
    exp(1i*mean - (sd*t)^2/2)  
}

cpois <- function(t, lambda){
    exp(lambda*(exp(1i*t) - 1))
}


ct <- function(t, df){
    besselK(sqrt(df)*abs(t), df/2)*(sqrt(df)*abs(t))^(df/2)/( gamma(df/2) * 2^(df/2 - 1) )
}


cunif <- function(t, min = 0, max = 1){
    ifelse( identical(all.equal(t, 0), TRUE),
            1,
            (exp(1i*t*max) - exp(1i*t*min))/(1i*t*(max - min)))
}

cweibull <- function(t, shape, scale = 1, kmax = 10){
    1 + sum((1i*t)^(0:kmax+1)/factorial(0:kmax) * scale^(0:kmax+1)/shape * gamma((0:kmax+1)/scale) )
}


# hermite.h.polynomials {orthopolynom}


clnorm <- function(t, meanlog = 0, sdlog = 1, kmax = 10){
    require(orthopolynom)
    He <- hermite.h.polynomials(kmax, normalized = TRUE)
    ne <- nielsen(kmax)
    v <- c()
    for (l in 1:(kmax+1)){
        v[l] <- (-1)^l*ne[l]*(2*sdlog^2)^(-l/2)*as.function(He[[l]])((log(t) + meanlog + 1i*pi/2)/(sdlog*sqrt(2)))
    }
    sqrt(pi/2/sdlog^2) * exp(-(log(t) + meanlog + 1i*pi/2)^2/(2*sdlog^2)) * sum(v)
}


nielsen <- function(m){
    eulerg <- 0.5772142369446214
    d <- c(1, eulerg)
    for (n in 2:m){    
        d[n+1] <- (eulerg*d[n] + sum(VGAM:::zeta(2:n) * rev( (-1)^(0:(n-2)) * d[1:(n-1)])) )/(n+1)
    }
    return(d)
}
