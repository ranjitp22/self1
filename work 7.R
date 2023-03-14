## question 2
## Newton Rapson

func <- function(X)
{
  return(cos(X))

}

# parametric space = -pi to 3*pi
X <- seq (-pi , 3*pi , length= 1e3)
plot(X, func(X), type = 'l')
abline(h= 0)

tol <- 1e-5

f.prime <- function(X)
{
  rtn <- - sin(X)  #f.prime
  return(rtn)
}

# Returns double derivative of objective function.
f.double.prime <- function(X)
{
  rtn <- - cos(X)
  return(rtn)
}
opt <- numeric(length = 3)
# first concave region
current <- -pi / 4
diff <- 100  # inital large value for difference
iter <- 0    # counting the number of iterations
x.k <- current
while( (diff > tol) && iter < 100)
{
  iter <- iter + 1
  update <- current - f.prime(current)/f.double.prime(current)  # NR update
  x.k <- c(x.k, update)
  diff <- abs(current - update)
  current <- update
}
opt[1] <- current  # final approximation to MLE
evals <- sapply(x.k, func)
points(x.k, evals, pch = 16, col = rgb(0,0,1, alpha = .5))

#convex region
current <- (-pi / 4) + pi
diff <- 100  # inital large value for difference
iter <- 0    # counting the number of iterations
x.k <- current
while( (diff > tol) && iter < 100)
{
  iter <- iter + 1
  update <- current - f.prime(current)/f.double.prime(current)  # NR update
  x.k <- c(x.k, update)
  diff <- abs(current - update)
  current <- update
}
opt[2] <- current  # final approximation to MLE
evals <- sapply(x.k, func)
points(x.k, evals, pch = 16, col = rgb(0,1,0, alpha = .5))

#third region
current <- (-pi / 4) + (2*pi)
diff <- 100  # inital large value for difference
iter <- 0    # counting the number of iterations
x.k <- current
while( (diff > tol) && iter < 100)
{
  iter <- iter + 1
  update <- current - f.prime(current)/f.double.prime(current)  # NR update
  x.k <- c(x.k, update)
  diff <- abs(current - update)
  current <- update
}
opt[3] <- current  # final approximation to MLE
evals <- sapply(x.k, func)
points(x.k, evals, pch = 16, col = rgb(1,0,0, alpha = .5))

which.max(func(opt))
optimum <- opt[which.max(func(opt))]  #Maxima




###### Gradient Asscend

func <- function(X)
{
  return(cos(X))
  
}
# parametric space = -pi to 3*pi
X <- seq (-pi , 3*pi , length= 1e3)
plot(X, func(X), type = 'l')
abline(h= 0)

tol <- 1e-5

f.prime <- function(X)
{
  rtn <- - sin(X)  #f.prime
  return(rtn)
}

current <- 