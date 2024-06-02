# Loading Libraries: At the top of each R Script we will typically load in 
#                    and libraries that we need for an analysis

# If you are using a local installation of R, you may need to install these packages. 
install.packages("tidyverse")
library(tidyverse)
library(stats)
library(dplyr)
library(ggplot2)


setwd("/home/nastaran.rahimi/") 

# Base R Overview: Copy Commands to terminal
1 + 2
5 * 10
abs(-1)
abs(-5)
abs(6)
plot(5,1)
hist(1)

#Getting More Information about R Commands
?abs
help(abs)
help(library)
?library
#=============================== Code Application ===============================
# //ToDo: Use R's help commands to get more information about plot() and 
#         hist(). Implement example code to create a basic R plot &
#         histogram plot. 


#================================================================================



# Scripting Basics

# <- is the assignment operator used to assign data to a variable
x<-9
x

#[1] 8

if(x == 8)
{
  print("TRUE")  # Statement
} else {
  print("no")
}



#Now, let's explore data types in R

# +++++++++++++++++++++ Numeric Data +++++++++++++++++++++++++++++++++++++++++++

# Assign a decimal value to x
x = 3.9

# What is the default class name of x?
print(class(x))
#1] "numeric"

# Now look at the type of x - Note "double" decimal type
print(typeof(x))
#[1] "double"

#What happens when we assign a variable to an integer?
y = 4
print(is.integer(y))
#[1] FALSE

#Numeric is the default data type in R
print(class(y))
#[1] "numeric"

#We must specify that we wish to assign an integer value to a variable
y <- as.integer(4)
print(class(y))

y <- 4
y <- 4L; x = 4
print(class(y))


# +++++++++++++++++++++ Logical/Boolean Data +++++++++++++++++++++++++++++++++++++++++++
x = 7; y = 8

# We can compare variables in R using the <, >, and = signs

# Let's ask R is variable x is greater than y?
z = x > y

print(z)
print(typeof(z))
print(class(z))



#=============================== Code Application ===============================
# //ToDo: Given a set of two numbers, convert those numbers to integers and then
#         use R to answer whether x is less than or equal to y?
x = 7.18; y = 9.99

#================================================================================


# +++++++++++++++++++++ Character data +++++++++++++++++++++++++++++++++++++++++++
characterString <- "Hello World"

print(characterString)
print(typeof(characterString))



# +++++++++++++++++++++ Basic Data Structures in R +++++++++++++++++++++++++++++++++++++++++++

c()

#Code to make a vector:
myVector <- c("This", "is", "my", "vector")
myVector
#[1] "This"   "is"     "my"     "vector"

#Let's convert to a factor
myVectortoFactor <- factor(myVector)
myVectortoFactor
#[1] This   is     my     vector
#Levels: is my This vector

#We may need to re-level our factor since R orders variable alphabetically
relevel(myVectortoFactor, ref = "This")
#[1] This   is     my     vector
#Levels: This is my vector


sfactor <- as.factor("stringToVec")

#Making Vectors in R
vector.numerical <- c(1.00,2.87,3.25,4.35,5.86)
vector.integer <- c(1L, 2L, 3L, 4L, 5L)
vector.boolean <- c(TRUE, FALSE, T, F, T)
vector.string <- c("male", "female", "male", "female", "male")
vector.string.factorized <- as.factor(c("male", "female", "male", "female", "male"))

#What happens with different data types?
vector.transformed.to.character <- c("T", 1, FALSE)
vector.transformed.to.character

vector.transformed.to.numerical <- c(1, TRUE)
vector.transformed.to.numerical

#Making Lists in R
myList <- list(vector.numerical, vector.integer)



View(myList)

#Making DataFrames in R
data.frame(vector.numerical, vector.integer, vector.boolean, vector.string)
as.data.frame()



#Writing Functions in R
findProduct <- function(Value1, Value2){
  product <- Value1 * Value2
  return(product)
}

findProduct(8,9)
#[1] 72


findProduct <- function(Value1, Value2) {
  product <- Value1 * Value2
  return(product)
}


x
product

findProduct(10,10)

#=============================== Code Application ===============================
#//ToDo: Given a set of vectors, write a function to return a list of average of 
#        each value. Then, create a data frame labeling rows and columns by 
#        vector headers

#================================================================================




# +++++++++++++++++++++ Loops in R +++++++++++++++++++++++++++++++++++++++++++

#If Else Loop:
a <- 500
b <- 49

if (b>a){
  print("b is greater than a")
} else if (a==b) {
  print("a and b are equal")
} else {
  print("a is greater than b")
}

