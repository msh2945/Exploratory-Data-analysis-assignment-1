

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

########## Plot 1: Gloal Active power ############


png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(my.dat$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()




################# End of assignment 1: Part 1 ################
