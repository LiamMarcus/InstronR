# Load all librarys and load my custom functions
source(file="E:/Projects/Rutility/UtilityFunctions.R")

#Read all the tabs of the excel data file
dataFileName <- tclvalue(tkgetOpenFile())
myData<-importWorksheets(dataFileName)
names(myData)

#select the worksheet from the object myData
data<-myData$SdCrushInstron
names(data)

#Identify the factors and fix some of the units on variables
data$CurveID <- factor(data$CurveID)

xlabel="Deflection (inch x 1000)"
ylabel="Load (lbf)"
plotTitle="Instron Top Crush Data \n Aggregate Curve, 54 SD Tested Trays"
plotFile="InstronSDplot.png"
p1 <- ggplot(data, aes(x=Deflection, y=Load)) +
    geom_point(shape=1, size=0.9) +    # Use hollow circles
    geom_smooth(colour="red",size=0.5) +
    xlab(xlabel) +
    ylab(ylabel) +
    ggtitle(plotTitle)
# send the plot to the Rstudio viewer and make a pdf file
ggsave(p1,width=6,height=4,file=plotFile)
p1

length(unique(data$CurveID))
