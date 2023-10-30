# A named vector
x <- c(a = 1, b = 2, c = 5)
# Index by position
x[1]
x[1:2]
x[c(1, 3)]
# Index by name
x["a"]
x[c("a", "c")]
# Index by logic
x[x > 3]
x[names(x) == "b"]

#where is bob?
filenames <- c("bob", "bob", "springer", "bailey", "bailey")
filenames == "bob"
filenames[filenames == "bob"]

#exercise
plant_height_mm <- c(p0 = 45.94, p1 = 48.13, p2 = 48.14, p3 = 47.55, p4 = 43.85, p5 = 45.12, p6 = 45.49, p7 = 44.82, p8 = 48.4, p9 = 46.62)
plant_species <- c("Arabidopsis thaliana", "Arabidopsis arenosa", "Arabidopsis lyrata", "Arabidopsis arenosa", "Arabidopsis arenosa", "Arabidopsis arenosa", "Arabidopsis lyrata", "Arabidopsis thaliana", "Arabidopsis thaliana", "Arabidopsis thaliana")

#Q1
plant_height_mm[plant_species == "Arabidopsis thaliana"] #index by logic
plant_height_mm[c("p0", "p9", "p10")] # index by name
plant_height_mm[7:10] # index by position

#Q2
# (1)
plant_height_mm[plant_species == "Arabidopsis arenosa"]
# (2)
plant_height_mm[plant_species != "Arabidopsis thaliana"]

#Q3
m <- mean(plant_height_mm)
sd <- sd(plant_height_mm)
plant_species[plant_height_mm>(m+sd)]

# You start with a list
l <- list(a = 1:3,
          b = 4:6)
# You want the mean of the first element, so you index by position
mean(l[1])

#subsetting lists with $ and [[]]

mean(l$a)
mean(l[[1]])

set.seed(1001)
# A linear regression model
x<-1:10
l <- list(x = 1:10,
          y = 2 * x + rnorm(10, sd = 2),
          coef = c(intercept = 1.326, slope = 1.635))

#Q7
plot(l$x, l$y)

#$ indexing

#Q8
l$x

l$coef["intecept"]
l$coef["slope"]

predicted_y <- l$coef[2]*l$x +l$coef[1]    

plot(l$x, l$y)
lines(l$x, predicted_y, col = "red")
