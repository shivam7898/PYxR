# Credit Card Fraud {#credit-p12}



## Load: Credit Card Fraud

- Source: [Kaggle](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4 .1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8 .1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3 .1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
loc = 'data/Y_04_CCR'
loc_csv = loc + '.csv'
loc_bin = loc + '.feather'

if(not os.path.exists(loc_bin)):
    pp = pd.read_csv(loc_csv) 
    pp.drop(columns = ['Time'], inplace = True)   #Drop Columns
    qq = list(pp.columns)
    qq.insert(0, qq.pop(qq.index('Amount')))      #Relocate list element
    qq.insert(0, qq.pop(qq.index('Class')))
    pp = pp.reindex(columns = qq)                 #Relocate Columns
    pp['Class'] = pp.Class.astype('category')     #To Factor
    pyarrow.feather.write_feather(pp, loc_bin)    #Data: Credit Card Fraud
else:
    pp = pyarrow.feather.read_feather(loc_bin)

y_ccr = pp.copy()

pp.shape

## (284807, 30)
list(pp.columns)

## ['Class', 'Amount', 'V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8', 'V9', 'V10', 'V11', 'V12', 'V13', 'V14', 'V15', 'V16', 'V17', 'V18', 'V19', 'V20', 'V21', 'V22', 'V23', 'V24', 'V25', 'V26', 'V27', 'V28']
pp['Class'].value_counts()                        #Count Categories

## 0    284315
## 1       492
## Name: Class, dtype: int64
if(False): pp.info(memory_usage = False)
if(False): pp['Amount'].describe()
```

</div><br></div>






