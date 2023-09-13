########################################

###### R TRAINING in preparation for Genetic Gains analysis
#####  BASIC OVERVIEW OF R
##### 3 sections  A - Basic calcualtions, B - Data exploration  C - Simple analysis and graphic

# A
# R performs simple calculations - like a calculator

51+20
51-20
51*20
51/20

# defining an object 
a=51
b=20

a+b
a/b


# a small data object
d <- c(1,5,9)
e <- c(10,15,20)

a+d
d-e
e*a
a-e



############################
# B
# Save data files in a folder on your machine
# Pathway to folder location is your working directory
# Directory is where R will pick you data files AND save your outputs

#### NB. Set working directory - This directs R to the folder 

setwd("C:\\EsnathR.1\\GGTraining")



##### R PACKAGES - are commands/ functions developed to perform specific analysis. 
# each package will have unique coding instructions to perform analysis
# Packages are installed once,,....but activated/loaded on requirement


# List of required packages: Only once!
pkg_needed = c("rJava", 'readxl', 'dplyr')

# install the list of packages listed
install.packages(pkg_needed, dependencies = TRUE)

#-------------------------------------------

# load the packages: Everytime you open RStudio and interested to run the script


library('readxl') # To read excel files (xls, xlsx formats)
library('dplyr') # data management and piping




##### IMPORT your data into R. We are using the csv command.

data <- read.csv("test.csv")

#if your data has missing values use the below command
#data2 <- read.csv("test.csv", na.strings=".")



View(data)


head(data) # check top 5 rows
tail(data, n = 7) # check bottom 7 rows

data$PH # values of column PH in the data
data$ph = data$PH # create a new column
p = data$PH # assign to new object name --- we want to convert to m
p/100      #this calculation needs to be an object...below
p1 =p/100     #object p1
data$PH = p1 # change values of column

View(data)


data$ph = NULL # nullify(delete) column ph 
View(data)


str(data) # check structure of data , data should be numeric, assign your factors 

data$REP=as.factor(data$REP)
data$BLK=as.factor(data$BLK)
data$ENTRY=as.factor(data$ENTRY)


data$AD=as.numeric(data$AD)
data$ASI=as.numeric(data$ASI)

str(data)




##checking individual data points
length(data$EPP)
mean(data$EPP)
sd(data$EPP)
min(data$EPP)
max(data$EPP)

summary(data)  ### summary of all data

####looking at individual points for outliers

qqnorm(data$EH)    #### qqplots for normality
qqline(data$EH)
plot(data$EH) # scatter plot

boxplot(data$EH) # boxplot
hist(data$EH) # histogram , main = "my first histogram"




# subset data
data1 <- subset(data, EH<110)

##normality test

shapiro.test(data$EH) #non-normality if p-value lower than 0.05

data1 <- data[data$EH > 110,]   ####new dataset - data 1 without outlier ###discuss
boxplot(data1$EH)








###INSTALL THE PACKAGES (done once)

install.packages("ggplot2")       # plotting graphics
install.packages("lme4")          # linear models



### ACTIVATE THE PACKAGES (each time before use)

library(ggplot2)
library(lme4)





##### A simple linear model on the dataset - is there a linear relationship between grain yield and ASI (this is one dataset so performing on raw data as an exercise)

M1 <- lm(GYG ~ ASI, data = data)
summary(M1)
anova (M1)


##### Simple scatter plot using ggplot


ggplot(data, aes(x= ASI, y= GYG)) + 
  geom_point(size = 3, shape= 18, color="blue")+
  geom_smooth(method=lm,  linetype="dashed",
              color="darkred", fill="grey") +
  theme_classic()

######http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization







#################################  EXERCISE
#################################  EXERCISE
#################################  EXERCISE

# Section A - perform your own simple calculations, vectors
# Section B - identify outliers for GYG - if any
# Section C - investigate the linear relationship between GYG and another trait of interest, and share scatter plot with different colour
### share a screen shot of your unique scatter plot



