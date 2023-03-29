# each character is mapped to a code
# factors represent categorical variables and are used as grouping indicators
# R's term for categorical variable is a factor
# R possible value of a categorical variable is called level
# vector of levels is called a factor

#levels = categories of factor variables
# labels = vector of values that will be labels
y <- c(1,4,3,5,4,2,4)
labels.dieface <- c("one","two","three","four","five","six")
possible.dieface <- c(1,2,3,4,5,6)
facy <-factor(y,levels = possible.dieface,labels = labels.dieface)
facy

# unclass is used to temporarily remove effects of class

x<- factor(c("juice","juice","lemonade","juice","water"))
x
help(unclass)
unclass(x)
