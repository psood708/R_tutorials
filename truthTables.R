x = 1:6
x[(x>2) & (x<5)]
#here we can do logical thing
x <- 5
Logical1 <- (x<2)
is.logical(Logical1)
#we are using the conditional execution
if(x==3){x<- x-1} else {x <- 2*x}

#this is the conditional execution
ifelse(x<6,x^2,x+1)

#for loop
for(i in 1:5){print(i^2)}

#solving for while loop
i <- 1
while (i<5){
  print(i^2)
  i<- i+2
}

#repeat break loop\
i<-1
repeat{
  print(i^2)
  i<- i+2
  if(i>15) break
}