
pkg_needed = c('readxl', 'dplyr', "rJava")

install.packages(pkg_needed, dependencies = TRUE)


library('readxl') # To read excel files (xls, xlsx formats)
library('dplyr') # data management and piping

# Read data
data <- read_excel(path = "C:/Users/alagat/Desktop/NAR/data/data.xls",
                   sheet = "cData",
                   col_names = TRUE
                   )


# data exploration
dim(data) # check size of the dataframe

View(data) # View the full data!

head(data) # check top 5 rows
tail(data, n = 7) # check bottom 7 rows

data$PH # values of column PH in the data
p = data$PH # assign to new object name
data$ph = data$PH # create a new column
data$PH = data$PH # change values of column

data$PH = NULL # nullify(delete) column PH 

str(data) # check structure of data

# modify data type of column
as.factor(data$REP)

data$REP <- as.factor(data$REP)
data$EH <- as.numeric(data$EH)

# basic descriptives: mean(), sd(), min(), max(), median(), etc
mean(data) # mean of all numeric columns in the dataset
mean(data$EH) # mean of EH column

sd(data) # standard deviation of all numeric columns in the dataset
sd(data$EH) # standard deviation of EH column

summary(data) # summary - of all numeric columns in the dataset
summary(data$EH) #summary - of the EH column

fivenum(data$PLOT) # summary - minimum, lower-hinge, median, upper-hinge, maximum

#------------------------------------------------
# Basic plots

boxplot(data$EH) # boxplot
hist(data$EH) # histogram , main = "my first histogram"
plot(data$EH) # scatter plot

# subset data
data1 <- subset(data, EH<170)

data1 <- subset(data1, select =c(REP, ENTRY, GW, MOI))

plot(data1$EH)

#------------------------------------------------

write.csv(data = data1, "C:/Users/alagat/Desktop/NAR/data/results.csv")








