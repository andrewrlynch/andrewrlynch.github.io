plot.gtrends.silent <- function(x, ...) {
  df <- x$interest_over_time
  df$date <- as.Date(df$date)
  df$hits <- if(typeof(df$hits) == 'character'){
    as.numeric(gsub('<','',df$hits))
  } else {
    df$hits
  }
  
  df$legend <- paste(df$keyword, " (", df$geo, ")", sep = "")
  
  
  p <- ggplot(df, aes_string(x = "date", y = "hits", color = "legend")) +
    geom_line() +
    xlab("Date") +
    ylab("Search hits") +
    theme_bw() +
    theme(legend.title = element_blank()) +
    ylim(c(0,100)) + ggtitle(paste(df$keyword)) + theme(title = element_text(face = "bold", size = 10))
  
  invisible(p)
}

library(ggpubr)
library(gtrendsR)

Obama <- gtrends("Obama", time = "2010-1-1 2019-12-18")
Trump <- gtrends("Trump", time = "2010-1-1 2019-12-18")
Clinton <- gtrends("Clinton", time = "2010-1-1 2019-12-18")
TanSuit <- gtrends("Tan Suit", time = "2010-1-1 2019-12-18")
Ebola <- gtrends("Ebola", time = "2010-1-1 2019-12-18")
BirthCertificate <- gtrends("Birth Certificate", time = "2010-1-1 2019-12-18")
Election <- gtrends("Election", time = "2010-1-1 2019-12-18")
Impeachment <- gtrends("Impeachment", time = "2010-1-1 2019-12-18")
Birther <- gtrends("Birther", time = "2010-1-1 2019-12-18")

ISIS <- gtrends("ISIS", time = "2010-1-1 2019-12-18")
ArabSpring <- gtrends("Arab Spring", time = "2010-1-1 2019-12-18")
WhiteNationalism <- gtrends("White Nationalism", time = "2010-1-1 2019-12-18")
MassShooting <- gtrends("Mass Shooting", time = "2010-1-1 2019-12-18")


Anxiety <- gtrends("Anxiety", time = "2010-1-1 2019-12-18")

JerseyShore <- gtrends("JerseyShore", time = "2010-1-1 2019-12-18")
BreakingBad <- gtrends("BreakingBad", time = "2010-1-1 2019-12-18")
GameOfThrones <- gtrends("Game of Thrones", time = "2010-1-1 2019-12-18")
ParksRec <- gtrends("Parks and Recreation", time = "2010-1-1 2019-12-18")

FidgetSpinner <- gtrends("FidgetSpinner", time = "2010-1-1 2019-12-18")
Planking <- gtrends("Planking", time = "2010-1-1 2019-12-18")
HarlemShake <- gtrends("Harlem Shake", time = "2010-1-1 2019-12-18")
Kony2012 <- gtrends("Kony 2012", time = "2010-1-1 2019-12-18")
IceBucketChallenge <- gtrends("Ice Bucket Challenge", time = "2010-1-1 2019-12-18")
Flossing <- gtrends("Flossing", time = "2010-1-1 2019-12-18")
BlueGoldDress <- gtrends("What Color Is The Dress", time = "2010-1-1 2019-12-18")
Twerking <- gtrends("Twerking", time = "2010-1-1 2019-12-18")
YannyLaurel <- gtrends("Yanny v Laurel", time = "2010-1-1 2019-12-18")

pObama <- plot.gtrends.silent(Obama) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pTrump <- plot.gtrends.silent(Trump) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pClinton <- plot.gtrends.silent(Clinton) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pTanSuit <- plot.gtrends.silent(TanSuit) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pEbola <- plot.gtrends.silent(Ebola) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pBirthCertificate <- plot.gtrends.silent(BirthCertificate) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pElection <- plot.gtrends.silent(Election) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pImpeachment <- plot.gtrends.silent(Impeachment) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pMueller <-  plot.gtrends.silent(Mueller) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")
 
pArabSpring <-  plot.gtrends.silent(ArabSpring) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "Goldenrod")

pISIS <-  plot.gtrends.silent(ISIS) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "Goldenrod")

pWhiteNationalism <-  plot.gtrends.silent(WhiteNationalism) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "Goldenrod")

pMassShooting <-  plot.gtrends.silent(MassShooting) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "Goldenrod")

pBirther <-  plot.gtrends.silent(Birther) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "dodgerblue3")

pAnxiety <-  plot.gtrends.silent(Anxiety) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("")

pBreakingBad <-  plot.gtrends.silent(BreakingBad) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "green4")

pGameOfThrones <-  plot.gtrends.silent(GameOfThrones) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "green4")

pJerseyShore <-  plot.gtrends.silent(JerseyShore) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "green4")

pParksRec <-  plot.gtrends.silent(ParksRec) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pFidgetSpinner <-  plot.gtrends.silent(FidgetSpinner) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pPlanking <-  plot.gtrends.silent(Planking) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pHarlemShake <-  plot.gtrends.silent(HarlemShake) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pKony2012 <-  plot.gtrends.silent(Kony2012) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pIceBucketChallenge <-  plot.gtrends.silent(IceBucketChallenge) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pFlossing <-  plot.gtrends.silent(Flossing) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pBlueGoldDress <-  plot.gtrends.silent(BlueGoldDress) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pTwerking <-  plot.gtrends.silent(Twerking) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_blank(), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")

pYannyLaurel <-  plot.gtrends.silent(YannyLaurel) + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + theme(axis.text.x = element_text(angle = 90), legend.position = "none", axis.ticks.x = element_blank(), plot.margin = unit(c(0.1,0.25,-0.5,0.25), "lines"), axis.title.y = element_blank()) + xlab("") + geom_line(col = "magenta")



ggarrange(pObama, pTanSuit, pEbola, pBirthCertificate, pBirther, pTrump, pClinton, pElection, pImpeachment, pMueller, pArabSpring, pISIS, pWhiteNationalism, pMassShooting, pAnxiety, pJerseyShore, pBreakingBad, pGameOfThrones, pParksRec, pFidgetSpinner, pPlanking, pHarlemShake, pKony2012, pIceBucketChallenge, pFlossing, pBlueGoldDress, pTwerking, pYannyLaurel,ncol = 1)


axis.text.x = element_text(angle = 90)