#While Loop:
i <- 1
while (i < 4) {
  print(i)
  i <- i+1
  if (i==3){
    break
  }
}

#For Loop:
for (x in 1:4){
  print(x)
}






#Let's create a dataframe: Note vectors must be of the same length
species_num <- c(1L, 2L, 3L, 4L)
species_class <- c("dog", "human", "mouse", "fish")
age <- c(1.5, 36.2, 1.0, 5.9)

df <- data.frame(species_num, species_class, age)
df
#  species_num species_class  age
#1           1           dog  1.5
#2           2         human 36.2
#3           3         mouse  1.0
#4           4          fish  5.9

#We can use lists if we wish to retain the standard data structures
list1 <- list(species_num, species_class, age)
list1
#[[1]]
#[1] 1 2 3 4
#
#[[2]]
#[1] "dog"   "human" "mouse" "fish" 
#
#[[3]]
#[1]  1.5 36.2  1.0  5.9




# +++++++++++++++++++++ Let's write a recursive function +++++++++++++++++++++++++++++++++++++++++++


# Given a set of numbers, write a function which 
# recursively adjusts number x until it is equal to y

recursionFunc <- function(x, y) {
  if (x > y) {
    result <- x + recursionFunc(x-1, y) + y
    print(result)
  } else if (x < y) {
    results <- x + recursionFunc(x+1, y) + y
    print(results)
  } else if (x == y){
    results = x + y
    return(results)
  }
}

recursionFunc(10,5)  


#Basic Statistics using the nycflights13 data set along with dataset merging
#require(tidyverse)
install.packages("nycflights13")
require(nycflights13)
require(dplyr)

#Let's start by looking at the datasets included in the nycflights13 flight package
head(airlines)
head(airports)
head(planes)
head(weather)
head(flights)

#What are some common columns between these data sets which we can use as primary/foreign keys
head(flights$tailnum); head(planes$tailnum)
head(flights$carrier); head(airlines$carrier)

#Are there any columns that specify the same values but have different keys?
head(flights$origin); head(airports$faa)

#A good best practice to get into the habit of is verifying that our keys uniquely identify each observation

#Let's use the count function on primary keys to make sure we have n>1 for each entry. 
#Note: We can do this in one command using pipes

planes |> dplyr::count(tailnum) |> filter(n>1)
## A tibble: 0 × 2
# ℹ 2 variables: tailnum <chr>, n <int>

weather %>% dplyr::count(time_hour, origin) %>% filter(n>1)
# A tibble: 0 × 3
# ℹ 3 variables: time_hour <dttm>, origin <chr>, n <int>

#Let's also check for missing values:
planes |> filter(is.na(tailnum))
weather %>% filter(is.na(time_hour) | is.na(origin))

#Let's create a simpler dataset from flight with only variables that we want to join
flights_to_join <- flights %>% select(year, time_hour, origin, dest, tailnum, carrier)
head(flights_to_join)
# A tibble: 6 × 6
#year time_hour           origin dest  tailnum carrier
#<int> <dttm>              <chr>  <chr> <chr>   <chr>  
#  1  2013 2013-01-01 05:00:00 EWR    IAH   N14228  UA     
#2  2013 2013-01-01 05:00:00 LGA    IAH   N24211  UA     
#3  2013 2013-01-01 05:00:00 JFK    MIA   N619AA  AA     
#4  2013 2013-01-01 05:00:00 JFK    BQN   N804JB  B6     
#5  2013 2013-01-01 06:00:00 LGA    ATL   N668DN  DL     
#6  2013 2013-01-01 05:00:00 EWR    ORD   N39463  UA   

head(airlines)
# A tibble: 6 × 2
#carrier name                    
#<chr>   <chr>                   
#  1 9E      Endeavor Air Inc.       
#2 AA      American Airlines Inc.  
#3 AS      Alaska Airlines Inc.    
#4 B6      JetBlue Airways         
#5 DL      Delta Air Lines Inc.    
#6 EV      ExpressJet Airlines Inc.

