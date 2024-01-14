# Dates {#dates-p21}



## Basics

- Test Function to identify various null values in columns having dates in different formats and to get minimum and maximum dates out of those

<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
def datecols(dfs=None, inc=None, exc=None, date_strings=None, na_dates=None, justified=20, max_print=3,
                skip_warn=False):
    import traceback #To get Line Numbers of Errors from Imported or Read Function Code
    try:
        import numpy as np, pandas as pd
        from IPython.display import display
        #
        if dfs is None:
            #Default Test Case
            tst = pd.DataFrame() #NULL DataFrame
            #YYYY-MM-DD Dates as Strings: OK, NOT 29, OK, NOT 30, OK Month, OK 99 Split, OK 2000
            tst['org']=['2023-02-28', '2023-02-29', '2024-02-29', '2024-02-30', '2024-03-01', 
                        '1999-11-30', '2000-02-01', 
                        '1900-01-01', '0', 'NULL', None]
            tst['aok']=['2024-01-15'] * tst.shape[0]
            #Case-Insensitive Replacement of various kinds of NULLS by 'np.nan'
            #Source is 'na_values' argument of pd.read_excel()
            na_values =[' ', '#N/A', '#N/A N/A', '#NA', '-1.#IND', '-1.#QNAN', '-NaN', '-nan', 
                        '1.#IND', '1.#QNAN', '<NA>', 'N/A', 'NA', 'NULL', 'NaN', 'None', 'n/a', 
                        'nan', 'np.nan', '0', '0.0', '0.00', '']
            tmp = dict.fromkeys(['(?i)^{}$'.format(x) for x in na_values], np.nan)
            tst['ymd'] = tst['org'].astype(str).replace(
                            to_replace=tmp.keys(), value=tmp.values(), regex=True)
            #
            tst['tms'] = pd.to_datetime(tst['ymd'], format='ISO8601', errors='coerce') #TimeStamp
            tst['dat'] = tst['tms'].dt.date                                            #Date
            #
            #Get N characters
            dd = tst['ymd'].str[-2:] #Last 2
            mm = tst['ymd'].str[5:7] #Middle
            yy = tst['ymd'].str[:4]  #First 4
            tst['mdy'] = mm + '/' + dd + '/' + yy
            tst['flt'] = (yy.str[-2:] + mm + dd).astype(float) #Float with NULLS
            tst['num'] = tst['flt'].fillna(0).astype(int)      #Integers of less than 6 length
            #
            letters = 'abcdefghijklmnopqrstuvwxyz'
            tst['abc'] = list(letters[ : tst.shape[0]])  #Character Column
            tst['drp'] = list(letters[-tst.shape[0] : ]) #Exclude Column
            tst['nul'] = [None]*tst.shape[0]             #ALL NULLS
            tst['bol'] = [True]*tst.shape[0]             #Boolean
            #
            #Dictionary of DF of Dictionary of Column Formats
            dft = {'tst': {'ymd': '%Y-%m-%d', 'mdy':'%m/%d/%Y'}} 
            if False:
                datecols(dfs = dict({'tst':tst}), inc=['abc'], exc=['drp'])
                cpy = tst.copy().drop(columns=['abc'])
                datecols(dfs = dict({'tst':tst, 'cpy':cpy}), inc=['flt', 'abc'], exc=['drp'])
                if False: datecols(dfs = tst, exc=['drp']) #ERROR OK TST ONLY
                datecols(dfs = [tst], exc=['drp']) #ERROR CAUGHT
                datecols(dfs = dict({'tst':tst}), exc=['drp'], max_print=9)
                datecols(dfs = dict({'tst':tst}), exc=['drp']) #OK without supplying NULLS
                datecols(dfs = dict({'tst':tst}), exc=['drp'], na_dates='') #OK ERROR CAUGHT
                tst['tms_x'] = tst['tms'].copy()
                datecols(dfs = dict({'tst':tst}), exc=['tms_x'], skip_warn=True) #OK
                datecols(dfs = dict({'tst':tst}), exc=['tms_x']) #OK
                datecols(dfs = dict({'tst':tst}), na_dates=['1900-01-01']) #OK
                datecols(dfs = dict({'tst':tst}), date_strings=dft, na_dates=['1900-01-01']) #OK
            #
            datecols(dfs = dict({'tst':tst}), exc=['aok','abc','drp','nul','bol'], date_strings=dft, 
                        na_dates=['1900-01-01'], skip_warn=True)
            return None #Required to Stop Debug
        #
        if type(dfs) is not pd.core.frame.DataFrame and type(dfs) is not dict:
            raise TypeError(f"type('dfs') (DF or dict(DF)) != {type(dfs)}")
        elif type(dfs) is pd.core.frame.DataFrame:
            nm = [x for x in globals() if globals()[x] is dfs][0]
            dfs = dict({nm: dfs})
            date_strings = dict({nm: date_strings})
        #
        if na_dates is not None and type(na_dates) is not list and type(na_dates) is not str:
            raise TypeError(f"type('na_dates') (date string or list) != {type(na_dates)}")
        elif type(na_dates) is str:
            na_dates = [na_dates]
        #
        #Convert User supplied Null Dates from List of String Dates to List of DATETIME
        if na_dates is not None: 
            na_dates = pd.to_datetime(na_dates)
            if na_dates.isna().any(): raise ValueError(f"Invalid 'na_dates': {na_dates}")
        #
        warn_miss= dict()
        warn_101 = dict()
        #
        for key, df in dfs.items():
            #Subset Columns: (All ∩ Included) - Excluded | Deep Copy | Reset Index
            cols = df.columns.to_list()
            if inc is not None: cols = [i for i in cols if i in inc]
            if exc is not None: cols = [i for i in cols if i not in exc]
            #Get a list of DateTime Columns that will not be considered
            l_dtm = df.select_dtypes(include=['datetime64']).columns.to_list()
            tmp = list(set(l_dtm).difference(cols))
            if tmp != list(): warn_miss[key] = tmp
            #
            df = df[cols].copy(deep=True).reset_index(drop=True)
            #Show DF
            if False:
                with pd.option_context( 'display.max_rows', None, 'display.max_columns', None, 
                                    'display.width', None): display(df.head(20))
            #
            l_rows = [] #Empty List to be appended with a dictionary in each iteration
            njust = len(max(cols + [key], key=len)) #Get Maximum Length from a List of Strings
            for idx, c in enumerate(cols):
                org = df[c]
                mod = org.copy()
                #Convert Numerics to Strings
                if mod.dtype.kind in 'f': mod = pd.Series(np.where(mod.isnull(), None, 
                                                mod.apply('{:.0f}'.format))) #floats
                if mod.dtype.kind in 'i': mod = mod.astype(str)              #integers
                #
                if mod.dtype.kind in 'O':
                    #Cast as String to Convert 'datetime.date' to Strings
                    tmp = mod[mod.notna()].astype(str)
                    if len(tmp) != 0:
                        lmax = len(max(tmp, key=len))
                        lmin = len(min(tmp, key=len))
                        if lmax == 6 and lmax != lmin: mod = mod.str.zfill(lmax) #zero-padding
                    #
                    if (mod=='000101').any():
                        if key not in warn_101.keys(): warn_101[key] = list()
                        warn_101[key] = warn_101[key] + [c]
                    #
                    #YY between 00 and 30 to be taken as 21st Century [2000, 2099]
                    if lmax==6: mod = pd.Series(np.where(
                                        mod.str[:2].astype(float) <= 30, '20'+mod, '19'+mod))
                #
                #If available, Get User-Supplied String Format
                u_dt_str = None
                is_dt_str= (date_strings is not None and key in date_strings.keys() 
                            and date_strings[key] is not None and c in date_strings[key].keys())
                if is_dt_str: u_dt_str = date_strings[key][c]
                #If User Supplies wrong-format for DF-Column combination, 
                #...it would result in lots of Nulls
                #
                mod = pd.to_datetime(mod, errors='coerce', format=u_dt_str) #Get DateTime
                #
                #If Value is NOT in User NULLS, Then Keep the Value, Else NULL
                if na_dates is not None: mod = mod.where(~mod.isin(na_dates), pd.NaT)
                #
                tmp = pd.DataFrame({'original': org, 'modified': mod})
                #display(tmp)
                #
                sum_na  = tmp['modified'].isna().sum()  #Select Column by Name and Count Nulls
                sum_na_o= tmp.iloc[ :, 0].isna().sum()  #Select Column by Position
                #
                #'Minimum'.center(justified)
                one_row = {'Columns': c,  'Minimum': '', 'Maximum':'', 'Nulls': '', 
                            'pct':'', 'orig':'', 'uniq':'', 'samples':''}
                #
                no_nulls= tmp.query("modified.notna()")
                uniq_nul= tmp.query("original.notna() and modified.isna()"
                                    )['original'].unique().tolist()
                #Find Min/Max Value in Modified Column | Get corresponding Original |
                #Pull First Row Value using Position | To String | Left Justified by N
                if no_nulls.shape[0] != 0:
                    one_row['Minimum'] = str(no_nulls.query("modified == modified.min()"
                                            )['original'].iloc[0]).ljust(justified)
                    one_row['Maximum'] = str(no_nulls.query("modified == modified.max()"
                                            )['original'].iloc[0]).ljust(justified)
                #
                if sum_na != 0:
                    #Percentage Cleanup
                    pct = 100 * sum_na/df.shape[0]
                    if pct == 100:
                        pct = '100%'
                    elif pct > 99:
                        pct = '>99%'
                    elif pct < 1:
                        pct = ' <1%'
                    else:
                        pct = (str(round(pct)) + '%').rjust(4)
                    #
                    one_row['Nulls'] = sum_na
                    one_row['pct']   = pct
                    if sum_na != sum_na_o: one_row['orig']= sum_na_o
                    one_row['uniq']   = len(uniq_nul)
                    one_row['samples']= uniq_nul[ :max_print]
                #
                l_rows.append(one_row)
            #
            out = pd.DataFrame(l_rows) #List of Dictionary to DataFrame
            out.rename(columns = {'Columns': key}, inplace=True)
            #
            #Print ALL Columns and ALL Rows of the DataFrame
            with pd.option_context( 'display.max_rows', None, 'display.max_columns', None, 
                                    'display.width', None):
                display(out)
            #
            print()
        #
        if not skip_warn: 
            if warn_miss != dict(): print(f"Warning: Missed DateTime Columns: {warn_miss}")
            if warn_101  != dict(): print(f"Warning: '101' == 2000-01-01 != 1900-01-01: {warn_101}")
            print()
        #
        return None
    except:
        print(traceback.format_exc())
        raise #To Stop Code Execution after Errors
    #
