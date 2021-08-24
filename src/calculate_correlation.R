#パッケージの読み込み
#以下のパッケージを落とせるように、適宜insatll.packages()でダウンロードする
library(tidyr)
library(dplyr)
library(lme4)
library(lmerTest)
library(ggplot2)
library(pequod)

#公開されている相関係数を算出するためのパッケージmycorを読み込む
source("http://aoki2.si.gunma-u.ac.jp/R/src/mycor.R", encoding="euc-jp")#mycorを引っ張って来る

#psychパッケージを入れる
library(psych)

#相関算出用のデータの読み込み
raw_dat <- read.csv("../result/DatForCorrelation.csv")

#相関分析用にデータを整形
#関係しているやつを近くに持っていく
cor_dat <- raw_dat[, c(1,2,4,5,6,7,3,8,9,10,11,12,13,14,15)]

#2021/8/10:追記
#椿はひとだまだ、と、つららは水晶細工だはSND or AWD=Jに単語がないので、除外する
cor_dat <- cor_dat[cor_dat$Metaphor != "椿はひとだまだ" & cor_dat$Metaphor != "つららは水晶細工だ", ]

# 隠喩相関 #
cor_dat_metaphor <- subset(cor_dat, cor_dat$Presentation == "TV")
cor_dat_metaphor <- cor_dat_metaphor[ ,c(7:15)]
mycor(1:9, cor_dat_metaphor, latex = FALSE)

# 直喩相関 #
cor_dat_simile <- subset(cor_dat, cor_dat$Presentation == "S")
cor_dat_simile <- cor_dat_simile[ ,c(7:15)]
mycor(1:9, cor_dat_simile, latex = FALSE)

# 隠喩のデータを対象に、記述統計量を求める
cor_dat_metaphor_desc <- cor_dat_metaphor[, c(1:9)]
psych::describe(cor_dat_metaphor_desc)

#cor_dat_metaphor_descに対して相関係数を求める
mycor(1:9, cor_dat_metaphor_desc, latex=FALSE)

# 直喩のデータを対象に、記述統計量を求める
cor_dat_simile_desc <- cor_dat_simile[, c(1:9)]
mycor(1:9, cor_dat_simile_desc, latex = FALSE)
