dat <- read.csv("subsetted_cols.csv")

test <- as.data.frame(dat$GENHLTH)

test[test == 7 | test == 9] <- NA

SEXVAR <- dat[,"SEXVAR"]

subset1 <- dat[,c("GENHLTH","PERSDOC3","MEDCOST1","CHECKUP1",
                  "EXERANY2","CVDSTRK3","CHCSCNCR",
                  "CHCKDNY2","DIABETE4","EDUCA", "DECIDE",
                  "SMOKE100","X_CASTHM1","X_RACEGR3")]

subset1[subset1 == 7 | subset1 == 9] <- NA
# sum(is.na(subset1))

subset2 <- dat[,c("PHYSHLTH","MENTHLTH","PRIMINSR",
                  "INCOME3")]
subset2[subset2 == 77 | subset2 == 99 ] <- NA
# sum(is.na(subset1))

EMPLOY1 <- (dat[,c("EMPLOY1")])
EMPLOY1[EMPLOY1 == 9 ] <- NA

ALCDAY5 <- (dat[,"ALCDAY5"])
ALCDAY5[ALCDAY5 == 777 | ALCDAY5 == 999 ] <- NA
X_AGEG5YR <- dat[,"X_AGEG5YR"]

transformed <- cbind(SEXVAR,subset1,subset2,EMPLOY1,ALCDAY5,X_AGEG5YR)
write.csv(transformed, "transformed_data.csv")

