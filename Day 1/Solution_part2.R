input <-
  read.table(
    "Day 1/input.txt",
    quote = "\"",
    comment.char = ""
  )
result <- 0
i <- 1



for (i in 1:(length(input[, 1]) - 3)) {
  
  if (sum(input$V1[(i + 1):(i + 3)]) - sum(input$V1[i:(i + 2)]) > 0) {
    result = result + 1
  }
  
}
print(result)

