## This function creates a special "matrix" object that can cache its inverse.
## makeCacheMatrix is a function that returns a list of functions

## set the value of the matrix
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  setMatrix<-function(y){
  x<<-y
  m<<-NULL
}

## get the value of the matrix
getMatrix<-function() x


## set the value of the inverse matrix (does not calculate but sets)
cacheInverse<-function(solve) m<<- solve

## get the value of the inverse matrix
getinverse<-function() m
list(setMatrix=setMatrix, getMatrix=getMatrix,
   cacheInverse=cacheInverse,
   getinverse=getinverse)
}


## The following function calculates the inverse of a "special" matrix created with 
## makeCacheMatrix

## get the cached value if exists
cacheSolve <- function(x=matrix(), ...) {
    m<-x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }

## calculate the inverse and store it in the cache
  
    matrix<-x$getMatrix()
    m<-solve(matrix, ...)
    x$cacheInverse(m) 
    m
}