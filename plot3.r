# Exploratory data analysis week 1 assignment
# This file contains the code to create Plot3
# Author      - Vinicius Pereira
# Github link - https://github.com/vcoinp/ExData_Plotting1

#--------------- CREATING PLOT 3 CODE ------------------------------------------------------------------------------------

# Reads data from "household_power_consumption.txt"
energyConsuptionDataSet <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings="?")

# Format the column date to "date" type
energyConsuptionDataSet$Date <- as.Date(energyConsuptionDataSet$Date, "%d/%m/%Y")

# Extract only the dates 2007-02-01 and 2007-02-02
energyConsuptionDataSet <- subset(energyConsuptionDataSet, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create DateTime column
energyConsuptionDataSet$DateTime <- as.POSIXct(paste(energyConsuptionDataSet$Date, energyConsuptionDataSet$Time), format="%Y-%m-%d %H:%M:%S")

# Initiates PNG "file plot3"
png(file="plot3.png",width=480,height=480)

# Creates the line chart setting x and y axes names with measure Sub_metering_1
plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

# Add line for measure Sub_metering_2
lines(energyConsuptionDataSet$DateTime,energyConsuptionDataSet$Sub_metering_2, type = "l", col = "red")

# Add line for measure Sub_metering_3
lines(energyConsuptionDataSet$DateTime,energyConsuptionDataSet$Sub_metering_3, type = "l", col = "blue")

# Add legend in the chart
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)

# Closes device
dev.off()