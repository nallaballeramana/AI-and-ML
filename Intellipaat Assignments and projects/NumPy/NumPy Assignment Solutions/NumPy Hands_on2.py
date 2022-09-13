#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np


# In[5]:


# Create np array of zeroes of size (2, 3) 
np.zeros((2,3))


# In[9]:


# Flatten 2D np Array to 1d np array.
arr=np.array([[1,2,3],[4,5,6]])
arr
arr.ravel()


# In[12]:


# Convert 1D np Array to 2d np array from a python list:
A1=np.array([1,2,3,4,5,6])
A1.reshape((2,3))


# In[13]:


#Create np array and sort
A2=np.array([1,3,2,5,4,6])
A2.sort()
A2


# In[14]:


#Slice an np array to create another array without the first two elements of the original array
A2[2:]


# In[ ]:




