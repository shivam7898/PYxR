# Credit Card Fraud {#credit-p12}



## Load: Credit Card Fraud

- Source: [Kaggle](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)


<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_04_CCR'
loc_csv = loc + '.csv'
loc_bin = loc + '.feather'

if(not os.path.exists(loc_bin)):
    #Read | Relocate | Rename | Factor | Levels | ID | Save |
    pp = pd.read_csv(loc_csv) 
    if(False): pp.drop(columns = ['Time'], inplace = True)   #Drop Columns
    qq = list(pp.columns)
    qq.insert(0, qq.pop(qq.index('Amount')))      #Relocate list element
    qq.insert(0, qq.pop(qq.index('Class')))
    pp = pp.reindex(columns = qq)
    pp.columns.values[[np.arange(3, 3+9)]] = \
      ['V0' + str(i) for i in np.arange(1, 1+9)]  #Rename V1 to V01
    pp.rename(columns ={'Class': 'is_Found'}, inplace = True)
    pp['is_Found'] = pp['is_Found'].astype('category')
    pp['is_Found'] = pp['is_Found'].cat.rename_categories(['No', 'Yes'])
    pp.insert(0, 'ID', range(1, 1+len(pp)))
    pyarrow.feather.write_feather(pp, loc_bin)    #Data: Credit Card Fraud
else:
    pp = pyarrow.feather.read_feather(loc_bin)

y_ccr = pp.copy()

pp.shape
## (284807, 32)
qq = list(pp.columns)                             #Column Names
if(False): list(qq[0:5]) + list(qq[-3:len(qq)])
print('\n'.join([', '.join(qq[i:i+8]) for i in range(0,len(qq),8)]))

## ID, is_Found, Amount, Time, V01, V02, V03, V04
## V05, V06, V07, V08, V09, V10, V11, V12
## V13, V14, V15, V16, V17, V18, V19, V20
## V21, V22, V23, V24, V25, V26, V27, V28
qq = pp['is_Found'].value_counts().to_frame()
qq['PCT'] = 100 * qq['is_Found'] / qq['is_Found'].sum()          #Count & PCT
qq

##      is_Found        PCT
## No     284315  99.827251
## Yes       492   0.172749
if(False): pp.info(memory_usage = False)
if(False): pp['Amount'].describe()
if(False): pp['Time'].max()                       #(2 Days) 2*24*60*60 - 8
```

</div><br></div>

## Standardisation

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Standardize Time & Amount
pp = y_ccr.copy()

qq = sklearn.preprocessing.RobustScaler().fit(pp[['Time', 'Amount']])
pp[['Time', 'Amount']] = qq.transform(pp[['Time', 'Amount']])

y_ccr = pp.copy()
```

</div><br></div>

## Train & Test

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Separate response and features
pp = y_ccr.copy()

y_ccr_Y = pp[['ID', 'is_Found']]
y_ccr_X = pp[pp.columns.difference(['is_Found'])]    #ALL Excluding 1
qq = list(y_ccr_X.columns)
if(False): print('\n'.join([', '.join(qq[i:i+8]) for i in range(0,len(qq),8)]))
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Split Train and Test with similar proportion of Response
y_trn_x_id, y_tst_x_id, y_trn_y_id, y_tst_y_id = \
    sklearn.model_selection.train_test_split(y_ccr_X, y_ccr_Y, 
        test_size = 0.2, random_state = 3)

y_trn_y = y_trn_y_id['is_Found']
y_tst_y = y_tst_y_id['is_Found']
pp = [i for i in list(y_trn_x_id.columns) if i not in ['ID']]
y_trn_x = y_trn_x_id[pp]
y_tst_x = y_tst_x_id[pp]

if(True): y_trn_x.shape, y_tst_x.shape, y_trn_y.shape, y_tst_y.shape

## ((227845, 30), (56962, 30), (227845,), (56962,))
pp = y_trn_y.value_counts().to_frame()
pp['PCT'] = 100 * pp / pp.sum()
pp

