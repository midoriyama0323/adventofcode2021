input <- trimws(scan("Day 8/input.txt", what = character(), sep = "|"), which = "both")

part1 <- simplify2array(
            strsplit(
              input[(lengths(gregexpr("\\W+", input)) + 1) == 4]
            , "\\W")
          )

part2 <- as.data.frame(simplify2array(
  strsplit(
    scan("Day 8/input.txt", what = character(), sep = "\n", strip.white = T)
    , "\\W")
))
part2 <- part2[c(1:10,13:16),]
test <- sort(part2[,])

result1 <- sum(nchar(part1) %in% c(2,3,4,7))
result1
