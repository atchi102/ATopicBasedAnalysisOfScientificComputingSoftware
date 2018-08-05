
datCPP <- read.csv("CPP100.csv")
datMATLAB <- read.csv("MATLAB.csv")
datR <- read.csv("R.csv")

newdata <- mtcars[order(mpg),] 

names(datR)
datR[1:10,]

attach(datR)
Rsorted <- datR[order(Document.Entropy),]
detach(datR)

Rsorted[1:10,]

attach(datCPP)
CPPsorted <- datCPP[order(Document.Entropy),]
detach(datCPP)

attach(datMATLAB)
MATLABsorted <- datMATLAB[order(Document.Entropy),]
detach(datMATLAB)
MATLABsorted[1,]


require(ggplot2)
require(reshape2)

R.df <- data.frame(x=1:100, y=Rsorted$Document.Entropy)
MATLAB.df <- data.frame(x=1:100, y=MATLABsorted$Document.Entropy)
CPP.df <- data.frame(x=1:100, y=CPPsorted$Document.Entropy)

allDocEnt <- rbind(R.df, MATLAB.df, CPP.df)
allDocEnt$Language <- c(rep("R", nrow(R.df)), rep("MATLAB", nrow(MATLAB.df)), rep("CPP",nrow(CPP.df)))

ggplot(data=allDocEnt, aes(x=x, y=y, col=Language)) + theme_bw() + geom_line(aes(colour = Language)) + ylab('Document Entropy') + xlab('Topic') + ggtitle('Document Entropy vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggplot(data=allDocEnt, aes(x=x, y=y, col=Language)) + theme_bw() + geom_point(aes(shape=Language, color=Language)) + ylab('Document Entropy') + xlab('Topic') + ggtitle('Document Entropy vs Topic') + theme(plot.title = element_text(hjust = 0.5)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