##      is_Found        PCT
## No     227453  99.827953
## Yes       392   0.172047
qq = y_tst_y.value_counts().to_frame()
qq['PCT'] = 100 * qq / qq.sum()
qq
##      is_Found        PCT
## No      56862  99.824444
## Yes       100   0.175556
```

</div><br></div>

## Random Forest

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_04_RFC.sav'
if(not os.path.exists(loc)):
    # Fit
    y_rfc = sklearn.ensemble.RandomForestClassifier(n_estimators = 100, 
              criterion = 'gini', random_state = 3, n_jobs = -1, verbose = 0)
    y_rfc.fit(y_trn_x, y_trn_y) 
    joblib.dump(y_rfc, loc)
else:
    y_rfc = joblib.load(loc)


list(y_rfc.classes_)                              #Classes Labels 

## ['No', 'Yes']
y_rfc.n_features_in_                              #Count Features

## 30
y_rfc_xs = list(y_rfc.feature_names_in_)          #Features
print('\n'.join([', '.join(y_rfc_xs[i:i+8]) for i in range(0,len(y_rfc_xs),8)]))
## Amount, Time, V01, V02, V03, V04, V05, V06
## V07, V08, V09, V10, V11, V12, V13, V14
## V15, V16, V17, V18, V19, V20, V21, V22
## V23, V24, V25, V26, V27, V28
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
pp = [ round(i, 3) for i in y_rfc.feature_importances_ ]
#print('\n'.join([', '.join(map(str, pp[i:i+8])) for i in range(0,len(pp),8)]))
qq = pd.DataFrame(dict(Features = y_rfc_xs, Importance = pp))
qq.sort_values('Importance', ascending = False).head()
##    Features  Importance
## 18      V17       0.152
## 15      V14       0.150
## 13      V12       0.125
## 11      V10       0.094
## 17      V16       0.071
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Predict
y_rfc_pred = y_rfc.predict(y_tst_x)
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
print(round(y_rfc.score(y_trn_x, y_trn_y), 5))    #Train
## 1.0
print(round(y_rfc.score(y_tst_x, y_tst_y), 5))    #Test


# Confusion Matrix
## 0.99942
pd.crosstab(y_tst_y, y_rfc_pred, 
            rownames = ['Actual'], colnames = ['Predicted'], margins = True)
## Predicted     No  Yes    All
## Actual                      
## No         56855    7  56862
## Yes           26   74    100
## All        56881   81  56962
pp = sklearn.metrics.confusion_matrix(y_tst_y, y_rfc_pred, 
                      labels = list(y_rfc.classes_))

if(False): print(pp)
with np.printoptions(precision = 5, suppress = True):
    print(100 * pp/np.sum(pp))                    #Percent

## [[99.81216  0.01229]
##  [ 0.04564  0.12991]]
tn, fp, fn, tp = pp.ravel()
(tn, fp, fn, tp)

## (56855, 7, 26, 74)
pp = y_tst_y.values.astype('object')
pp.size
## 56962
y_unique, y_counts = np.unique(pp, return_counts = True)
print(np.asarray((y_unique, y_counts)).T)

## [['No' 56862]
##  ['Yes' 100]]
qq = y_rfc_pred
qq.size
## 56962
y_unique, y_counts = np.unique(qq, return_counts = True)
print(np.asarray((y_unique, y_counts)).T)

## [['No' 56881]
##  ['Yes' 81]]
print('Accuracy (Avoid): ', sklearn.metrics.accuracy_score(
       y_tst_y, y_rfc_pred)) 
## Accuracy (Avoid):  0.999420666409185
print('Precision: ', sklearn.metrics.precision_score(
       y_tst_y, y_rfc_pred, pos_label = 'Yes')) #tp/(tp+fp)
## Precision:  0.9135802469135802
print('Recall (Sensitivity) (More Important): ', sklearn.metrics.recall_score(
       y_tst_y, y_rfc_pred, pos_label = 'Yes')) #tp/(tp+fn)
## Recall (Sensitivity) (More Important):  0.74
print('F1 (Avoid): ', sklearn.metrics.f1_score(
       y_tst_y, y_rfc_pred, pos_label = 'Yes')) #2*tp/(2*tp+fn+fp)
## F1 (Avoid):  0.8176795580110497
```

</div><br></div>


