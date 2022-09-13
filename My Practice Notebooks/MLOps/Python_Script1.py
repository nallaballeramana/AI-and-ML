#!/usr/bin/env python
# coding: utf-8

# In[1]:


from datetime import datetime, date, timedelta
import numpy as np
import pandas as pd
import os
import argparse  ## to accept arguments from pipeline


# In[2]:


from azureml.core import Workspace, Dataset,Datastore
print("Date of pipeline ML code run is: ",date.today())

from azureml.core import Run

run = Run.get_context()

print('Settingup AML Workspace')

ws = Workspace(subscription_id = '3739307c-4f3c-4bc6-b980-08d7dccd9bbd', resource_group = 'TestGroup', workspace_name = 'ML_Testing_space')

print(ws.name,ws.resource_group, ws.location, ws.subscription_id, sep = '\n')

blob_datastore_nmae = 'blobstoreramana' #name of datastore to workspace
container_name = os.getenv('BLOB_CONTAINER','datafortraining') #name of azure blob container
account_name = os.getenv('BLOB_ACCOUNTNAME','blobstoreramana') #storage account name
account_key = os.getenv('BLOB_ACCOUNT_KEY','Om7s/D51DZ4cjIBpAG+DX063BQfy+kVCdxMwqayoDUtN6ITI/RpTB5cB/iMRzfiNBvkhLEpWemEa+AStPYi67g==')


# In[3]:

### Parameterizing the input data
parser = argparse.ArgumentParse()
parser.add_argument('--input-data',type=str)

###Retrieving the created datastore by the name of reading

datastore = Datastore.get(ws, 'mlteststore')
print('Setting up blobster for reading input file')

from azureml.core import Run
run = Run.get_context()


# In[ ]:





# In[4]:


training_data = Dataset.Tabular.from_delimited_files(path = [(datastore,'train.csv')]).to_pandas_dataframe()

##to pass input dataset coming from pipeline
##training_data = Dataset.Tabular.from_delimited_files(path = [(datastore,args.input_data)]).to_pandas_dataframe()


# In[6]:


training_data.shape


# In[7]:


training_data.isnull().sum()


# In[ ]:

## code to write back to datastore
path = '/tmp/testfolder'

try:
    os.mkdir(path)
except OSError:
    print("Creation of directory %s failed: ", %path)
else:
    print('Successfully created directory %s ', %path)

local_path1 = path + 'testing_resulsts.csv'
test_results_view.to_csv(local_path1)

local_path2 = path + 'testing_resulsts1.csv'
test_results1_view.to_csv(local_path2)

datastore = Datastore.get(ws, 'mlteststore')
datastore.upload(src_dir='/tmp/testfolder',target_path="",overwrite=True)


