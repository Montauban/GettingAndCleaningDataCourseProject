


makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set_vector <- function(y) {
                x <<- y
                m <<- NULL
        }
        get_vector <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set_vector = set_vector, get_vector = get_vector,
             setinverse = setinverse,
             getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
        result <- x$getinverse()
        if(!is.null(result)) {
                message("getting cached data")
                return(result)
        }
        data <- x$get_vector()
        result <- solve(data, ...)
        x$setinverse(result)
        result
}
