input <- read_csv("Day 3/input.txt", col_names = FALSE)

gamma <- ""
epsilon <- ""

for (i in 1:nchar(input$X1[1])) {
  if (sum(as.integer(substr(input$X1, i, i))) > (length(input$X1) / 2)) {
    gamma <- paste(gamma, 1, sep = "")
    epsilon <- paste(epsilon, 0, sep = "")
    
  } else {
    gamma <- paste(gamma, 0, sep = "")
    epsilon <- paste(epsilon, 1, sep = "")
    
  }
  
}

#print(c(as.character(gamma), as.character(epsilon)))

result1 <- strtoi(gamma, base = 2) * strtoi(epsilon, base = 2)


k <- 1
o2 <- input


while (length(o2$X1 != 1)) {
  if (sum(as.integer(substr(o2$X1, k, k))) >= (length(o2$X1) / 2)) {
    o2 <- o2[substr(o2$X1, k, k) == 1, ]
    
  } else {
    o2 <- o2[substr(o2$X1, k, k) == 0, ]
    
  }
  
  k <- k + 1
  
}


k <- 1
co2 <- input

while (length(co2$X1) > 1) {
  if (sum(as.integer(substr(co2$X1, k, k))) >= (length(co2$X1) / 2)) {
    co2 <- co2[substr(co2$X1, k, k) == 0, ]
    
  } else {
    co2 <- co2[substr(co2$X1, k, k) == 1, ]
    
  }
  
  k <- k + 1
  
}

result2 <- strtoi(o2$X1[1], base = 2) * strtoi(co2$X1[1], base = 2)
