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


# Select numeric columns from the dataset)
numeric_data <- new_airquality[, c("Ozone", "Solar.R", "Wind", "Temp")]
print(numeric_data)

# Find correllation matrix
correlation_matrix <- cor(numeric_data, use = "complete.obs")

# Calculate the frequency of each category
# Calculate the frequency of each category
# Calculate the frequency of each category
pollution_counts <- table(new_airquality$"ozone")
print(pollution_counts)                          
                          

# Compute the correlation matrix
correlation_matrix <- cor(new_airquality[, c("Ozone", "Solar.R", "Wind", "Temp")], use = "complete.obs")

# Extract the upper triangular matrix (excluding the diagonal)
cor_values <- correlation_matrix[upper.tri(correlation_matrix)]

# Create a pie chart of the absolute correlation values
pie(abs(cor_values), 
    labels = paste0("Corr: ", round(abs(cor_values), 2)), 
    col = rainbow(length(cor_values)), 
    main = "Pie Chart of Correlation Strengths")








