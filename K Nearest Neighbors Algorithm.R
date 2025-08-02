# add the packages
library(e1071)
library(caTools)
library(class)
library(caret)
library(scales)

data(iris)
head(iris)
#SUM OF THE DATA
summary(iris)
#SEPERATE THE DATA AS TEST AND EDUCATION DATA
set.seed(123)
split <- sample.split(iris, SplitRatio = 0.7)
train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")
#NORMALIAZING THE TEST DATA AND EDUCATION DATA
train_scale <- scale(train[, 1:4])
test_scale <- scale(test[, 1:4])
#SET THE KNN MODEL
#SET THE MODEL FOR K=3
model_knn.3 <- knn(train = train_scale,
                   test = test_scale,
                   cl = train$Species,
                   k = 3)
model_knn.3
#CREATE THE ESTIMATION TABLE
performans.3 <- table(test$Species, model_knn.3)
performans.3
#EVOLUATING OF MODEL
#CALCULATING THE ACCURACY OF THE MODEL
misClassError.3 <- mean(model_knn.3 != test$Species)
print(paste("Accuracy =", 1-misClassError.3))
#SETTING THE CONFUSION MATRIX TABLE
cm_knn <- caret::confusionMatrix(model_knn.3, test$Species, positive = "pos")
cm_knn
#sETTING UP DIFFRENT MODEL FOR K VARIABLES BETWEEN 3 AND 10
#WHICH K VARIABLE MAKES THE BEST ESTIMATE
model_knn<- caret::train(Species ~., data = train,
                           method = "knn",
                           metric = "Accuracy",
                           tuneGrid = expand.grid(.k = c(3:10)),
                           trControl = trainControl(method = "cv", number = 10, classProbs =  T),
                           preProcess = c("center","scale","pca"))
model_knn
#APPEAR THE RESULTS OF DATA
model_knn$results
#K=3 4 5 7 AND 9 GIVED SAME RESULTS
#MODELS RESULTS FOR K=3
model_knn$results[1, ]
#DRAW THE GRAPHICS OF ACCURATION
plot(model_knn,
     type="b",
     xlab="value of k",
     ylab="accuration")
#EVALUATION OF THE PERFORMANCE AND TESTING THE MODEL
#ESTIMATING OF THE EXAMPLES CLASS IN DATA BASE
pred_knn <- predict(model_knn, test)
pred_knn
#CREATE CONFUSION MATRIX
cm_knn <- confusionMatrix(pred_knn, test$Species, positive = "pos")
cm_knn


