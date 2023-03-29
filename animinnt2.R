
if(!requireNamespace("animint2")){
  if(!requireNamespace("remotes"))install.packages("remotes")
  remotes::install_github("tdhock/animint2")
}
## making a ggplot first
library("ggplot2")
data(tips, package = "reshape2")
tips$sex_smoker <- with(tips, interaction(sex, smoker))
p <- ggplot() +
  geom_point(data = tips, 
             aes(x = total_bill, y = tip, colour = sex_smoker))
p
library("animint2")
animint2dir(list(plot = p), out.dir = "simple", open.browser = FALSE)
