input <-
  read.table(
    "Day 2/input.txt",
    quote = "\"",
    comment.char = ""
  )

res_1 <-
  sum(input$V2[which(input$V1 == "up")] * -1, input$V2[which(input$V1 == "down")]) * sum(input$V2[which(input$V1 == "forward")])

aim <- 0
depth <- 0
hor <- 0


for (i in 1:length(input$V1)) {
  aim <-
    switch(input$V1[i],
           "up" = aim - input$V2[i],
           "down" = aim + input$V2[i],
           aim)
  
  depth <-
    if (aim != 0 &&
        input$V1[i] == "forward") {
      depth + (input$V2[i] * aim)
    } else {depth}
  
  hor <- if (input$V1[i] == "forward") {
    hor + input$V2[i]
  } else {hor}
  
}


res_2 <- hor * depth

