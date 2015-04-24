## This code is part of an assignment for the R Programming
## Coursera course in the Data Scientist Toolbox series

## The makeCacheMatrix function creates a special matrix that caches its 
## inversion.  It uses the <<- operator to assign a variable
## containing the inverse matrix so that it is visible in the parent 
## function.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
