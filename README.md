# K-Nearest Neighbors Algorithm in R

*This project demonstrates how to implement the **K-Nearest Neighbors (KNN)** algorithm using the famous `iris` dataset in **R**. It includes data preprocessing, training, model evaluation, and hyperparameter tuning using the `caret` package.*

# Dataset

*Dataset: Built-in 'iris' dataset in R*

**Features**:

*-Sepal.Length*
*-Sepal.Width*
*-Petal.Length*
*-Petal.Width*

**Technologies Used**

*-Programming Language:* **R**
**Packages**
'class' - For KNN
'caret' - For Training and Evaluation
'caTools' - For Data Splitting
'e1071` – Required by Caret

**Workflow**

*Load and summarize the dataset*
*Split the data into training (%70) and test (%30) sets*
*Normalize the feature columns*
*Train a basic KNN model with 'k = 3'*
*Evaluate the model using:*
   *- Confusion matrix*
   *- Accuracy score*
*Tune K* using `caret::train()` for `k = 3 to 10`
*Visualize* model accuracy across different `k` values
*Make predictions* on the test data using the best `k`
*Final evaluation*

**Result**

The model achieved high accuracy with multiple values of 'k' (3, 4, 5, 7 and 9).
Confusion matrices were used to assess classification performance.
Accuracy was visualized across different 'k' values using plots.

**SAMPLE OUTPUT**
Prediction setosa versicolor virginica
setosa 20 0 0
versicolor 0 19 2
virginica 0 1 18

Overall Accuracy : 0.95