## Confusion Matrix

- Precision makes sure we do not spot good transactions as fraudulent in our problem.
- Recall assures we do not predict fraudulent transactions as all good.

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
# Confusion Matrix 
#     Actual Positive       Negative
#  Predicted
#  Positive  TP             FP (I)          Precision = TP /(TP+FP)
#  Negative  FN (II)        TN              NPV = TN /(TN+FN)
#            Sensitivity    Specificity     Accuracy
#			       = TP /(TP+FN)  = TN /(TN+FP)   = (TP+TN) /N
```

</div><br></div>

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Confusion Matrix 
#  Predicted Negative       Positive
#     Actual
#  Negative  TN             FP (I)          Specificity = TN /(TN+FP)
#  Positive  FN (II)        TP              Sensitivity = TP /(TP+FN)
#            NPV            Precision       Accuracy
#			       = TN /(TN+FN)  = TP /(TP+FP)   = (TP+TN) /N
```

</div><br></div>

## Undersampling

- To be done only on the Training Data, not on the Test Data
- Near Miss refers to a group of undersampling strategies that pick samples based on the distance between majority and minority class instances.


<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
#def q_get_best_model(estimator, params, kf = kf, label = 'Yes', 
#      train_X = y_trn_x, train_Y = y_trn_y, test_X = y_tst_x, test_Y = y_tst_y, 
#      is_grid_search = True, sampling = NearMiss(), scoring='f1', n_jobs = -1):
#    if sampling is None:
#        # make the pipeline of only the estimator
#        pipeline = make_pipeline(estimator)
#    else:
#        # make the pipeline of over or undersampling and estimator
#        pipeline = make_pipeline(sampling, estimator)
#    # get the estimator name
#    estimator_name = estimator.__class__.__name__.lower()
#    # construct the parameters for grid/random search cv
#    new_params = {f'{estimator_name}__{key}': params[key] for key in params}
#    if is_grid_search:
#        # grid search instead of randomized search
#        search = sklearn.model_selection.GridSearchCV(pipeline, 
#            param_grid = new_params, cv = kf, 
#            return_train_score = True, n_jobs = n_jobs, verbose = 0)
#    else:
#        # randomized search
#        search = sklearn.model_selection.RandomizedSearchCV(pipeline, 
#            param_distributions = new_params, cv = kf, scoring = scoring, 
#            return_train_score = True, n_jobs = n_jobs, verbose = 0)
#    # fit the model
#    search.fit(train_X, train_Y)
#    cv_score = cross_val_score(search, train_X, train_Y, 
#                               scoring = scoring, cv = kf)
#    # make predictions on the test data
#    y_pred = search.best_estimator_.named_steps[estimator_name].predict(test_X)
#    # calculate the metrics: recall, accuracy, F1 score, etc.
#    recall = sklearn.metrics.recall_score(test_Y, y_pred, pos_label = label)
#    precision = sklearn.metrics.precision_score(test_Y, y_pred, pos_label = label)
#    
#    print('Hi') #xxxx
#    
#    accuracy = sklearn.metrics.accuracy_score(test_Y, y_pred)
#    f1 = sklearn.metrics.f1_score(test_Y, y_pred, pos_label = label)
#    y_proba = search.best_estimator_.named_steps[estimator_name].predict_proba(test_X)[::, 1]
#    fpr, tpr, _ = roc_curve(test_Y, y_proba)
#    auc = roc_auc_score(test_Y, y_proba)
#    # return the best estimator along with the metrics
#    return({
#        'best_estimator': search.best_estimator_,
#        'estimator_name': estimator_name,
#        'cv_score': cv_score,
#        'recall': recall,
#        'precision': precision,
#        'accuracy': accuracy,
#        'f1_score': f1,
#        'fpr': fpr,
#        'tpr': tpr,
#        'auc': auc,
#    })
#
```

</div><br></div>


## Model

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
if(False):
    # Cross Validation Framework 
    from sklearn.model_selection import StratifiedKFold
    from sklearn.model_selection import GridSearchCV, cross_val_score, RandomizedSearchCV
    #kf = StratifiedKFold(n_splits = 5, random_state = None, shuffle = False)
    # Imbalance
    from imblearn.pipeline import make_pipeline
    from imblearn.under_sampling import NearMiss
    from imblearn.over_sampling import SMOTE
    # Metrics
    from sklearn.metrics import roc_curve, roc_auc_score
    # Classifiers
    from sklearn.linear_model import LogisticRegression
    from sklearn.svm import SVC
    from sklearn.neighbors import KNeighborsClassifier
    from sklearn.tree import DecisionTreeClassifier
```

