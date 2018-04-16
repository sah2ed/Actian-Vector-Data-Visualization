# 2.0. Visualization Tool
This chapter will explain how to install and configure our visualization tool.

## 2.1. Introduction
I originally tried to use [Apache Superset](https://github.com/apache/incubator-superset) but it turns out that Superset relies on SqlAlchemy which is an ORM library for managing different database dialects. Unfortunately, the different ODBC dialects that I tried assumed MS SQL Server as the underlying database, which of course meant it wouldn't work for Actian Vector.

### 2.1.1. Anaconda Installation
We will use the venerable Anaconda distribution to install all the dependencies we will need for this aspect of the article.

* Please download the installer by executing the following commands in a console:
```
su - uzer
cd /tmp
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
chmod +x Anaconda3-5.1.0-Linux-x86_64.sh
```

* Next, run the installer which will install python v3.6 as part of the installation.

`./Anaconda3-5.1.0-Linux-x86_64.sh`:
```
...
Do you accept the license terms? [yes|no]
[no] >>> yes

Anaconda3 will now be installed into this location:
/home/uzer/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/uzer/anaconda3] >>> 
```

* Now create a virtual environment and install additional python libraries needed for our exploration:
```
~/anaconda3/bin/conda create -y -n py3
source ~/anaconda3/bin/activate py3

## as py3 virtualenv
conda install -y jupyter pandas pyodbc matplotlib seaborn tqdm
## install from the "conda-forge" channel
conda install -c conda-forge turbodbc=2.0.0
```

### 2.1.2. Jupyter Notebook
* Please download the "03_Actian-Vector-Data-Visualization.ipynb" notebook file to the `uzer` account home folder: `/home/uzer`.

* Execute the following commands before starting up the Jupyter notebook:
```
su - uzer
## test that we can connect to the db via ODBC
source ~actian/.ingVWsh
export ODBCSYSINI=/opt/Actian/VectorVW/ingres/files
iiodbcadmin test ontimedb

## activate the virtual env
source ~/anaconda3/bin/activate py3
jupyter notebook .
```


