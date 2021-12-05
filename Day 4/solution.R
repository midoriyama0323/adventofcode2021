wincheck <- function(x) {
  for (a in 1:length(x)) {
    if (F %in% is.nan(colSums(x[[a]])) || F %in% is.nan(rowSums(x[[a]]))) {    
      a <<- a
      return(TRUE)
    }
  }
  return(FALSE)
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

draw_pos <- 1

while (wincheck(gamestate) == F){
  
  for (i in 1:length(cards)){
  gamestate[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)] <- 
    cards[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)]
  }
  
  draw_pos <- draw_pos + 1
}

print(sum(cards[[a]][which(is.nan(gamestate[[a]]), arr.ind = T)], na.rm = T) * draw[draw_pos - 1])


while (length(cards) > 1){
  
  if (wincheck(gamestate) == T){
    
    gamestate[[a]] <- NULL
    cards[[a]] <- NULL
    
  } else
    
    while (wincheck(gamestate) == F){
      
      for (i in 1:length(cards)){
        gamestate[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)] <- 
          cards[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)]
      }
      
      draw_pos <- draw_pos + 1
    }
  
}

while (wincheck(gamestate) == F){
  
  for (i in 1:length(cards)){
    gamestate[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)] <- 
      cards[[i]][which(cards[[i]] == draw[draw_pos],arr.ind = T)]
  }
  
  draw_pos <- draw_pos + 1
}

<<<<<<< HEAD
print(sum(cards[[a]][which(is.nan(gamestate[[a]]), arr.ind = T)], na.rm = T) * draw[draw_pos - 1])
gc()

=======

print(sum(cards[[a]][which(is.nan(gamestate[[a]]), arr.ind = T)], na.rm = T) * draw[draw_pos - 1])
>>>>>>> 346bed347d55f11030e21e7cc45f4d820c9f4b52
