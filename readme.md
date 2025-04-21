# Contents:
1. Describtion
2. Problem
3. Solution
    * 3.1. EDA + Feature Engineering
    * 3.2. Training Classifier
    * 3.3. Cost Clustering
4. Code
5. Results

# 1. Describtion
A task I've been working on during Schlumberger internship.

# 2. Problem
We had several measurements (MFL) of the pipe defects. Each measurement has 3 channels. Each measurement (defect) belongs to one of two defect location ( internal and external , or ID and OD). Also, each defect belongs to different sub-type (i.e, corrosion, dent, gouge, etc.). You should:
1. Perform EDA. Draw conclusions.
2. On the basis of provided data, train classifier that will predict defect location for unlabeled data. Scoring - F1. Goal is to get F1 >0.8
3. Perform unsupervised clustering. Identify optimal number of clusters. Draw most typical representative of each identified class. 

# 3. Solution
Solution is comprised of 3 parts: EDA + feature Engineering, Training classifier, Clustering. Describtion of every part is provided below.
## 3.1. EDA + feature Engineering
Data is represented as time series. Time series could be classified by a simple linear model. To do so, data should be characterized by descriptive features.
<p align="center">
  <img src="https://github.com/AKAD0/Pipes/blob/master/EDA.png">
</p>

$$
\text{Fig.1: Some samples from raw dataset}
$$

To solve the problem there should be generated new statistical, frequency and peak features for each channel to work with and to pass to a model.
Generated features are:
1. Statistical: mean, std_dev, min, max, range, skewness, kurtosis;
2. Fourier: mean, std_d, max, peak_freq;
3. Extremums: num_peaks, num_valleys, max_peak_height, max_peak_height, min_valley_depth, min_valley_depth.
<p align="center">
  <img src="https://github.com/AKAD0/Pipes/blob/master/table1.png">
</p>

$$
\text{Fig.2: A slice of new dataset}
$$

## 3.2. Training Classifier
The model of choice is LinearSVC since Logreg model isn't as capable to bend a hyperplane under such a number of features.\
<p align="center">
  <img src="https://github.com/AKAD0/Pipes/blob/master/model1.png">
</p>

$$
\text{Fig.2: Resulting model performance}
$$

Trained model was inferenced to predict unlabeled data:

<p align="center">
  <img src="https://github.com/AKAD0/Pipes/blob/master/table2.png">
</p>

$$
\text{Fig.2: A slice of predicted values}
$$


# 4. Clustering
To perform clustering I tested several clustering method with the Slihouette Score metric. The results are as followed:
1. KMeans -> 0.48564825262851474
2. DBSCAN -> 0.006025347067753193
3. Meanshift -> 0.44624935603412746
4. Spectral -> 0.43705262995384286
5. Gaussian -> 0.4781120330958871
6. Optics -> 0.4570925964553953
7. Agglo -> 0.512642011132095

Agglo proved to be the best according to 'silhouette_score'.\
The most typical samples of each cluster is illustrated below.
<p align="center">
  <img src="https://github.com/AKAD0/FNN_XOR/blob/master/clustering.png">
</p>

$$
\text{Fig.2: The most typical samples of each cluster}
$$

The listing of the program is provided in the '/Solution.ipynb' file.

# 5. Results
The following tasks have been performed:

1. EDA with associated Feature Engineering. New dataset was built.
2. Train of a LinearSVC. F1=0.94.
3. Clustering. 2 clusters were defined, 2 related typical samples were provided.
