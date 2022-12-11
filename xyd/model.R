library(pROC)
data <- read.csv("subsetted_cols.csv")
colnames(data)

apply(is.na(data),2,sum)/438693*100
data <- data[,-which(names(data) %in% c('PDIABTST','PREDIAB1','INSULIN1','DOCTDIAB'))]
data$X_MICHD <- data$X_MICHD-1
data <- na.omit(data)


# divide the dataset
n <- nrow(data)
ind <- sample(n, 0.8*n)
train <- data[ind,]
test <- data[-ind,]

# logistic regression on train dataset
model1 <- glm(X_MICHD~.,data=train, family = "binomial")
summary(model1)

# ROC curve on train & test dataset
par(mfrow=c(1,2))
pred_train_p <- predict(object = model1,newdata = train,type = "response")
roc_train <- roc(train$X_MICHD,pred_train_p,quiet = T)
plot(roc_train, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")

pred_test_p <- predict(object = model1,newdata = test,type = "response")
roc_test <- roc(test$X_MICHD,pred_test_p,quiet = T)
plot(roc_test, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")

# full logistic regression model result
full_model <- glm(X_MICHD~.,data=data, family = "binomial")
summary(full_model)