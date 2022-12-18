library(pROC)
library(MASS)
library(xgboost)
library(fastDummies)
library(bigstatsr)
# data <- read.csv("../subsetted_cols.csv")
data <- read.csv("../subsetted_cols_RENAME.csv")
colnames(data)

apply(is.na(data),2,sum)/438693*100
data$HEARTDISEASE <- data$HEARTDISEASE-1
data <- na.omit(data)

# divide the dataset
n <- nrow(data)
ind <- sample(n, 0.8*n)
train <- data[ind,]
test <- data[-ind,]

# logistic regression on train dataset
lr_train <- glm(HEARTDISEASE~.,data=train, family = "binomial")
summary(lr_train)

# ROC curve on train & test dataset
par(mfrow=c(1,2))
pred_train_p <- predict(object = lr_train,newdata = train,type = "response")
roc_train <- roc(train$HEARTDISEASE,pred_train_p,quiet = T)
plot(roc_train, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")

pred_test_p <- predict(object = lr_train,newdata = test,type = "response")
roc_test <- roc(test$HEARTDISEASE,pred_test_p,quiet = T)
plot(roc_test, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")

# full logistic regression model result
full_model <- glm(HEARTDISEASE~.,data=data, family = "binomial")
summary(full_model)

# stepAIC(full_model)
# plot(full_model)

trainxg <- as.matrix(train[,!(names(train)=='HEARTDISEASE')])
testxg <- as.matrix(test[,!(names(test)=='HEARTDISEASE')])

xgb <- xgboost(data = trainxg, label = train$HEARTDISEASE, max.depth = 3,
        eta = 0.8, nthread = 4, nrounds = 100, objective = "binary:logistic",
        print_every_n = 20)

pred_xgb_test <- predict(xgb, testxg)
roc_test <- roc(test$HEARTDISEASE,pred_xgb_test,quiet = T)
plot(roc_test, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")


# xgboost encode
train_encode <- predict(xgb, trainxg, predleaf = TRUE)
train_encode_factor <- apply(train_encode, 2, as.factor)
train_encode_dummy <- dummy_cols(train_encode_factor,
                                 remove_first_dummy = TRUE,
                                 remove_selected_columns = TRUE)

test_encode <- predict(xgb, testxg, predleaf = TRUE)
test_encode_factor <- apply(test_encode, 2, as.factor)
test_encode_dummy <- dummy_cols(test_encode_factor,
                                remove_first_dummy = TRUE,
                                remove_selected_columns = TRUE)

# sparse logistic regression

train_fbm <- as_FBM(train_encode_dummy)
test_fbm <- as_FBM(test_encode_dummy)

slr <- big_spLogReg(train_fbm, train$HEARTDISEASE)

# xglr_test <- glm(y ~ ., data = a, family = "binomial")
# 
# pred_test_p <- predict(object = lr_train,newdata = test,type = "response")
# roc_test <- roc(test$HEARTDISEASE,pred_test_p,quiet = T)
# plot(roc_test, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
#      auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")

pred_slr_test <- predict(slr, test_fbm)
roc_test <- roc(test$HEARTDISEASE,pred_slr_test,quiet = T)
plot(roc_test, print.auc=TRUE, auc.polygon=TRUE,grid=c(0.1, 0.2),max.auc.polygon=TRUE,
     auc.polygon.col="skyblue", print.thres=TRUE,main = "ROC cerve")