#
```

</div><br></div>





<div class=decocode><div style='background-color:inherit'><span style='font-size:100%;color:#FFD94C'><svg aria-hidden="true" role="img" viewBox="0 0 448 512" style="height:1em;width:0.88em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:#FFD94C;overflow:visible;position:relative;"><path d="M439.8 200.5c-7.7-30.9-22.3-54.2-53.4-54.2h-40.1v47.4c0 36.8-31.2 67.8-66.8 67.8H172.7c-29.2 0-53.4 25-53.4 54.3v101.8c0 29 25.2 46 53.4 54.3 33.8 9.9 66.3 11.7 106.8 0 26.9-7.8 53.4-23.5 53.4-54.3v-40.7H226.2v-13.6h160.2c31.1 0 42.6-21.7 53.4-54.2 11.2-33.5 10.7-65.7 0-108.6zM286.2 404c11.1 0 20.1 9.1 20.1 20.3 0 11.3-9 20.4-20.1 20.4-11 0-20.1-9.2-20.1-20.4.1-11.3 9.1-20.3 20.1-20.3zM167.8 248.1h106.8c29.7 0 53.4-24.5 53.4-54.3V91.9c0-29-24.4-50.7-53.4-55.6-35.8-5.9-74.7-5.6-106.8.1-45.2 8-53.4 24.7-53.4 55.6v40.7h106.9v13.6h-147c-31.1 0-58.3 18.7-66.8 54.2-9.8 40.7-10.2 66.1 0 108.6 7.6 31.6 25.7 54.2 56.8 54.2H101v-48.8c0-35.3 30.5-66.4 66.8-66.4zm-6.7-142.6c-11.1 0-20.1-9.1-20.1-20.3.1-11.3 9-20.4 20.1-20.4 11 0 20.1 9.2 20.1 20.4s-9 20.3-20.1 20.3z"/></svg><b> Python</b></span>

```python
datecols()
##    tst               Minimum               Maximum  Nulls   pct  orig  uniq  \
## 0  org  1999-11-30            2024-03-01                6   55%     1     5   
## 1  ymd  1999-11-30            2024-03-01                6   55%     3     3   
## 2  tms  1999-11-30 00:00:00   2024-03-01 00:00:00       6   55%     5     1   
## 3  dat  1999-11-30            2024-03-01                6   55%     5     1   
## 4  mdy  11/30/1999            03/01/2024                6   55%     3     3   
## 5  flt  991130.0              240301.0                  5   45%     3     2   
## 6  num  991130                240301                    5   45%     0     3   
## 
##                                 samples  
## 0  [2023-02-29, 2024-02-30, 1900-01-01]  
## 1  [2023-02-29, 2024-02-30, 1900-01-01]  
## 2                 [1900-01-01 00:00:00]  
## 3                          [1900-01-01]  
## 4  [02/29/2023, 02/30/2024, 01/01/1900]  
## 5                  [230229.0, 240230.0]  
## 6                   [230229, 240230, 0]
```

</div><br></div>

