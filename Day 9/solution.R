input <- lapply(strsplit(scan("Day 9/input.txt", what = "character"), NULL), function(x) as.integer(x))
input <- as.matrix(as.data.frame(input, col.names = 1:100))


get.nbhd <- function(m, r, c) {

  idx <- matrix(c(r-1, r+1, r, r, c, c, c+1, c-1), ncol = 2)

  idx[idx[, 1] > nrow(m), 1] <- 0
  idx[idx[, 2] > ncol(m), 2] <- 0
  return (m[idx])
}


lowpos <- c()

for (r in 1:nrow(input)){
  
  for (c in 1:ncol(input)){
    
    if (all(get.nbhd(input, r,c) > input[r,c]) == T){
      
      lowpos <- rbind(lowpos, c(r,c))
    }
    
  }
  
  
}

sum(input[lowpos] + 1)

