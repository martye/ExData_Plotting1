library("data.table")
dat<-fread("./data/household_power_consumption.txt")

dat3<-dat[(dat$Date=="2/2/2007") | (dat$Date=="1/2/2007")]
rm(dat)

x<-with(dat3, paste(Date,Time))
y<-strptime(x,"%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME","us")
with(dat3,plot(y,Global_active_power, type="l", xlab="",cex.axis=0.75,
               cex.lab=0.75,ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png",width=480, height=480, units="px")
dev.off()