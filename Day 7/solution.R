input <- scan("Day 7/input.txt", what = double(), sep = ",")

result1 <- sum(abs(input - median(input)))

result2 <-
  min(
    c(
    sum((
    abs(input - floor(mean(input))) * 
    (abs(input - floor(mean(input))) + 1)) / 2),
    sum((
      abs(input - ceiling(mean(input))) * 
         (abs(input - ceiling(mean(input))) + 1)) / 2)))

print(paste("Result1:", result1), sep = "")
print(paste("Result2:", result2), sep = "")
