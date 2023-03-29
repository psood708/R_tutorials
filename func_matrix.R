#syntax for a function
square <- function(x){
  x^2
}
square(5)

#matrices 
x <- matrix(nrow=2 ,ncol=2, data=1:4,byrow=T) #here we can do 1:8 that will put values from 1 to 8
x
#functions of the matrix
dim(x)
attributes(x)
help("matrix")

#diagonal matrix
d <- diag(1,nrow=3,ncol=3)
d

#transpose of a matrix X: X'
xt <- t(x)
xt
#multiplication of two matrices
xtx <- xt %*% x   #%*% is the sign for matrix multiplication
xtx
x
#solve() it is used to finnd the inverse of a positive definite matrix
solve(x)

#Eigen Values and Eigen Vectors find
eigen(x)
