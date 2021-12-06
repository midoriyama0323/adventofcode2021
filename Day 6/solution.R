input <- as.list(read_csv("Day 6/input.txt", col_names = F))

day <- input

for (i in 1:256) {
  
  day <- lapply(day, function(x) x - 1)
  day <- append(day, rep(8, sum(grepl(-1, day))), after = length(day))
  day[grep(-1, day)] <- 6
  
  
}

print(length(day))