# 1
#########################
## Accept-reject for
## Beta(4,3) distribution
## Using U(0,1) proposal
#########################
set.seed(1)
beta_ar <- function() 
{
  c <- 60 *(3/5)^3 * (2/5)^2 
  accept <- 0
  counter <- 0   # count the number of loop
  while(accept == 0)
  {
    counter <- counter + 1
    
    # fill in the lines of code here to implement
    # ...
    # ...
    U <- runif(1 ,0,1)
    prop <- runif(1,0,1)
    ratio <- dbeta(prop, 4 , 3) / (c * dunif(prop , 0 , 1))
    
    if(U <= ratio)
    {
      accept <- 1
      return(c(prop, counter))
    }
  }
}


### Obtaining 10^4 samples from Beta() distribution
N <- 1e4
samp <- numeric(length = N)
counts <- numeric(length = N)
for(i in 1:N)
{
  rep <- beta_ar()  ## fill in
    samp[i] <-  rep[1] ## fill in
    counts[i] <- rep[2] ## fill in
}

# Make a plot of the estimated density from the samples
# versus the true density
x <- seq(0, 1, length = 500)
plot(density(samp), main = "Estimated density from 1e4 samples")
lines(density(rbeta(1e4 , 4,3))   , col = "red", lty = 2) ## Complete this
legend("topleft", lty = 1:2, col = c("black", "red"), legend = c("AR", "truth"))

# This is c
(c <- 60 *(3/5)^3 * (2/5)^2)

# This is the mean number of loops required
mean(counts)

#They should be almost the same!











# 3

##################################
## Accept-reject for obtaining
## sample uniformlyfrom a standard circle
## using a box as a proposal
##############################
set.seed(1)
circle_ar <- function() 
{
  accept <- 0
  counter <- 0   # count the number of loop
  while(accept == 0)
  {
    counter <- counter + 1
    # Fill code here for accept-reject
    # ...
    # ...
    c <- (4*7) / 22 +1
    x <- runif(1,-1,1)
    y <- runif(1,-1,1)
    prop <- c(x,y)
    
    if( x^2 + y^2 <= 1 ) # fill condition
    {
      accept <- 1
      return(c(prop, counter))
    }
  }
}

# Simulation 10^4 samples from circle
N <- 1e4
samp <- matrix(0, ncol = 2, nrow = N)
counts <- numeric(length = N)
for(i in 1:N)
{
  foo <- circle_ar()  # I use foo as a dummy name
  samp[i,] <- foo[1:2]
  counts[i] <- foo[3]
}


4/pi
# [1] 1.27324
mean(counts)  # should be very close

# Plotting the obtained samples
# no paritcular part of the circle is favored more
# than any other part.
plot(samp[,1], samp[,2], xlab = "x", ylab = "y", 
     main = "Uniform samples from a circle", asp = 1)


# 4

# Probability of acceptance
N <- 1e4
samp <- matrix(0, ncol = 2, nrow = N)
counts <- numeric(length = N)
for(i in 1:N)
{
  foo <- circle_ar()  # I use foo as a dummy name
  samp[i,] <- foo[1:2]
  counts[i] <- foo[3]
}

p <- 1e4 / sum(counts)

pi / 4
# Yes, probability is approximately equal to pi / 4

# 4 (b)
set.seed(1)
pcircle_ar <- function(p) 
{
  accept <- 0
  counter <- 0   # count the number of loop
  while(accept == 0)
  {
    counter <- counter + 1
    # Fill code here for accept-reject
    # ...
    # ...
    c <- (4*7) / 22 +1
    
    prop <- numeric(length = p)
    for (i in 1:p)
    {
      prop[i] <- runif(1, -1,1)
    }
    
    if( norm(prop , type = "2") <= 1 ) # fill condition
    {
      accept <- 1
      return(c(prop, counter))
    }
  }
}
















