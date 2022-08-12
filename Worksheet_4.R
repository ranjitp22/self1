library(imager)
getwd()
setwd(dir = "/users/math/msc/ranjitp22/Downloads")
dog <- load.image("dog.jpeg")

#(a)
plot(dog)
col.mat <- as.array(dog[, ,1,])
dims <- dim(col.mat)
dims
dist <- matrix(0,nrow = dims[1], ncol = dims[2])
for( i in 1:dims[1])
{
  for( j in 1:dims[2])
    dist[i,j] <- norm(col.mat[i,j, ] - c(0,1,0), "2")
}
ind1 <- which(dist == min(dist),arr.ind = TRUE)
?which
plot(dog)
points(ind1 , col = "Red")

#(b)

#Purest Red
dims <- dim(col.mat)
dims
dist <- matrix(0,nrow = dims[1], ncol = dims[2])
for( i in 1:dims[1])
{
  for( j in 1:dims[2])
    dist[i,j] <- norm(col.mat[i,j, ] - c(1,0,0), "2")
}
ind1 <- which(dist == min(dist),arr.ind = TRUE)
?which
plot(dog)
points(ind1 , col = "Red")

#Purest Blue
dims <- dim(col.mat)
dims
dist <- matrix(0,nrow = dims[1], ncol = dims[2])
for( i in 1:dims[1])
{
  for( j in 1:dims[2])
    dist[i,j] <- norm(col.mat[i,j, ] - c(0,0,1), "2")
}
ind1 <- which(dist == min(dist),arr.ind = TRUE)
?which
plot(dog)
points(ind1 , col = "Red")




#3
col1 <- load.image("col1.png")
col2 <- load.image("col2.png")
col3 <- load.image("col3.png")


find_col <- function(mat)
{
  mat <- as.array(mat[, ,1,1:3])
  g <- norm(mat[1,1, ] - c(0,1,0), "2")
  print(g)
  r <- norm(mat[1,1, ] - c(1,0,0), "2")
  print(r)
  b <- norm(mat[1,1, ] - c(0,0,1), "2")
  print(b)
  min <- min(c(g,r,b))
  if ( min == g)
  {
    print("Green")
  }else
    if (min == r)
    {
      print("Red")
    }else
    {
      print("Blue")
    }
}
find_col(col2)
plot(col2)

find_col(col3)
plot(col3)

find_col(col1)
plot(col1)
