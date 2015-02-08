## Perform matrix inversion by caching the inverse of a matrix

## The cachematrix function creates a function to 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse
## 4. get the value of the inverse

cachematrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setmatrix <- function(solve) inv <<- solve
        getmatrix <- function() inv
        list(set = set, get = get,
             setmatrix = setmatrix,
             getmatrix = getmatrix)
}

## cachesolve function returns the inverse of the matrix. It first checks if
## the inverse has already been computed. If so, it gets the result and skips the
## computation. If not, it computes the inverse, sets the value in the cache via
## setinverse function. This function assumes that matrix is always invertible.

cachesolve <- function(x = matrix(), ...) {
        inv <- x$getmatrix()
        if(!is.null(inv)) {
                message("getting cached data")
                return(m)
        }
        matrix <- x$get()
        inv <- solve(matrix, ...)
        x$setmatrix(inv)
        inv
}

