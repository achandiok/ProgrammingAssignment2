## Put comments here that give an overall description of what your
## functions do
## makeCacheMatrix puts and store a matrix X in memory
## cacheSolve directly show the inverse of a matrix if it is already
## in the memory or calculates the inverse and then show the inverse of the matrix
## Write a short comment describing this function

makeCacheMatrix <- function( x= matrix()) 
{
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(Inverse) inverse <<- Inverse
  getinverse <- function() inverse
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Write a short comment describing this function
## function calulates inverse of a matrix by using pseudoinverse with corpor library

cacheSolve <- function(x, ...) {
  if(require("corpcor")){
    print("corpcor loaded")
  } else {
    print(" installing  corpcor")
    install.packages("corpcor")
    
  } 
  
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)){
    message("matrix is in memory")
    return(inverse)
  }
  message("inverse is not in memory therefore inverse has to be calculated")
  data <- x$get()
  inverse <- pseudoinverse(data, ...)
  x$setinverse(inverse)
  inverse
}
## Example
y <- matrix(rpois(12,2), nrow = 4, ncol = 4)
iy <- makeCacheMatrix(y)
iY$get()
cacheSolve(iy)
cacheSolve(iy)
inverseY <- cacheSolve(iy)
inverseY

