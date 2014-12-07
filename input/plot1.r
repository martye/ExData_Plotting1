library("data.table")
dat<-fread("./data/household_power_consumption.txt")

dat3<-dat[(dat$Date=="2/2/2007") | (dat$Date=="1/2/2007")]
rm(dat)
hist(as.numeric(dat3[,dat3$Global_active_power]), 
     xlab="Global Active Power (kilowatts)", col="red", 
     main="Global Active Power", cex.axis=0.75, cex.lab=0.75)
dev.copy(png, file="plot1.png",width=480, height=480, units="px")
dev.off()