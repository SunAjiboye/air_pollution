# Import dataset
data("airquality")
head(airquality)
data <- airquality
summary(airquality)


# Clean data airquality
# Removes rows with missing values
data <- na.omit(airquality)  

# Rename data
new_airquality <- data

# Create new column name Heat Index
airquality_HeatIndex <- airquality$Temp + (airquality$Wind / 2)
head(new_airquality)

# Create new column name Pollution Level
airquality_PollutionLevel <- ifelse(airquality$Ozone < 50, "Low",
                                    ifelse(airquality$Ozone < 100, "Moderate", "High"))
print(airquality_PollutionLevel)
head(airquality_PollutionLevel)
airquality_PollutionLevel<- na.omit(airquality_PollutionLevel)

# Convert Month and Day into a Date column
airquality_Date <- as.Date(paste(1973, airquality$Month, airquality$Day, sep = "-"))
print(airquality_Date)
airquality_Data <- na.omit(airquality_Date)

#  Plot the Ozone levels over time
plot(airquality_Date, airquality$Ozone, type = "l", col = "blue", 
     xlab = "Date", ylab = "Ozone Levels", main = "Ozone Levels Over Time")

# Box Plot
boxplot(Ozone ~ Month, data = airquality, 
        xlab = "Month", ylab = "Ozone Levels", 
        main = "Ozone Levels by Month", 
        col = rainbow(5))



