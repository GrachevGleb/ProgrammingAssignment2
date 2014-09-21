makeCacheMatrix <- function(x = matrix()) { # create a function that will create 
        #a matrix for our future cash.
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL 
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve)
}


cacheSolve <- function(x, ...) {  #create a function that will check matrix, 
        # if it changed it create new cash, if didn't it will take available cash.              
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
                }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
