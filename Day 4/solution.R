wincheck <- function(x) {
  for (a in 1:length(x)) {
    if (F %in% is.nan(colSums(x[[a]])) || F %in% is.nan(rowSums(x[[a]]))) {    
      return(TRUE)
    }
  }
  return(FALSE)
}

game <- function(y) {
  while (wincheck(gamestate) == F){
    
    for (draw_pos in 1:length(draw)){
      
      draw[draw_pos]
      
    }
    
  }
  
  print(c(a, draw_pos))
  
}

draw <- strsplit(readLines("Day 4/input.txt", n = 1), ",", T)

draw <- as.numeric(draw[[1]])

input <- read.table("Day 4/input.txt", skip = 1)

cards <- list()

k <- 1

for (i in 1:(length(input$V1)/5)){

  cards[[i]] <- as.matrix(input[k:(k+4),])

  k <- k+5
}

gamestate <- lapply(1:100, matrix, data=NaN, nrow = 5, ncol = 5)


