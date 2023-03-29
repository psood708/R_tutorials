#we are going to learn the basics of R
x<- 20  #this is used to assign 20 to x
x = 20  #this will also be the basics

y = x*2
z <- x+y

#now we will see the combine function as when we assign many numbers to a vector
b = c(1,2,3,4,5,6)
b^2 #we can use operations in the vector also
b^c(2,3,4) #this will go in order 1^2,2^3,3^4--> then again will go in loop 4^2,5^3,6^4


#now we'll look at the integer division sign (%/%)
c(2,3,5,7) %/% c(2,3)
# now this will be the mod func %%
c(2,3,5,7) %% 2
# for min max
b = c(1,-6,2,-0.2)
abs(min(1.2,3,0.5))
abs(min(b)) #abs is absolute
max(b)

#assignments
mode(b) #this is basically to check the datatype
