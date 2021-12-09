
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
    pos1 <- unlist(strsplit(nums[2,2], NULL))
    if (length(intersect(pos1, unlist(strsplit(seg6[f], NULL)))) == 1){
      topright <- setdiff(pos1, intersect(pos1, unlist(strsplit(seg6[f], NULL))))
      nums[7,2] <- seg6[f]
      seg6 <- seg6[seg6 != seg6[f]]
    }
  }
  for (f in 1:length(seg6)){
  if(length(intersect(unlist(strsplit(nums[5,2], NULL)), unlist(strsplit(seg6[f], NULL)))) == 4){
    
    nums[10,2] <- seg6[f]
    seg6 <- seg6[seg6 != seg6[f]]
    nums[1,2] <- seg6[1]
    
  }
  }
  seg5 <- unique(part2[[i]][nchar(part2[[i]]) == 5])
  
  for (f in 1:length(seg5)){
    if ((length(intersect(topright, unlist(strsplit(seg5[f], NULL)))) == 0) && f <= length(seg5)){
      nums[6,2] <- seg5[f]
      seg5 <- seg5[seg5 != seg5[f]]
    }
    
    
  }
  for (f in 1:length(seg5)){
    pos1 <- unlist(strsplit(nums[2,2], NULL))
    if (length(intersect(pos1, unlist(strsplit(seg5[f], NULL)))) == 1){
      topright <- setdiff(pos1, intersect(pos1, unlist(strsplit(seg5[f], NULL))))
      nums[3,2] <- seg5[f]
      seg5 <- seg5[seg5 != seg5[f]]
      nums[4,2] <- seg5[1]
    }
  }
  
  
  for (k in 1:length(part2[[i]])){
    
    if (!(is.numeric(part2[[i]][k]))) {
      part2[[i]][k] <- nums[which(part2[[i]][k] == nums[,2]),1]}
    
    
  }
  res2[i] <- paste(part2[11:14,i], collapse = '')                               
}

result2 <- sum(as.numeric(res2))
result2



