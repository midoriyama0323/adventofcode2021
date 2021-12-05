draw <- readLines("Day 4/input.txt", n = 1)

input <- read.table("Day 4/input.txt", skip = 1)

cards <- list()

k <- 1

for (i in 1:(length(input$V1)/5)){

  cards[[i]] <- matrix(input[k:(k+4),], nrow = 1, ncol = 5)

  k <- k+5
}