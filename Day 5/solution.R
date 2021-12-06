input <- read_csv("Day 5/input.txt", col_names = FALSE)

input$X4 <- input$X3
input$X3 <- as.double(substr(input$X2, unlist(gregexpr(" -> ", input$X2))+4, length(input$X2)))
input$X2 <- as.double(substr(input$X2, 1, unlist(gregexpr(" -> ", input$X2))))
names(input) <- c("X1", "Y1", "X2", "Y2")

part1_work <- input[(input$X1 == input$X2) | (input$Y1 == input$Y2),]
part1_work <- part1_work + 1
part2_work <- input[!(input$X1 == input$X2) & !(input$Y1 == input$Y2),]
part2_work <- part2_work + 1

vents <- matrix(data = 0, nrow = max(c(part1_work$X1, part1_work$X2)), ncol = max(c(part1_work$Y1, part1_work$Y2)))

for (i in 1:length(part1_work$X1)) {
  
  if (part1_work$X1[i] == part1_work$X2[i]){
    
    vents[part1_work$X1[i],part1_work$Y1[i]:part1_work$Y2[i]] <- vents[part1_work$X1[i],part1_work$Y1[i]:part1_work$Y2[i]] + 1
    
  } else {
    
    vents[part1_work$X1[i]:part1_work$X2[i], part1_work$Y1[i]] <- vents[part1_work$X1[i]:part1_work$X2[i], part1_work$Y1[i]] + 1
    
  }
  
}

result1 <- sum(vents > 1)
print(result1)

#part2

for (i in 1:length(part2_work$X1)) {
  
diag(vents[part2_work$X1[i]:part2_work$X2[i],part2_work$Y1[i]:part2_work$Y2[i]]) <- diag(vents[part2_work$X1[i]:part2_work$X2[i],part2_work$Y1[i]:part2_work$Y2[i]] + 1)
  
}

result2 <- sum(vents > 1)
print(result2)