
input <- trimws(scan("Day 8/input.txt", what = character(), sep = "|"), which = "both")

part1 <- simplify2array(
            strsplit(
              input[(lengths(gregexpr("\\W+", input)) + 1) == 4]
            , "\\W")
          )

result1 <- sum(nchar(part1) %in% c(2,3,4,7))
result1

part2 <- 
strsplit(
    scan("Day 8/input.txt", what = character(), sep = "\n", strip.white = T)
    , "\\W")

part2 <- as.data.frame(lapply(part2, function(x) {x[x != ""
                                      ]}), col.names = 1:length(part2))

nums <- data.frame(0:9)
for (i in 1:length(part2)) {
  part2[[i]] <- vapply(strsplit(part2[[i]], NULL), function(x) paste(sort(x), collapse = ''), '')
  
  nums[2,2] <- unique(part2[[i]][nchar(part2[[i]]) == 2])
  nums[5,2] <- unique(part2[[i]][nchar(part2[[i]]) == 4])
  nums[8,2] <- unique(part2[[i]][nchar(part2[[i]]) == 3])
  nums[9,2] <- unique(part2[[i]][nchar(part2[[i]]) == 7])
  seg6 <- unique(part2[[i]][nchar(part2[[i]]) == 6])
  
  for (f in 1:length(seg6)){
    #ha az 1 es vonalai nincsenek a seg6ban, akkor a seg6 f-edik eleme a "6"
    #for some reason, this works for i = 2 and i = 5 but not for i = 1,3,4
    if (F %in% (unlist(strsplit(nums[2,2], NULL)) %in% unlist(strsplit(seg6[f], NULL)))){
      nums[7,2] <- seg6[f]
      seg6 <- seg6[seg6 != seg6[f]]
    }
  }
  for (f in 1:length(seg6)){
  if(!(F %in% (unlist(strsplit(nums[5,2], NULL)) %in% unlist(strsplit(seg6[f], NULL))))){
    
    nums[10,2] <- seg6[f]
    seg6 <- seg6[seg6 != seg6[f]]
  }
  }
  
                                 
}
