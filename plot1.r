# Exploratory data analysis week 1 assignment
# This file contains the code to create Plot1
# Author      - Vinicius Pereira
# Github link - https://github.com/vcoinp/ExData_Plotting1

#--------------- CREATING PLOT 1 CODE ------------------------------------------------------------------------------------

# Reads data from "household_power_consumption.txt"
energyConsuptionDataSet <- read.table("household_power_consumption.txt",header = TRUE,sep=";")

# Format the column date to "date" type
energyConsuptionDataSet$Date <- as.Date( as.character(energyConsuptionDataSet$Date), "%d/%m/%Y")

# Extract only the dates 2007-02-01 and 2007-02-02
energyConsuptionDataSet <- subset(energyConsuptionDataSet, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

# Create DateTime column
energyConsuptionDataSet$DateTime <- as.POSIXct(paste(energyConsuptionDataSet$Date, energyConsuptionDataSet$Time), format="%Y-%m-%d %H:%M:%S")

# Initiates PNG "file plot1"
png(file="plot1.png",width=480,height=480)

# Create histogram with columns in red and changing "x axis" description and "title"
hist(as.numeric(energyConsuptionDataSet$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

# Closes device
dev.off()



