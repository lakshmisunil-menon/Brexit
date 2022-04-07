#Store the file into a working directory
brexit_data <- read.csv("data_brexit_referendum.csv", na = "")
str(brexit_data)
#4
#Count number of -1 and replace with NA
sum(brexit_data$Leave)
# Count -1
sum(brexit_data$Leave[brexit_data$Leave == -1])
# Replace -1 with NA

brexit_data$Leave[brexit_data$Leave == -1]  <- NA

summary(brexit_data$Leave)
sum(is.na(brexit_data$Leave))

#Count NA
na_records <- brexit_data[!complete.cases(brexit_data),]
na_records
nrow(na_records)

#Pattern of missing values
library(mice)
md.pattern(brexit_data)

library(VIM)
missing_values <- aggr(brexit_data, prop = FALSE, numbers = TRUE)
summary(missing_values)
#Proportion variable
#Examining the proportion of voters 
#Who were in favour of leaving the EU
brexit_data$proportion = (brexit_data$Leave/brexit_data$NVotes)*100
#Creating vote variable which stores the decision to remain or leave 
brexit_data$Vote[brexit_data$proportion <= 50] <- "Remain"
brexit_data$Vote[brexit_data$proportion > 50] <- "Leave"

sum(is.na(brexit_data$Vote))

plot(brexit_data)
Region_name <- c("London",
                 "North West",
                 "North East",
                 "South West",
                 "South East",
                 "East Midlands",
                 "West Midlands",
                 "East of England",
                 "Yorkshire and the Humber")

Shortened_name < c ("L",
                    "NW",
                    "NE",
                    "SW", "SE", "EM", "WM", "EE", "Y")


brexit_data$ShortenedName[brexit_data$RegionName == "London"] <- "L"
brexit_data$ShortenedName[brexit_data$RegionName == "North West"] <- "NW"
brexit_data$ShortenedName[brexit_data$RegionName == "NorthEast"] <- "NE"
brexit_data$ShortenedName[brexit_data$RegionName == "South West"] <- "SW"
brexit_data$ShortenedName[brexit_data$RegionName == "South East"] <- "SE"
brexit_data$ShortenedName[brexit_data$RegionName == "East Midlands"] <- "EM"
brexit_data$ShortenedName[brexit_data$RegionName == "West Midlands"] <- "WM"
brexit_data$ShortenedName[brexit_data$RegionName == "East of England"] <- "EE"
brexit_data$ShortenedName[brexit_data$RegionName == "Yorkshire and the Humber"] <- "Y"

#View summary
summary(brexit_data)

numeric_variable_list <- sapply(brexit_data, is.numeric)
numeric_variable_list


#Create a subset of the dataframe containing only numeric data
numerical_data <- brexit_data[numeric_variable_list]






