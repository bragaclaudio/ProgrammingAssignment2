## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ## Function makeCacheMatrix
  m <- NULL
  set <- function(y) {
    x<<-y
    m<<-NULL  ##if you change the matrix then clear the inverse
  }
  get <- function() x
  setInverse <- function(Inverse) m <<- Inverse ## setInverse function
  getInverse <- function() m ## getInverse function
  list(set = set, get = get, 
       setInverse = setInverse,
       getInverse = getInverse)  ## define list of functions
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if(!is.null(m)) { ##do not need to solve if it had been done before
    message("getting cached data")
    return(m)
  }
  data <- x$get() ## get the matrix using get function
  m <- solve(data) ## It it is the first time then solve
  x$setInverse(m) ## save the result usuing setInverse
  m
}
