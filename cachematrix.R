## This code is part of an assignment for the R Programming
## Coursera course in the Data Scientist Toolbox series.

## The makeCacheMatrix function creates a special matrix that caches its 
## inversion.  It uses the <<- operator to assign a variable
## containing the inverse matrix so that it is visible in the parent 
## function.

makeCacheMatrix <- function(x = matrix()) {
        mx <- NULL
        ## Set up a function that lets you chnage the matrix
        setmatrix <- function(y) {
                x <<- y
                mx <<- NULL
        }
        ## Set up a function to return the original matrix
        getmatrix <- function() x
        ## Set up a function to store an inverse matrix
        setinverse <- function(inverse) mx <<- inverse
        ## Set up a function to return the inverse matrix
        getinverse <- function() mx
        ## Create a list of functions 
        list(setmatrix = setmatrix, getmatrix = getmatrix,
             setinverse = setinverse,
             getinverse = getinverse)
        
}
## cacheSolve tests the makeCacheMatrix.  Pass an instance of makeCacheMatrix
## that hass been initialized with a matrix (assumed to be invertible) and cacheSolve
## will calculate the inverse.  If makeCacheMatrix already contains an inverse to
## the matrix, it (ie the cached version) will be display instead of the inverse being calculated.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mx <- x$getinverse()
        ## If there is already a cached inverse matrix, return it and exit.
        if(!is.null(mx)) {
                message("getting cached inverse")
                return(mx)
        }
        ## If there is no cached inverse, calculate it.
        data <- x$getmatrix()
        mx <- solve(data, ...)
        ## Store the calculated inverse and then display it.
        x$setinverse(mx)
        mx
}

