#lecture 2
if(!requireNamespace("animint2")){
  if(!requireNamespace("remotes"))install.packages("remotes")
  remotes::install_github("tdhock/animint2")
}
update.packages("animint2")
library(ggplot2)
library("animint2")
data("WorldBank",package="animint2")
labels(WorldBank)
scatter <- ggplot()+
  geom_point(aes(x=life.expectancy,y=fertility.rate,colour=region),
             showSelected="year",
             data=WorldBank)
scatter
animint(scatter)

