#This code tries to create a histogram of the global active power
#It is assumed that you have the household_power_consumption.txt in your directory already
consumption<- read.delim("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE) #read file

#convert date to a better format so that subsetting works better
consumption$Date<- format(as.Date(consumption$Date,"%d/%m/%Y"),"%Y-%m-%d")

#subset the data 
subset<- subset(consumption, Date=="2007-02-01" | Date== "2007-02-02")

#plot histogram and transfer in png
hist(as.numeric(subset$Global_active_power),col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()