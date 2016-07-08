## makeCacheMatrix creates a list containing a function to
#  1 - set the entries of the matrix
#  2 - get the entries of the matrix
#  3 - set the values of the matrix inverse
#  4 - set the values of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
        im <- NULL
        set <- function(y) {
                x <<- y
                im <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) im <<- inverse
        getinverse <- function() im
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve calculates the mean of the special "vector" created with the above function. 
#  The function first checks to see if the matrix inverse has already been calculated. 
#  If so, it gets the inverse from the cache and skips the computation. 
#  Otherwise, it calculates the inverse of the matrix and sets the value of the inverse
#  in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        im <- x$getinverse()
        if(!is.null(im)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        im <- solve(data, ...)
        x$setinverse(im)
        im
}
