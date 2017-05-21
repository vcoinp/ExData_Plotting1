# Exploratory data analysis week 1 assignment
# This file contains the code to create Plot4
# Author      - Vinicius Pereira
# Github link - https://github.com/vcoinp/ExData_Plotting1

#--------------- CREATING PLOT 4 CODE ------------------------------------------------------------------------------------

# Reads data from "household_power_consumption.txt"
energyConsuptionDataSet <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings="?")

# Format the column date to "date" type
energyConsuptionDataSet$Date <- as.Date( as.character(energyConsuptionDataSet$Date), "%d/%m/%Y")

# Extract only the dates 2007-02-01 and 2007-02-02
energyConsuptionDataSet <- subset(energyConsuptionDataSet, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

# Create DateTime column
energyConsuptionDataSet$DateTime <- as.POSIXct(paste(energyConsuptionDataSet$Date, energyConsuptionDataSet$Time), format="%Y-%m-%d %H:%M:%S")

# Initiates PNG "file plot4"
png(file="plot4.png",width=480,height=480)

# Specify mfcol - matrix()2,2
par(mfcol = c(2,2))
#------------------------------------------------Chart 1---------------------------------------------------------------------------------------------
# Creates the line chart setting x and y axes names 
 plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Global_active_power, type="l" , xlab="", ylab="Global Active Power")
 
#------------------------------------------------Chart 2---------------------------------------------------------------------------------------------
# Creates the line chart setting x and y axes names with measure Sub_metering_1 
plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")

# Add line for measure Sub_metering_2
lines(energyConsuptionDataSet$DateTime,energyConsuptionDataSet$Sub_metering_2, type = "l", col = "red")

# Add line for measure Sub_metering_3
lines(energyConsuptionDataSet$DateTime,energyConsuptionDataSet$Sub_metering_3, type = "l", col = "blue")

# Add legend in the chart
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)

#------------------------------------------------Chart 3---------------------------------------------------------------------------------------------
# Creates the "Voltage chart"
plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Voltage, type="l" , xlab="datetime", ylab="Voltage")

#------------------------------------------------Chart 4---------------------------------------------------------------------------------------------
# Creates the "Global reactive chart"
plot(energyConsuptionDataSet$DateTime, energyConsuptionDataSet$Global_reactive_power, type="l" , xlab="datetime", ylab="Global_reactive_power")



# Closes device
dev.off()

