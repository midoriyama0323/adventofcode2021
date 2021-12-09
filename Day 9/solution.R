input <- lapply(strsplit(scan("Day 9/input.txt", what = "character"), NULL), function(x) as.numeric(x))
input <- as.matrix(as.data.frame(input, col.names = 1:100))

#credit to Stibu on stackoverflow for this function
get.nbhd <- function(m, i, j) {
  # get indices
  idx <- matrix(c(i-1, i+1, i, i, j, j, j+1, j-1), ncol = 2)
  # set out of bound indices to 11
  idx[idx[, 1] > nrow(m), 1] <- 0
  idx[idx[, 2] > ncol(m), 2] <- 0
  return (m[idx])
}


lowp <- double()

for (r in 1:nrow(input)){
  
  for (c in 1:ncol(input)){
    
    if (all(get.nbhd(input, r,c) > input[r,c]) == T){
      
      lowp <- append(lowp,input[r,c], after = length(lowp))
      
    }
    
  }
  
  
}
risk <- sum(lowp + 1)
risk
