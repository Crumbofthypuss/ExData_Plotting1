#This code tries to create a plot of the global active power as time goes by
#It is assumed that you have the household_power_consumption.txt in your directory already
consumption<- read.delim("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE) #read file

#convert date and time to a better format so that subsetting works better
consumption$Date<- format(as.Date(consumption$Date,"%d/%m/%Y"),"%Y-%m-%d")
consumption$Time<- format(consumption$Time,format="%H:%M:%S")


#Mix Date and Time and include data for easier accessing later on
mixedDate<- strptime(paste(consumption$Date,consumption$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
consumption<- cbind(consumption,mixedDate)


#subset the data
subset<- subset(consumption, Date=="2007-02-01" | Date== "2007-02-02")


#plot and transfer in png
with(subset, plot(mixedDate,as.numeric(Global_active_power),xlab=" ", ylab="Global Active Power(kilowatts)",type="l"))
dev.copy(png,file="plot2.png", width=480,height=480)
dev.off()