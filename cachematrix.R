## makeCacheMatrix could be utilized in many forms, but in the case of this function combination
## it is used as an instance argument passed to cacheSolve to calculate the inverse of
## an invertable matrix


## makeCacheMatrix defines a "class" that takes a nuneric argument and returns the
## set and get values outlined in the assignment.

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

## cacheSolve takes x (in this case an instance of makeCacheMatrix) and returns
## the inverse matrix. If the passed matrix is not invertable an error
## will be thrown. 

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