</div><br></div>


## Tuning

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
# Number of trees in random forest
#n_estimators = np.linspace(100, 3000, int((3000-100)/200) + 1, dtype=int)
n_estimators = np.array([100])
# Number of features to consider at every split
max_features = ['sqrt'] #['auto', 'sqrt']
# Maximum number of levels in tree
max_depth = [1, 2, 3]
# Minimum number of samples required to split a node
# min_samples_split = [int(x) for x in np.linspace(start = 2, stop = 10, num = 9)]
min_samples_split = [2, 3]
# Minimum number of samples required at each leaf node
min_samples_leaf = [1, 2]
# Method of selecting samples for training each tree
bootstrap = [True] #[True, False]
# Criterion
criterion = ['gini'] #['gini', 'entropy']
random_grid = {'n_estimators': n_estimators,
#                'max_features': max_features,
               'max_depth': max_depth,
               'min_samples_split': min_samples_split,
               'min_samples_leaf': min_samples_leaf,
               'bootstrap': bootstrap,
               'criterion': criterion}
```

</div><br></div>

## Small Test Case

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
y_rfc_base = sklearn.ensemble.RandomForestClassifier() 
if(False):
    y_rfc_cv_pre = sklearn.model_selection.RandomizedSearchCV(
                estimator = y_rfc_base, param_distributions = random_grid,
                n_iter = 3, cv = 2, verbose = 0, random_state = 3, n_jobs = -1)
    y_rfc_cv_pre.fit(y_trn_x, y_trn_y) 
    print(y_rfc_cv_pre.best_params_)
```

</div><br></div>



<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#4C78DB'><svg aria-hidden="true" role="img" viewBox="0 0 581 512" style="height:1em;width:1.13em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#4C78DB;overflow:visible;position:relative;"><path d="M581 226.6C581 119.1 450.9 32 290.5 32S0 119.1 0 226.6C0 322.4 103.3 402 239.4 418.1V480h99.1v-61.5c24.3-2.7 47.6-7.4 69.4-13.9L448 480h112l-67.4-113.7c54.5-35.4 88.4-84.9 88.4-139.7zm-466.8 14.5c0-73.5 98.9-133 220.8-133s211.9 40.7 211.9 133c0 50.1-26.5 85-70.3 106.4-2.4-1.6-4.7-2.9-6.4-3.7-10.2-5.2-27.8-10.5-27.8-10.5s86.6-6.4 86.6-92.7-90.6-87.9-90.6-87.9h-199V361c-74.1-21.5-125.2-67.1-125.2-119.9zm225.1 38.3v-55.6c57.8 0 87.8-6.8 87.8 27.3 0 36.5-38.2 28.3-87.8 28.3zm-.9 72.5H365c10.8 0 18.9 11.7 24 19.2-16.1 1.9-33 2.8-50.6 2.9v-22.1z"/></svg><b> R</b></span>

```r
if(TRUE) py_config()         #Python Configuration
## python:         C:/Softwares/Python/Python310/python.exe
## libpython:      C:/Softwares/Python/Python310/python310.dll
## pythonhome:     C:/Softwares/Python/Python310
## version:        3.10.5 (tags/v3.10.5:f377153, Jun  6 2022, 16:14:13) [MSC v.1929 64 bit (AMD64)]
## Architecture:   64bit
## numpy:          C:/Softwares/Python/Python310/Lib/site-packages/numpy
## numpy_version:  1.23.1
## 
## NOTE: Python version was forced by use_python function
if(FALSE) q_url[ , 'URL']     #List of URL of this Page
if(FALSE) q_()                #R Objects of this Page excluding 'q_*'
```

</div><br></div>