#Let's join these datasets by carrier to add airline operator info to the flights_to_join dataset
flights_to_join %>% left_join(airlines, by = join_by(carrier))
'''
# A tibble: 336,776 × 7
    year time_hour           origin dest  tailnum carrier name                    
   <int> <dttm>              <chr>  <chr> <chr>   <chr>   <chr>                   
 1  2013 2013-01-01 05:00:00 EWR    IAH   N14228  UA      United Air Lines Inc.   
 2  2013 2013-01-01 05:00:00 LGA    IAH   N24211  UA      United Air Lines Inc.   
 3  2013 2013-01-01 05:00:00 JFK    MIA   N619AA  AA      American Airlines Inc.  
 4  2013 2013-01-01 05:00:00 JFK    BQN   N804JB  B6      JetBlue Airways         
 5  2013 2013-01-01 06:00:00 LGA    ATL   N668DN  DL      Delta Air Lines Inc.    
 6  2013 2013-01-01 05:00:00 EWR    ORD   N39463  UA      United Air Lines Inc.   
 7  2013 2013-01-01 06:00:00 EWR    FLL   N516JB  B6      JetBlue Airways         
 8  2013 2013-01-01 06:00:00 LGA    IAD   N829AS  EV      ExpressJet Airlines Inc.
 9  2013 2013-01-01 06:00:00 JFK    MCO   N593JB  B6      JetBlue Airways         
10  2013 2013-01-01 06:00:00 LGA    ORD   N3ALAA  AA      American Airlines Inc.  
# ℹ 336,766 more rows
# ℹ Use `print(n = ...)` to see more rows 
'''


#How would we find out the temperature and wind speed when each plane departed?
flights_to_join %>% left_join(weather %>% select(origin, time_hour, temp, wind_speed))
head(flights_to_join)
'''
Joining with `by = join_by(time_hour, origin)`
# A tibble: 336,776 × 8
    year time_hour           origin dest  tailnum carrier  temp wind_speed
   <int> <dttm>              <chr>  <chr> <chr>   <chr>   <dbl>      <dbl>
 1  2013 2013-01-01 05:00:00 EWR    IAH   N14228  UA       39.0       12.7
 2  2013 2013-01-01 05:00:00 LGA    IAH   N24211  UA       39.9       15.0
 3  2013 2013-01-01 05:00:00 JFK    MIA   N619AA  AA       39.0       15.0
 4  2013 2013-01-01 05:00:00 JFK    BQN   N804JB  B6       39.0       15.0
 5  2013 2013-01-01 06:00:00 LGA    ATL   N668DN  DL       39.9       16.1
 6  2013 2013-01-01 05:00:00 EWR    ORD   N39463  UA       39.0       12.7
 7  2013 2013-01-01 06:00:00 EWR    FLL   N516JB  B6       37.9       11.5
 8  2013 2013-01-01 06:00:00 LGA    IAD   N829AS  EV       39.9       16.1
 9  2013 2013-01-01 06:00:00 JFK    MCO   N593JB  B6       37.9       13.8
10  2013 2013-01-01 06:00:00 LGA    ORD   N3ALAA  AA       39.9       16.1
# ℹ 336,766 more rows
# ℹ Use `print(n = ...)` to see more rows
'''


#Now let's explore GGPlot2 - plot the number of flight each month of 2013
#install.packages("ggplot2")
require(ggplot2)
require(scales)

ggplot(flights, aes(x = month)) + 
  geom_histogram(binwidth = 0.5) + 
  ggtitle("Number of Flights per Month of 2013")+
  ylab("# Flights each Month") + 
  xlab("Month #") + 
  scale_x_continuous(breaks= pretty_breaks())



ggplot2::ggplot()


# Filter Flights which arrived outside of scheduled arrival time. 
# Based on analysis from vignette: http://vaibhavwalvekar.github.io/Portfolio_NYCFlights.pdf
flights_late <- filter(flights, arr_time > sched_arr_time)
flights_early <- filter(flights, arr_time <= sched_arr_time)


#Group delayed flight by origin and time as we want to know whether weather affected the delay
time_df <- group_by(flights_late, origin, time_hour)

#Calculating the average time delay per airport per time_hour and
#also calculating the number of flights per airport per time_hour
arr_delay_count = summarize(time_df,totaldelay = mean(arr_delay),
                            count = n())

#Calculate the average delay per airport per time entry and find the number of flights per airport per time entry
combine_df = merge(arr_delay_count, weather,by=c("origin","time_hour"))



#Working on the combined df, group= by precipitation to see trends between Late Flights and Weather Factors
by_precip = group_by(combine_df,precip)
#Calculating average delay 
avg_delay_v = summarize(by_precip,avg_dep_delay_time = mean(totaldelay))

#Plot GGplot
p1 <- ggplot(avg_delay_v, aes(x = precip, y = avg_dep_delay_time, color=avg_dep_delay_time))
p1 + geom_point() + geom_smooth(method = "lm") +labs(x = "Precipitation (inches)",
                                                     y="Average Late Landing Time (minutes)",
                                                     title = "Time vs. Average Arrivale Delay")


