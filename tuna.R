setwd("D:/METOPEL UAS/TATA METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("tuna.xlsx")
dat <- read_excel("tuna.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))


# Plot 
plot(dat$jepang,dat$dunia,xlab="Ekspor ke Jepang",ylab="Total Ekspor Tuna")
abline(h=0)

plot(dat$america,dat$dunia,xlab="Ekspor ke Amerika",ylab="Total Ekspor Tuna")
abline(h=0)

# regresi
reg1<-lm(dunia~jepang+america,data=dat)
summary(reg1)

# Pengaruh Ekspor Tuna Sirip Kuning ke Jepang terhadap Total Nilai Ekspor Tuna Indonesia.

#Y = Total Ekspor Tuna, X = Ekspor Ke Jepang, S = Ekspor ke Amerika

# Membuat error
dat$u<-resid(reg1)

# plot eror

dat$m<-resid(reg1)
plot(dat$dunia,dat$m,xlab="Total Ekspor Tuna",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$jepang,dat$m,xlab="Ekspor Tuna Ke Jepang",ylab="error")
abline(h=0)

dat$m<-resid(reg1)
plot(dat$america,dat$m,xlab="Ekspor Tuna Ke Amerika",ylab="error")
abline(h=0)

dat$m<-resid(reg1)
plot(dat$lkurs,dat$m,xlab="Nilai Tukar IDR/USD",ylab="error")
abline(h=0)

