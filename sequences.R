#sequences
seq(from=10,to=4,by=-0.8)
seq(from=10,to=4,length=10)

# if we use along then it would print out the index
x <- c(9,5,6,2)
seqr <- seq(along=x)
seqr

#getting sequences of dates
seq(as.Date("2010-01-01"), by = "days",length=6)
#sequencing with letters
LETTERS

#repeat command
y <- 5
rep(c(4,6,1),each=3, times=3)

rep(5:8 , 1:4)
