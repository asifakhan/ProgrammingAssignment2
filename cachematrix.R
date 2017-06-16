## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  # define objects to cache the matrix, and inverse 
  previous_matrix <- NULL
  solved_inverse <- NULL

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## check if the matrix has changed from cache
  if(identical(x, previous_matrix)) {
    ## if true, return cached inverse 
    solved_inverse
  }
  ## else calculate inverse of 'x' and cache the result and input matrix
  else {solved_inverse <<- solve(x)
  previous_matrix <<- x
    }
  
  ## Return a matrix that is the inverse of 'x'
  solved_inverse
}
