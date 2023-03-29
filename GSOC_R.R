if(!requireNamespace("animint2")){
  if(!requireNamespace("remotes"))install.packages("remotes")
  remotes::install_github("tdhock/animint2")
}
labels(WorldBank)
library(animint2)
# starting the implementation for the same
#here we will be translate a plot sketch to R code
data("WorldBank",package="animint2")
WorldBank$region <- sub(" (all income levels)","",WorldBank$region,fixed = TRUE)
tail(WorldBank)
dim(WorldBank)

WorldBank1975 <- subset(WorldBank,year==1975)
head(WorldBank1975)

# now we will plot for ggplot this is for one layer
scatter <- ggplot()+
  geom_point(
    mapping=aes(x=life.expectancy, y = fertility.rate,color=region),
    data=WorldBank1975)
scatter
#this animation is helpful in giving the exact sense of how we want to seperate it
animint(scatter)
# now we will begin for two layer plots
WorldBankBefore1975 <- subset(WorldBank,1970 <= year & year <=1975)
two.layers <- scatter+
  geom_path(aes(
    x=life.expectancy,
    y=fertility.rate,
    color=region,
    group=country),
    data=WorldBankBefore1975
  )
(viz.two.layers<- animint(two.layers))

# here we are performing a three layer plot
three.layers <- two.layers+
  geom_text(aes(
    x=life.expectancy,
    y = fertility.rate,
    color=region,
    label=country),
    data= WorldBank1975)
animint(three.layers)


#now we will be aiming towards multi-plot data visualization
viz.two.plots <- viz.two.layers
viz.two.plots$timeSeries <- ggplot()+
  geom_line(aes(
    x=year,
    y=fertility.rate,
    color=region,
    group=country),
    data=WorldBank)
summary(viz.two.plots)
viz.two.plots



#multi-panel visualisation

add.x.var <- function(df,x.var){
  data.frame(df,x.var=factor(x.var,c("life Expectancy","year")))
}
(viz.aligned <- animint(
  scatter = ggplot()+
    theme_animint(width=800)+
    geom_point(aes(x = life.expectancy,y=fertility.rate,color=region),
               data=add.x.var(WorldBank1975,"life expectancy"))+
    geom_path(aes(x=life.expectancy,y=fertility.rate,color=region,group=country),
              data=add.x.var(WorldBank1975,"life expectancy"))+
    geom_line(aes(x=year,y=fertility.rate,color=region,group=country),
              data=add.x.var(WorldBank,"year"))+
    xlab("")+
    facet_grid(. ~ x.var,scales="free")+
    theme_bw()+ #this is used in order to give black panel borders
    theme(panel.margin=grid::unit(0,"lines")) # margin-0 means that there is no margin between panelsw
))


#now we will compare the data from past 3 years and then put them on the same panel
show.point.list <- list()
show.path.list <- list()
for(show.year in c(1975,1985,1995)){
  show.point.list[[paste(show.year)]] <- data.frame(
    show.year,subset(WorldBank,year==show.year))
  show.path.list[[paste(show.year)]] <- data.frame(
    show.year,subset(WorldBank,show.year -5 <= year & year<=show.year))
}
show.point <- do.call(rbind,show.point.list)
show.path <- do.call(rbind,show.path.list)
#here above we have accumulated the date from past 3 years and then it's consolidated in a data structure
viz.panels <- list(
  scatter= ggplot()+
    geom_point(aes(x=life.expectancy,y=fertility.rate,color=region),
               data=show.point)+
    geom_path(aes(x=life.expectancy,y=fertility.rate,color=region,group=country),
              data=show.path)+
    facet_grid(. ~ show.year)+
    theme_bw()+
    theme(panel.margin=grid::unit(0,"lines"))
)
structure(viz.panels,class="animint")
