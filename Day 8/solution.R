
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

part2 <- lapply(part2, function(x) {x[x != ""
                                      ]})

test <- part2[which(nchar(part2) == 2, arr.ind = T)]

lapply(part2, function(x) {x[which(nchar(x) == 2)]})
