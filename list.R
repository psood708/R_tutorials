# list is a special type of object that can contain data of 
# multiple types
# list can contain other structured objects
# modes is how different data is stored in memeory
#vectors have all the same modes
# list can have different types of mode
# even dataframe has its mode as list

x1 <- matrix(nrow=2,ncol=2,data=1:4,byrow=T)
x2 <- matrix(nrow=2,ncol=2,data=5:8,byrow=T)
matlist <- list(x1,x2)
matlist
y1 <- list(c("Apple","Banana",3), rep(1:4,each=2),matrix(data=5:8,nrow=2,ncol=2,byrow=T))
mode(y1[[1]][3]) #here for 2d reference we need to keep the 1st
# direction in 2d and the rest at 1D x[[<x>]][<y>]
p <- 1:40
p[(p%%3)==0]

#vector indeexing
x <- 1:10
x[-(1:5)]

z <- list(a1 = 1, a2="c", a3=(1:5))
z[[3]][1]
# now we will be changing names here
names(z)[2] <- "Padblo"
z
# names is used to get the names of the objects in list

# matrices can be created from the list
# we can start with a hetergenous list give it dimensions and create a heterogeneous matrix

ab<- list(1,"X",2,"Y",3,"Z")

dim(ab)<-c(3,2)
ab
