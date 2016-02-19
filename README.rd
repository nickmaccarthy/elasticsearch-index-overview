# What?
A little script to list the index usage stats for an ES Cluster.  Mainly focused around understanding the usage per index pattern.  For example, alot of ELK users keep data in indexes per day, and this script will count the number of times it saw the index ( to see how many 'days' worth of logs you have ) and will sum up the total usage of that index.  

# How do it use it?
In the directory you extracted or cloned this to:
```virtualenv env && source env/bin/activate```
Now install the requirements
```pip install -r requirements.txt```
Now open the file ```es_index_stats.py``` and fill in the ```_CLUSTER_ADDRESS``` portion with the address of your ES cluster

# Output
```python
(env)user@host$ python es_index_stats.py


Cluster Status: green


+Cluster Sizing-----+-------------------+------------------------+
| Storage Size (GB) | Storage Used (GB) | Storage Available (GB) |
+-------------------+-------------------+------------------------+
| 401.09            | 154.76            | 225.50                 |
+-------------------+-------------------+------------------------+


+Index Usage Stats---------+-----------+----------------+-------------------+
| Index Name               | Size (GB) | Instance Count | Percentage Of Use |
+--------------------------+-----------+----------------+-------------------+
| systats-                 | 6.69      | 37             |  2                |
| rds-                     | 0.34      | 23             |  0                |
| resque-staging-          | 0.00      | 1              |  0                |
| .kibana-4                | 0.00      | 1              |  0                |
| cloudwatch-ec2-metrics-  | 0.69      | 16             |  0                |
| rds-cloudwatch-          | 1.63      | 24             |  0                |
| sup-int                  | 0.00      | 1              |  0                |
| nginx-access-            | 145.42    | 20             | 36                |
| bluenote-int             | 0.00      | 1              |  0                |
+--------------------------+-----------+----------------+-------------------+
```
In the above you will notice ```nginx-access-```, that is a daily index I keep and we currently have '20' days worth ( instance counts ) of indexes/logs taking up 36 % of our storage usage.

# Requirements
1. Python 2.7
2. Virtualenv
3. Pip
4. An Elasticsearch cluster

# Todo's
Indicate wether an index is timestamped or not and denote that in the table. 

