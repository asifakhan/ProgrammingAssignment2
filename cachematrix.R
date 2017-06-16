## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  ## define a object list that contains add and update functions
  
  ##initlize NULL object to hold the cached inverse
  cached_inverse <- NULL
  
  ## Define the setting and updating functions 
  
  ### Define the set function 
  #### this function will both set a new value for the matrix, and reset the cache 
  set <- function(new_x) {
    x <<- new_x
    cached_inverse <<- NULL
  }
  
  ### Define the get function
  #### this function will get the matrix stored in the list 
  get <- function() x
  
  ### Define the setinverse function
  #### this function will set the value for the cached inverse 
  setinverse <- function(new_inverse) cached_inverse <<- new_inverse
  
  ### Define getinverse function
  #### this will get the cached inverse matrix
  getinverse <- function() cached_inverse
  
  
  ### Create a list with the defined functions
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}






## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ##get the cached inverse from the object list 
  isitcached <- x$getinverse()
  
  ##determine if the cache exists; return cached value or calculate new
  if(!is.null(isitcached)) {
    ### cached - returned cached value
    message("getting cached data")
    return(isitcached)
  } else {
    ### not cached - get data  
    matrix_data <- x$get()
    ### not cached - calculate inverse 
    isitcached <- solve(matrix_data)
    ### not cached - cache value in list
    x$setinverse(isitcached)
    ### not cached - return new value
    return(isitcached)
  }
}
