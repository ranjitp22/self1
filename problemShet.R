#Problem set

#### 1 ########################
odd <- numeric(length = 1000)
j=1
for (i in 1:2000)
{
  if(i%%2 != 0)
   { odd[j] <- i
    j=j+1
  }}
odd

#Alternate
od <- seq(1,2000,2)
od

### 2 #########################
fibo <- numeric(length = 500)
fibo[1]= 1
fibo[2]= 1

j=2
while(fibo[500]==0)
{
  fibo[j+1] <- fibo[j] + fibo[j-1]
  j <- j+1
}
print(fibo)


### 3 #########################
func <- function()
{
  num <- sample(1:6 , size = 1)
  if (num%%2 == 0)
  {
    print("Even")
    return(1)
  }else
  {
    print("Odd")
    return(0)
  }
}
func()

### 4 #########################
toss <- function()
{
  num <- rbinom( 1,15,0.5)
  print(num)
  if(num > 7)
    print("Win")
  else
    print("lose")
}
toss()



### 6 #########################
mat<- matrix(ncol = 5, nrow = 5)
for ( i in 1:5)
  for( j in 1:5)
  {
    if(i == j)
      mat[i,j] = i
    else
    {  
      mat[i,j] = 0}
    }
mat


### 5 #########################
mat<- matrix(ncol = 5, nrow = 5)
for ( i in 1:5)
  for( j in 1:5)
    {mat[i,j] <- 1}
mat



### 7 #########################

mat<- matrix(ncol = 10, nrow = 10)
for ( i in 1:10)
  for( j in 1:10)
    mat[i,j] <- sample(1:6 , size = 1)
mat


### 8 #########################

func <- function(n , roh)
{
  mat<- matrix(ncol = n, nrow = n)
  for ( i in 1:n)
    for( j in 1:n)
    {
      if(i == j)
        mat[i,j] = 1
      else
      {  
        mat[i,j] = roh
      }
    }
  return(mat)
}
func(3,10)

### 9 #########################

func <- function(n , roh)
{
  mat<- matrix(ncol = n, nrow = n)
  for ( i in 1:n)
    for( j in 1:n)
    {
      mat[i,j] <- roh^abs(i-j)
    }
  return(mat)
}
m = func(4,10)


### 11 #########################
arr <- array(dim = c(10,4,6,5))

for ( i in 1:10)
  for( j in 1:4)
    for( k in 1:6)
      for( l in 1:5)
        arr[i,j,k,l] <- 1
arr

### 10 #########################
##Do again
func <- function(mat)
{
  arr <- numeric()
  for ( i in 1:dim(mat)[2])
  {
    if(i%%2 != 0)
    {
      print(mat[,i])
    
      
    }
  }
  print(arr)
}

