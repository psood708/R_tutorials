update.packages("rlang")
mpg
# this is the syntax to display a ggplot
ggplot(data=mpg)+
  geom_point(mapping = aes(x = displ,y=hwy,color=class))+
  #facet_wrap(~ class,nrow=3,ncol=3)
  facet_grid(drv~ .)
#here we use ~ for writing a formula 

#using the geometric objects
#A geom is the geometrical object that a plot uses to represent data.
ggplot(data = mpg) +
  geom_point(mapping=aes(x = displ,y=hwy))+
  geom_smooth(mapping = aes(x=displ,y=hwy,color=drv),show.legend=FALSE)
#in the above example we are putting the variables at two places this when we need to update we need to do it locally
# for updating globaly we pass everything in ggplot itself
 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth() 
#further we can apply filter here
ggplot(data = mpg, mapping = aes(x =displ,y = hwy))+
  geom_point(mapping = aes(color=class))+
  geom_smooth(
    data = filter(mpg,class=='suv'),
    se=FALSE
  )

labels(diamonds)
# here on we will start statistical transformations
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) +
  stat_count(mapping =  aes(x =cut))

# we will be performing a demo for the same
demo <- tribble(
  ~a , ~b,
  "bar_1",20,
  "bar_2",30,
  "bar_3",40
)
ggplot(data = demo)+
  geom_bar(
    mapping = aes(x = a, y= b),stat ="identity"
  )

# this is bar chart
ggplot(data=diamonds)+
  geom_bar(
    mapping = aes(x = cut,y = ..prop..,group = 1)
  )

# we are going to do the stat plot in this
ggplot(data = diamonds)+
  stat_summary(
    mapping = aes(x = cut,y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
#colourful bar chart
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut,fill=clarity),
         position= "fill")

# this is when we need to use dodge , and I like it
ggplot(data = diamonds)+
  geom_bar(
    mapping = aes(x = cut,fill=clarity),
    position="dodge"
  )
# we usee jitter to solve problems of redundant values
ggplot(data = mpg, mapping = aes(x = cty,y=hwy))+
  geom_point(position="jitter")
#jitter is used to give little noise to it

#now we are going to use quickmap and these are used to plot for coordinates
#these are used to plot maps
nz <- map_data("nz")
ggplot(nz,aes(long,lat,group=group))+
  geom_polygon(fill="white",color="black")+
  coord_quickmap()

# now we will see the use of coord_polar
bar <- ggplot(data = diamonds)+
  geom_bar(
    mapping = aes(x =cut,fill =cut),
    show.legend = FALSE,
    width=1
  )+
  theme(aspect.ratio = 1)+
  labs(x = NULL,y=NULL)
bar+ coord_flip()
bar+ coord_polar() # this is some crazzyy shiiit
