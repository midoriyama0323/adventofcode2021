#Part 1 solution: Looping and simulating each specimen works, but is slow. Doesn't work for part 2
input <- as.list(read_csv("Day 6/input.txt", col_names = F))

#Part 2 we simply keep track of the number of fish in each "stage"

for (i in 0:8) {
  
  assign(paste("numof", i, sep = ""), as.double(sum(grepl(i, input))))
  assign(paste("newnumof", i, sep = ""), 0)
  
}

 for (i in 1:256){

  for (k in 0:8){

    switch(as.character(k),
           '8' = assign(paste("newnumof", k, sep = ""), numof0),
           '6' = assign(paste("newnumof", k, sep = ""), numof0 + numof7),
           assign(paste("newnumof", k, sep = ""), get(paste("numof", k+1, sep = "")))
           )

  }
    for (j in 0:8){
  
      assign(paste("numof", j, sep = ""), get(paste("newnumof", j, sep = "")))
  
  }
gc()
 }

result <- sum(newnumof0, newnumof1, newnumof2, newnumof3, newnumof4, newnumof5, newnumof6, newnumof7, newnumof8)
print(as.character(result))


# for (i in 1:256){
# newnumof0 <- numof1
# newnumof1 <- numof2
# newnumof2 <- numof3
# newnumof3 <- numof4
# newnumof4 <- numof5
# newnumof5 <- numof6
# newnumof6 <- numof0+numof7
# newnumof7 <- numof8
# newnumof8 <- numof0
# 
# numof0 <- newnumof0
# numof1 <- newnumof1
# numof2 <- newnumof2
# numof3 <- newnumof3
# numof4 <- newnumof4
# numof5 <- newnumof5
# numof6 <- newnumof6
# numof7 <- newnumof7
# numof8 <- newnumof8
# }