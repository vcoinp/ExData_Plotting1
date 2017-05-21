# Exploratory data analysis week 1 assignment
# This file contains the code to create Plot2
# Author      - Vinicius Pereira
# Github link - https://github.com/vcoinp/ExData_Plotting1

#--------------- CREATING PLOT 2 CODE ------------------------------------------------------------------------------------

# Reads data from "household_power_consumption.txt"
energyConsuptionDataSet <- read.table("household_power_consumption.txt",header = TRUE,sep=";")

# Format the column date to "date" type
energyConsuptionDataSet$Date <- as.Date( as.character(energyConsuptionDataSet$Date), "%d/%m/%Y")

# Extract only the dates 2007-02-01 and 2007-02-02
energyConsuptionDataSet <- subset(energyConsuptionDataSet, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

# Create DateTime column
energyConsuptionDataSet$DateTime <- as.POSIXct(paste(energyConsuptionDataSet$Date, energyConsuptionDataSet$Time), format="%Y-%m-%d %H:%M:%S")

# Initiates PNG "file plot2"
png(file="plot2.png",width=480,height=480)

# Creates the line chart setting x and y axes names 
 plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Global_active_power, type="l" , xlab="", ylab="Global Active Power (kilowatts)")
 
# Closes device
dev.off()

