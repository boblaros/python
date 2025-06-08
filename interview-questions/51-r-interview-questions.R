# 51 R Interview Questions for Data Scientist
# Each section begins with a comment posing the question
# followed by brief answers and code snippets.

# 1. What is the difference between a vector and a list?
# Vectors are atomic and hold one data type.
# Lists can hold elements of different types.
vec <- c(1, 2, 3)
lst <- list(1, "a", TRUE)

# 2. How do you handle missing values in R?
# Use is.na() to detect and na.omit() or other functions to remove/replace.
x <- c(1, NA, 3)
clean <- na.omit(x)

# 3. What does the apply family of functions do?
# They iterate over elements of objects without explicit loops.
mat <- matrix(1:4, nrow=2)
rowSums <- apply(mat, 1, sum)

# 4. How do you create a function in R?
# Use function keyword and return value explicitly.
add <- function(a, b) {
  a + b
}

# 5. What is the difference between data.frame and tibble?
# tibble is a modern reimagining of data.frame with better printing and subsetting.
library(tibble)
df <- data.frame(x=1:3)
tb <- tibble(x=1:3)

# 6. How do you read and write CSV files?
# Use read.csv() and write.csv().
d <- read.csv("data.csv")
write.csv(d, "out.csv", row.names=FALSE)

# 7. Explain factor vs character.
# Factors are categorical and store integer codes with labels.
colors <- factor(c("red", "blue"))

# 8. What is the pipe operator %>% ?
# It passes the result on the left to the first argument on the right.
library(dplyr)
iris %>% head()

# 9. How do you perform group by and summarize with dplyr?
iris %>% group_by(Species) %>% summarise(avg = mean(Sepal.Length))

# 10. How do you merge/join data frames?
# Use merge(), or dplyr's join functions like inner_join().
a <- data.frame(id=1:2, val=c('a','b'))
b <- data.frame(id=2:3, val2=c('c','d'))
merge(a, b, by="id", all=TRUE)

# 11. How do you create plots using ggplot2?
library(ggplot2)
qplot(Sepal.Length, Sepal.Width, data=iris)

# 12. What is an R package and how do you create one?
# A package bundles R functions, data and documentation. Use devtools::create().

# 13. Explain difference between matrix and data.frame.
# Matrix has one data type, data.frame can have different types in columns.

# 14. How do you subset data by rows and columns?
subset <- iris[1:3, c("Sepal.Length", "Species")]

# 15. What are vectorized operations?
# Operations applied element-wise without explicit loops.
y <- c(1, 2, 3) + 1

# 16. How do you install packages from CRAN?
# install.packages("pkgname")

# 17. What is the difference between for loop and apply functions?
# apply family is often faster and more concise for iterating over structures.

# 18. How do you perform linear regression using lm?
model <- lm(Sepal.Length ~ Sepal.Width, data=iris)
summary(model)

# 19. How do you check for multicollinearity?
# Use Variance Inflation Factor (VIF) from the car package.

# 20. How do you create and use factors?
# factors <- factor(c("a", "b", "a"))

# 21. How do you handle date and time objects?
# Use as.Date(), lubridate package for parsing and manipulating dates.

# 22. What is the difference between S3 and S4 objects?
# S3 is informal; S4 has formal class definitions and method signatures.

# 23. How do you write unit tests in R?
# Use the testthat package with test_that() functions.

# 24. What is a closure in R?
# A function along with its environment.
closure_example <- function(x) {
  function(y) x + y
}

# 25. What is lazy evaluation?
# Function arguments are evaluated only when needed.

# 26. How do you sample random numbers?
set.seed(42)
sample(1:10, 5)

# 27. How do you vectorize custom functions?
vec_fun <- Vectorize(function(x) x^2)
vec_fun(1:3)

# 28. What is the difference between environment and list?
# Environment has reference semantics and is used for variable lookup.

# 29. How do you read data from Excel?
# Use readxl::read_excel("file.xlsx")

# 30. How do you create interactive graphs using plotly?
# library(plotly); ggplotly(p)

# 31. What is data.table and how is it different from data.frame?
# data.table is an enhanced data frame with faster operations and concise syntax.

# 32. What is the difference between [ and [[ ?
# [ returns a subset of the same type; [[ extracts a single element.

# 33. How does memory management work in R?
# Automatic garbage collection frees unreferenced objects.

# 34. How do you run R scripts from the command line?
# Rscript myscript.R

# 35. What is the difference between %*% and * ?
# %*% is matrix multiplication; * is element-wise multiplication.

# 36. How do you reshape data using tidyr?
library(tidyr)
long <- pivot_longer(iris, cols=starts_with("Sepal"))

# 37. How do you evaluate expression from a string?
expr <- "1 + 2";
result <- eval(parse(text=expr))

# 38. How do you use ifelse vs if?
res <- ifelse(1:5 > 3, "big", "small")

# 39. How do you suppress warnings or messages?
# suppressWarnings(), suppressMessages()

# 40. Explain NA, NULL and NaN values.
# NA is missing data, NULL is empty object, NaN is undefined numeric result.

# 41. How do you compute correlations between variables?
cor(iris$Sepal.Length, iris$Sepal.Width)

# 42. How do you remove duplicated rows?
unique_df <- unique(iris)

# 43. How do you use apply to compute row means?
row_means <- apply(iris[,1:4], 1, mean)

# 44. Explain R's lexical scoping.
# Functions capture variables from their defining environment.

# 45. How do you read from a database?
# Use DBI package: dbConnect(), dbGetQuery()

# 46. How do you apply cross-validation for a model?
# Use caret::train() with method="cv" or other resampling packages.

# 47. How do you parallelize computations?
# Use parallel or future packages with mclapply or future_lapply.

# 48. How do you create custom S3 methods?
print.myclass <- function(x) {
  cat("myclass:", x, "\n")
}

# 49. How do you generate reproducible results?
set.seed(123)

# 50. What are the benefits of using R Markdown?
# Combines code, output, and text in a single reproducible document.

# 51. How is exception handling done with tryCatch?
result <- tryCatch({
  1 + "a"
}, error = function(e) {
  NA
})
