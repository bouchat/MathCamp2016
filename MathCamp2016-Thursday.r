#Welcome to R! You can use the R console. You can also use RStudio.
#Lesson 1: Comment on your code using the '#' symbol.

#####################################
# STEP 1: SETTING UP YOUR SCRIPT FILE
#####################################

#Begin the script file with a label for yourself and others:

#File Name: XXXX
#Data: [Insert dataset name here]
#Author: XXXX
#Date: XXXX

#Next, set your working directory. This way you can save throughout without naming new file paths.
#A working directory lets R know where to look for files and data you reference, and where to deposit output you save
setwd("/Users/Sarah Bouchat/Dropbox/WISC/Math Camp")
#If you are using Winstat or the SSCC computers, use your U drive this way
setwd("U:/Section")
#In order to do this, you must have a folder named "Section" (or whatever you'd like to call it) in your U drive already. To get to the U drive, click on the Windows button on the menu bar, and then your name. It should be in the list of drives on the left

#####################################
# STEP 2: DATA
#####################################

#There are many ways to enter data into R

#First, you can enter it manually
#Use '<-' to assign data into a variable/object

#Scalar example
scalar<-2
X<-3

#Vector or matrix examples
set<-c(1,2,3,4,5,6)
# The matrix command takes first "data", then nrow then ncol
matrix.1<-matrix(set,nrow=3, ncol=2, byrow=F)
matrix.2<-matrix(1,2,3)
matrix.3<-diag(3)

#You can always retrieve elements of matrices, etc., as well
matrix.2[1,2]

#Need help? You can always ask R
help(matrix)
?matrix
??matrix

#You can also use that syntax from matrices more generally for all dataframes
matrix.4<-matrix.1[-1,]
matrix.4

#Note that the "data" can be numeric or string
streetnames<-c("Langdon", "Park", "University", "Observatory")

#Check that R remembers what we've entered and see what each object looks like
scalar
X
matrix.1
matrix.2
matrix.3

#Be careful! R is case sensitive
counting.is.fun<-c(1,2,3)
counting.is.fun
Counting.is.fun

#You can always remove variables with 'rm()'
rm(counting.is.fun)
counting.is.fun

#Check what variables remain in the workspace with 'ls()'
ls()

#Burn it down: remove everything from the workspace! 
rm(list=ls())

#You can save your work history this way
savehistory(file="filename.Rhistory")

#The other way to enter data is to pull in a dataset from outside R
#These datasets can be .csv, .dta, etc. formats
#To use these different data file formats, you need to have the 'foreign' package installed and to tell R what kind of file it's reading
# We'll be talking much more about this tomorrow
apsr<-read.dta("apsr.dta")
summary(apsr)

#####################################
# STEP 3: BASICS OF COMPUTATION IN R
#####################################

#You can use R as a fancy calculator if you want
1+1
9^2
sqrt(2)

#You can also store calculations for later use:
Addition<-2+2
Multiplication<-3*5000

#You can also do operations with the vectors you've already created
mean(set)
sum(set)
#And get R to remind you about the structure of the data
length(set)

#R also does slightly less basic computations, like matrix multiplication
#Recall that:
# matrix.2<-matrix(1,2,3)
#Now let's make a second matrix to play with... one that's conformable!
matrix.5<-matrix(6,3,2)

#We can multiply them this way
matrix.2 %*% matrix.5

#Don't worry about these right now, just keep them in mind for later

#Use R to find the cdf
pnorm(2,mean=0, sd=1)
pnorm(3,4,5)
x<-pnorm(3,4,5)

#Look up quantiles
qnorm(.5, 4,5)
qnorm(x,4,5)
help(qnorm)

#Find the density
#How likely it is that a fair coin turns up heads exactly 4 times in 10 trials?
dbinom(4,size=10,prob=0.5)


#Doing factorials with R

fact2<-factorial(2)
fact2.byhand<-2*(2-1)
fact10<-factorial(10)
fact10.byhand<-10*9*8*7*6*5*4*3*2*1

#Verify that factorial() gives you the same answer
identical(fact10, fact10.byhand)

#Binomial coefficient: number of combinations of k items that can be selected from a set n

#How many ways can we select paired teams from a class of 10 people? 
#n is 10
#k is 2
#Want to compute: 10 choose 2

#By hand, n choose k is:
#n!/(k!)(n-k!)

#Exercise: Do this with factorial()
Tenchoosetwo<-(factorial(10))/(factorial(2)*factorial(8))
Tenchoosetwo

#But R can do this calculation for us more easily with choose()***
choose<-choose(10,2)

#Verify that this is the same as by hand:
identical(Tenchoosetwo, choose)

#Careful! Order matters
choose(2,10)


#*** Note that another option is nChoosek, which performs the same function. To use this option, however, you will have to load the R.basic package using library(R.basic)


#####################################
# STEP 4: USING PACKAGES
#####################################

#These will usually come at the beginning of your script file, just after you set the working directory and before you load your data

#Load packages you will need 
library(foreign)
library (MASS)
library(xtable)

#If you've never used a package before, you may have to install it first:
install.packages("reshape")
library(reshape)

#R often automatically loads dependent packages for you, but if not it will let you know












#***Many thanks to Emily Sellars for previous years' notes!***