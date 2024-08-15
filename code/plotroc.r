### https://rstudio-pubs-static.s3.amazonaws.com/313760_3b2a1f8a53f6453db0b0b9db3e81544d.html
library(plotROC)
library(pROC)
library(ROCR)
data=read.table("roccurve_input_file",header=T,sep="\t")

caf.act <- prediction(data$CAF_Pred, data$CAF_Actual)
perf.cafact <- performance(caf.act, 'tpr', 'fpr')

cd8.act <- prediction(data$CD8_Pred, data$CD8_Actual)
perf.cd8act <- performance(cd8.act, 'tpr', 'fpr')

ExmiR.act <- prediction(data$ExmiR_Pred, data$ExmiR_Actual)
perf.exmiract <- performance(ExmiR.act, 'tpr', 'fpr')

immuno.act <- prediction(data$Immuno_Pred, data$Immuno_Actual)
perf.immunoact <- performance(immuno.act, 'tpr', 'fpr')

tam.act <- prediction(data$TAM_Pred, data$TAM_Actual)
perf.tamact <- performance(tam.act, 'tpr', 'fpr')

tme.act <- prediction(data$TME_Pred, data$TME_Actual)
perf.tmeact <- performance(tme.act, 'tpr', 'fpr')

plot(perf.cafact, col="red",main="Testing Dataset (GSE163882)")
plot(perf.cd8act, col="blue",add=TRUE)
plot(perf.exmiract, col="black",add=TRUE)
plot(perf.immunoact, col="orange",add=TRUE)
plot(perf.tamact, col="pink",add=TRUE)
plot(perf.tmeact, col="brown",add=TRUE)

legend(0.6,0.27,c('CAF, AUC = 0.40','CD8, AUC = 0.66','Ex-miRs, AUC = 0.72', 'Immune, AUC = 0.58', 'TAM, AUC = 0.65', 'TME, AUC = 0.67'),col=c('red','blue','maroon','black','orange','pink','brown'),lwd=3)

ggsave("Image.png", units="in", width=6, height=4, dpi=600)
dev.off()
