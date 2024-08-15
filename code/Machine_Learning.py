from numpy import arange
from pandas import read_csv
from sklearn.model_selection import RepeatedKFold
import pandas as pd
import numpy as np
import sklearn
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report
from sklearn.svm import SVC
from sklearn.metrics import average_precision_score
from sklearn.metrics import precision_score
from sklearn.metrics import recall_score
from sklearn.metrics import roc_auc_score
from sklearn.metrics import f1_score
from sklearn.metrics import accuracy_score

import pandas as pd
import numpy as np
from sklearn.svm import SVC
from sklearn.metrics import roc_auc_score

###### Loading datasets ########

# Load train dataset
train_url = '/Users/piyushagrawal/Desktop/ml_work/train.csv'
dataframe_train = pd.read_csv(train_url, header=None)
data_train = dataframe_train.values
X_train, y_train = data_train[:, :-1], data_train[:, -1]

# Load test dataset
test_url = '/Users/piyushagrawal/Desktop/ml_work/test.csv'
dataframe_test = pd.read_csv(test_url, header=None)
data_test = dataframe_test.values
X_test, y_test = data_test[:, :-1], data_test[:, -1]

####### Support Vector Classifier ####

clf = SVC(kernel='rbf', C=1, gamma=0.0001, probability=True)
clf.fit(X_train, y_train)
np.random.seed(786)

# Make probability predictions
y_pred_proba = clf.predict_proba(X_test)

# Evaluate and print ROC AUC score
roc_auc = roc_auc_score(y_test, y_pred_proba[:, 1])
print("ROC AUC on test data: {0:0.2f}".format(roc_auc))

# Print actual values and predicted probabilities
print("Actual values:", y_test)
print("Predicted probabilities:", y_pred_proba[:, 1])

# Create DataFrame with actual and predicted values
results_df = pd.DataFrame({
    'Actual': y_test,
    'Predicted_Probabilities': y_pred_proba[:, 1]
})

Round predicted probabilities to 4 decimal places
results_df['Predicted_Probabilities'] = results_df['Predicted_Probabilities'].round(3)

Save DataFrame to TSV
results_df.to_csv("SVM_indep_result", sep='\t', index=False)
