######################### File created by Mehdi Shamohammadi ###########
######################### Date: 02/02/2021 #############################


my.dat<-read.table("C:/Users/PC/Desktop/Back up of laptop 2nd/Coursera Exploratory  data analysis/Assignment 1/household_power_consumption.txt",
                   header=TRUE,sep=";", skip=66630, 
                   nrows=2900, col.names=names(initial), na.strings=c("?"),
                   colClasses=c("character", "character","numeric","numeric","numeric","numeric",
                                "numeric","numeric","numeric"))

my.dat$Date<- as.Date(my.dat$Date, format = "%d/%m/%Y")
my.dat$Time<- strptime(paste(my.dat$Date,my.dat$Time),"%F %T")

my.dat<- subset(my.dat,my.dat$Date %in% as.Date(c("2007-02-01","2007-02-02")))

########## Plot 4: Combination of 4 plots ############

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2), mar=c(4.5,5,2,2))
# Plot 4.1
plot(my.dat$Time,my.dat$Global_active_power, ylab="Global Active Power (kilowatts)", 
     xlab="", pch =".", type="l")
# Plot 4.2
plot(my.dat$Time,my.dat$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(my.dat$Time,my.dat$Sub_metering_2, col="red", type="l")
points(my.dat$Time,my.dat$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(my.dat[,7:9]), bty="n")
# Plot 4.3
plot(my.dat$Time,my.dat$Voltage, ylab="Voltage", xlab="datetime", type="l")
# Plot 4.4
plot(my.dat$Time,my.dat$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
dev.off()


################# End of assignment 1: Part 4 ################
