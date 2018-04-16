# 1.0. Introduction
Actian Vector 5.0.0 requires at least 1953MB of physical memory. This article will walk-through local installation of the [community edition of Actian Vector 5.0](https://www.actian.com/lp/vector-community-edition/) on a Linux VM with 8GB of RAM and a 160GB SSD running 64-bit Ubuntu 16.04.4 LTS. 

Afterwards, we will download and import the dataset from the United States Department of Transportation's Bureau of Transportation Statistics from http://esd.actian.com/.

## 1.1. Actian Vector - Installation
This section will provide step-by-step instructions on installing Actian Vector on Ubuntu Linux. My machine's specifications are mentioned in the preceeding section.

### 1.1.1. Prerequisites
We will need to install `libaio` which is an asynchronous I/O library dependency required to enable high throughput I/O for Actian Vector.
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo apt install libaio1`

Also create two temporary folders which we will use for data and sql files for the dataset load later on.
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# mkdir -p /tmp/data && mkdir -p /tmp/sql`

### 1.1.2. Download
Change to the `/tmp` folder then download and extract the latest version of the community edition which is currently at `5.0.0-412`:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# cd /tmp`
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# curl -L -O http://esdcdn.actian.com/Vector/5.0/Community/a64.lnx/actian-vector-5.0.0-412-community-linux-x86_64.tgz`
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# tar xvf actian-vector-5.0.0-412-community-linux-x86_64.tgz`

### 1.1.3. Install
From the `/tmp` folder, run the installation script, follow the on-screen instructions and accept the suggested defaults:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# cd /tmp/actian-vector-5.0.0-412-community-linux-x86_64`
- `root@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/actian-vector-5.0.0-412-community-linux-x86_64# sudo ./install.sh`:
```
Actian Vector 5.0.0 Installer

System user "actian" must be created before the installation can proceed

Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Actian Vector 5.0.0 Community Edition

will be installed with the following configuration:

II_SYSTEM: /opt/Actian/VectorVW
II_INSTALLATION: VW
Instance Owner: actian

Do you wish to continue? (y/n) [y]: y
A Java Runtime Environment (JRE) is installed as part of

    Actian Vector 5.0.0

To accept the license agreement and continue with
the installation answer 'y'.

To reject the license agreement and abort the
installation answer 'n'.

Do you accept the Java license agreement? (y/n) [n] y

Creating /opt/Actian/VectorVW...
Beginning installation...
ACTIAN CORPORATION

THIS CLICK-THROUGH LICENSE AGREEMENT (THE
"AGREEMENT"), IS ENTERED INTO BY AND BETWEEN ACTIAN
...
...


Do you accept this license agreement? (y or n): y

Products selected:  4     Disk space required:    0
 Support modules : 25                           618M
                   --     Temporary storage  :   96M
                                                ----
            Total: 29                           714M

Reading from distribution medium... (This may take a few minutes)
Verifying product: Actian Vector DBMS...
Verifying product: Actian Vector Networking...
Verifying product: Actian Vector Data Access Server...
Verifying product: Actian Vector C2 Security Auditing...
Verifying support module: basic...
Verifying support module: config...
Verifying support module: dbatools...
Verifying support module: Embedded SQL for Ada...
Verifying support module: Embedded SQL for C...
Verifying support module: Embedded SQL for COBOL...
Verifying support module: Embedded SQL for FORTRAN...
Verifying support module: Embedded SQL for C++...
Verifying support module: esqlsup...
Verifying support module: formtool...
Verifying product: Actian Vector ODBC Driver...
Verifying support module: generr...
Verifying support module: mgmtsvc...
Verifying support module: montools...
Verifying product: Query and Reporting Runtime...
Verifying support module: rmcmd...
Verifying support module: setupsup...
Verifying product: Terminal Monitors...
Verifying support module: xercesclib...
Moving files for product: Actian Vector DBMS...
Moving files for product: Actian Vector Networking...
Moving files for product: Actian Vector Data Access Server...
Moving files for product: Actian Vector C2 Security Auditing...
Moving files for support module: basic...
Moving files for support module: config...
Moving files for support module: dbatools...
Moving files for support module: Embedded SQL for Ada...
Moving files for support module: Embedded SQL for C...
Moving files for support module: Embedded SQL for COBOL...
Moving files for support module: Embedded SQL for FORTRAN...
Moving files for support module: Embedded SQL for C++...
Moving files for support module: esqlsup...
Moving files for support module: formtool...
Moving files for product: Actian Vector ODBC Driver...
Moving files for support module: generr...
Moving files for support module: mgmtsvc...
Moving files for support module: montools...
Moving files for product: Query and Reporting Runtime...
Moving files for support module: rmcmd...
Moving files for support module: setupsup...
Moving files for product: Terminal Monitors...
Moving files for support module: xercesclib...
Writing installation descriptor file...
Setting up product: Actian Vector DBMS...
Setting up product: Actian Vector Networking...
Setting up product: Terminal Monitors...
Setting up product: Actian Vector Data Access Server...
Setting up product: Actian Vector ODBC Driver...
Setting up support module: mgmtsvc...
Setting up support module: esqlsup...
Setting up product: Actian Vector C2 Security Auditing...
All installed products are now available for use.
Writing installation descriptor file...
Installing Demos...
/usr/bin/env: 'python': No such file or directory

Vector/ingstart

Checking host "ubuntu-s-4vcpu-8gb-lon1-01" for system resources required to run
Vector...

Your system has sufficient resources to run
Vector.


Starting your Vector installation...

Starting the Name Server...

Allocating shared memory for Logging and Locking Systems...

Starting the Recovery Server...
II_DBMS_SERVER = 45907

Starting the Archiver Process...

Starting DBMS Server (default)...
II_DBMS_SERVER = 42411

Starting Net Server (default)...
GCC Server = 38664
    TCP_IP port = VW (27832)

Starting Data Access Server (default)...
DAS Server = 40651
    TCP_IP port = VW7 (27839)



Starting Remote Manager Server...

Vector installation successfully started.
Installing Director...

update-alternatives: using /opt/Actian/Director/director to provide /usr/bin/director (director) in auto mode
Director successfully installed under:

    /opt/Actian/Director

DBMS authentication has been enabled for this instance of:

    Actian Vector

To allow remote access to as user:

    'actian'

a DBMS password must be set.


Please enter a password (not displayed):
Please re-enter the password:

DBMS password has been set successfully.
Actian Vector 5.0.0

has been successfully installed.

Please refer to the Getting Started section in the Readme file for
the next steps.
```

#### 1.1.3.1. DBA Account
Among the first few answers the installer asks for is the unix password to a new unix account named `"actian"` which will be used to manage the database server, so be sure to remember the password you chose during that step. The `actian` unix account will serve as our DBA user.

#### 1.1.3.2. Install Path
If all the defaults are accepted, the installer will install a new Actian Vector instance named `VW` at `/opt/Actian/VectorVW`. 

### 1.1.4. Database Server - service start-up (1 of 2)
The installation of Actian Vector includes a script named `mkrc` under the `actian` unix account, which generates an rc-style script under `$II_SYSTEM/ingres/files/rcfiles`. rc-style scripts allow us to run the Actian Vector server as a unix service.

Run the `mkrc` script to create a startup script; copy the `actian-vectorVW` script created under `$II_SYSTEM/ingres/files/rcfiles` to `/etc/init.d/`; then enable and start `actian-vectorVW` server:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo -u actian bash -c 'source ~actian/.ingVWsh && mkrc'`
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo cp -v /opt/Actian/VectorVW/ingres/files/rcfiles/actian-vectorVW /etc/init.d/`:
```
'/opt/Actian/VectorVW/ingres/files/rcfiles/actian-vectorVW' -> '/etc/init.d/actian-vectorVW'
```

- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo systemctl enable actian-vectorVW`:
```
actian-vectorVW.service is not a native service, redirecting to systemd-sysv-install
Executing /lib/systemd/systemd-sysv-install enable actian-vectorVW
```

- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo systemctl start actian-vectorVW`

### 1.1.5. Non-DBA Account Set-up (1 of 3)
We will need a separate non-DBA account for connecting to the database that we will create later on. The database will be used to hold the 6GB dataset, which when uncompressed is ~130GB, from the United States Department of Transportation's Bureau of Transportation Statistics. Our non-DBA account will be used to connect locally to the database from our data visualization tool.

The non-DBA account will use the following credentials: `uzer:password`.
Similar to the `actian` unix account, `uzer` is also a unix account which is why we use the `useradd` tool.
Note that the `mkpasswd` is an utility from the `whois` package to help us generate a crypt(3)-compatible password which is the format used by `/etc/passwd` for unix accounts.

- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo apt install whois`
- ``root@ubuntu-s-4vcpu-8gb-lon1-01:~# crypt3passwd=`mkpasswd -m sha-512 -S requiresASalt -s <<< password` ``
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# sudo useradd -m -p $crypt3passwd -s /bin/bash uzer`

After we have created the database in the next step, we will then grant the `uzer` unix account database access. Any attempts to grant a non-existent unix account database access will fail with the following error -- `E_US1895 User '<user>' does not exist.`

### 1.1.6. Database Server - online status (2 of 2)
This is a sanity check to verify that the database server is online. First we will login as the DBA using the `actian` unix account; then run `iidbdb`:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# su -l actian`
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ source ~/.ingVWsh`
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ echo 'select 1\g' | sql iidbdb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 02:55:01 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .


┌──────┐
│col1  │
├──────┤
│     1│
└──────┘
(1 row)
continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 02:55:01 2018
```
### 1.1.7. Database Set-up
Still as the `actian` unix account, we will create a new database `ontimedb`, expose it via ODBC, then test the connection:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ createdb ontimedb`:
```
Creating database 'ontimedb' . . .

  Creating DBMS System Catalogs . . .
  Modifying DBMS System Catalogs . . .
  Creating Standard Catalog Interface . . .
  Creating Front-end System Catalogs . . .

Creation of database 'ontimedb' completed successfully.
```
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ iiodbcadmin add ontimedb`:
```
iiodbcadmin: Added ODBC DSN 'ontimedb'.
```
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ iiodbcadmin test ontimedb`:
```
iiodbcadmin: Connection was successful.
```

### 1.1.8. Non-DBA Account Set-up (2 of 3)
The next step for the non-DBA `uzer` account is granting it access to the newly created `ontimedb` database.
Still as the `actian` unix account:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ echo 'CREATE USER uzer WITH NOPROFILE, NOGROUP, NOEXPIRE_DATE, NOSECURITY_AUDIT \g' | sql iidbdb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 03:01:32 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .

continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 03:01:32 2018
```
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ echo 'GRANT ALL PRIVILEGES ON DATABASE ontimedb TO uzer \g' | sql iidbdb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 03:44:18 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .

continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 03:44:18 2018
```
Finally, grant the `uzer` account remote database access by setting a DBMS password.
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ echo "ALTER USER uzer WITH PASSWORD = 'password'\g" | sql iidbdb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 03:45:18 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .

continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 03:45:18 2018
```

### 1.1.9. Non-DBA Account Set-up (3 of 3)
We need to ensure that `uzer` account has database access. We will try to establish a database connection to the `ontimedb` database by first logging in under the `uzer` unix account then attempting to connect:

- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# su - uzer`
- `uzer@ubuntu-s-4vcpu-8gb-lon1-01:~$ source ~actian/.ingVWsh`
- `uzer@ubuntu-s-4vcpu-8gb-lon1-01:~$ export ODBCSYSINI=/opt/Actian/VectorVW/ingres/files`
- `uzer@ubuntu-s-4vcpu-8gb-lon1-01:~$ iiodbcadmin test ontimedb`:
```
iiodbcadmin: Connection was successful.
```

## 1.2. Dataset - Installation
### 1.2.1. Prerequisites
Check that you have enough free space to accomodate the uncompressed dataset using `df -Th`.
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# df -Th`:
```
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     799M  8.7M  790M   2% /run
/dev/vda1      ext4      155G  2.8G  153G   2% /
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/vda15     vfat      105M  3.4M  101M   4% /boot/efi
tmpfs          tmpfs     799M     0  799M   0% /run/user/0
```

We have 153GB of free space on `/dev/vda1` which should suffice for this session but just in case, let's see if some more space can be freed up. 
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# du -shL /tmp/actian-vector-5.0.0-412-community-linux-x86_64*`:
```
319M    /tmp/actian-vector-5.0.0-412-community-linux-x86_64
267M    /tmp/actian-vector-5.0.0-412-community-linux-x86_64.tgz
```
That's nearly 0.6GB of space. Let's remove those files since we no longer need them:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# rm -rf /tmp/actian-vector-5.0.0-412-community-linux-x86_64*`


### 1.2.2. Download
Please follow the steps below to download the 6GB dataset.
- Sign up for a free account on Actian's [Electronic Software Distribution (ESD)](http://esd.actian.com/).
- While logged in to ESD, expand the "Community Projects" link in the right-hand navigation
- Then click on [Airline On-Time Performance Data (Oct 1987 – Jan 2017) | Release | Linux x86 64-bit ](http://esd.actian.com/product/Community_Projects/Datasets/Linux_X86_64-bit/Airline_On-Time_Performance_Data_Oct_1987__Jan_2017) to reveal the download button
- Click the download button labelled "HTTP" to start your download of `ontimefiles.zip` to `/tmp/data`.

### 1.2.3. Extraction
From a console, uncompress the downloaded file `ontimefiles.zip` which is about 6GB:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# cd /tmp/data`
- `root@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data# unzip ontimefiles.zip`:
```
Archive:  ontimefiles.zip
  inflating: On_Time_On_Time_Performance_2015_12.csv
  inflating: On_Time_On_Time_Performance_2016_1.csv
  inflating: On_Time_On_Time_Performance_2016_2.csv
  inflating: On_Time_On_Time_Performance_2016_3.csv
  inflating: On_Time_On_Time_Performance_2016_4.csv
  ...
  inflating: On_Time_On_Time_Performance_2015_8.csv
  inflating: On_Time_On_Time_Performance_2015_9.csv
  inflating: On_Time_On_Time_Performance_2015_10.csv
  inflating: On_Time_On_Time_Performance_2015_11.csv
  inflating: On_Time_On_Time_Performance_2000_12.csv
  inflating: loadall.bat
  inflating: readme.html
  inflating: loadall.sh
 ```
Next up we will make the `loadall.sh` convenience script for loading the dataset executable:
- `root@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data# chmod +x loadall.sh`

The uncompressed files occupy about 70GB on disk but let's check how much free space is left:
 - `root@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data# df -Th`:
 ```
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     799M  8.7M  790M   2% /run
/dev/vda1      ext4      155G   76G   80G  49% /
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/vda15     vfat      105M  3.4M  101M   4% /boot/efi
tmpfs          tmpfs     799M     0  799M   0% /run/user/0
```
We have about 80GB of free space left to load the csv files into the database.

### 1.2.4. Importing the Dataset
Actian published an article on April 26, 2017 that describes how to load the data set titled [Airline On-Time Performance Data and Sample Queries](https://communities.actian.com/s/article/Airline-On-Time-Performance-Data-and-Sample-Queries). The article links to an "Airline Demo.pdf" file which contains instructions and sample DDLs for the target tables that are needed.

To summarize, for the load to succeed, we must first create target tables -- tables that will hold the imported data, before attempting to load the dataset. Our target tables will be created inside the `ontimedb` database we created earlier.

There are 2 target tables listed below. The DDL file for each table should be downloaded to your machine's `/tmp/sql`:
* [ontime](sql/01_ontime.sql)
* [carriers](sql/02_carriers.sql)

#### 1.2.4.1. Target Tables
1.0. We will first login as the `actian` unix account, then execute the 2 sql scripts linked to above, which should be downloaded to `/tmp/sql`.
- `root@ubuntu-s-4vcpu-8gb-lon1-01:~# su - actian`
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ source ~/.ingVWsh`
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ cd /tmp/sql`

2.0. Now create the first table - the `ontimedb.ontime` table:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/sql$ sql ontimedb < 01_ontime.sql`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 16:25:02 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* * * * * /* SQL Startup File */
create table ontime(
year integer not null,
quarter i1 not null,
month i1 not null,
...
div5longestgtime varchar(10) default NULL collate ucs_basic,
div5wheelsoff varchar(10) default NULL collate ucs_basic,
div5tailnum varchar(10) default NULL collate ucs_basic
)
Executing . . .

continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 16:25:02 2018
```

3.0. Next create the second table - the `ontimedb.carriers` table:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/sql$ sql ontimedb < 02_carriers.sql`
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 16:23:21 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* * * * * /* SQL Startup File */
create table carriers(
ccode char(2) collate ucs_basic,
carrier char(25) collate ucs_basic
)
Executing . . .

continue
* * * * * * * * * * * * * * * *

INSERT INTO carriers VALUES
('AS','Alaska Airlines (AS)'),
('AA','American Airlines (AA)'),
('DL','Delta Air Lines (DL)'),
('EV','ExpressJet Airlines (EV)'),
('F9','Frontier Airlines (F9)'),
('HA','Hawaiian Airlines (HA)'),
('B6','JetBlue Airways (B6)'),
('OO','SkyWest Airlines (OO)'),
('WN','Southwest Airlines (WN)'),
('NK','Spirit Airlines (NK)'),
('UA','United Airlines (UA)'),
('VX','Virgin America (VX)')
Executing . . .

(12 rows)
continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 16:23:21 2018
```
4.0. Finally, grant `uzer` access to the newly added tables.
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/sql$ echo 'GRANT ALL PRIVILEGES ON TABLE ontime, carriers TO uzer \g' | sql ontimedb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Sun Apr  1 16:25:21 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .

continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Sun Apr  1 16:25:21 2018
```
#### 1.2.4.2. Load Data
The next step is to load the data using the fast loader tool `vwload`. The dataset already includes a `loadall.sh` helper script which we made executable earlier, so we will simply use it.

1.0. First we will change to the folder containing the uncompressed dataset:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:~$ cd /tmp/data`

2.0. Next we will execute the script. It took about 45mins to complete so be aware it might take some time to finish on your machine.
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data$ time ./loadall.sh`:
```
loading
processed 422803 records, loaded 422803 records, 0 errors
loading
processed 440403 records, loaded 440403 records, 0 errors
loading
processed 448620 records, loaded 448620 records, 0 errors
...
loading
processed 498347 records, loaded 498347 records, 0 errors
loading
processed 454878 records, loaded 454878 records, 0 errors
loading
processed 450017 records, loaded 450017 records, 0 errors

real    44m32.843s
user    38m29.184s
sys     2m37.184s
```
3.0. Let's run a basic query to check that we successfully loaded the data:
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data$ echo 'SELECT count(*) FROM ontime\g' | sql ontimedb`:
```
TERMINAL MONITOR Copyright 2016 Actian Corporation
Vector Linux Version VW 5.0.0 (a64.lnx/412) login
Mon Apr  2 00:54:22 2018
Enter \g to execute commands, "help help\g" for general help,
"help tm\g" for terminal monitor help, \q to quit

continue
* Executing . . .


┌──────────────────────┐
│col1                  │
├──────────────────────┤
│             165892051│
└──────────────────────┘
(1 row)
continue
*
Your SQL statement(s) have been committed.

Vector Version VW 5.0.0 (a64.lnx/412) logout
Mon Apr  2 00:54:22 2018
```
If you got 160+ million records (`165892051`in my case) in your output, then you have successfully loaded the dataset!

4.0. Database disk usage comes down to about 16GB so total disk requirements for the dataset is: 70 + 16 = 86GB or ~90GB.
- `actian@ubuntu-s-4vcpu-8gb-lon1-01:/tmp/data$ df -Th`:
```
Filesystem     Type      Size  Used Avail Use% Mounted on
udev           devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     799M  8.7M  790M   2% /run
/dev/vda1      ext4      155G   92G   64G  60% /
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     5.0M     0  5.0M   0% /run/lock
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
/dev/vda15     vfat      105M  3.4M  101M   4% /boot/efi
tmpfs          tmpfs     799M     0  799M   0% /run/user/0
```

## 1.3. Command Summary
All of the commands that were explained above have been combined into a copy-paste friendly format for easy inclusion inside `bash` scripts.
```
## Pre-installation (as "sudo" account)
sudo apt install libaio1
mkdir -p /tmp/data && mkdir -p /tmp/sql
cd /tmp
curl -L -O http://esdcdn.actian.com/Vector/5.0/Community/a64.lnx/actian-vector-5.0.0-412-community-linux-x86_64.tgz
tar xvf actian-vector-5.0.0-412-community-linux-x86_64.tgz
cd actian-vector-5.0.0-412-community-linux-x86_64

## Installation - accept all defaults (as "sudo" account)
sudo ./install.sh
## will be installed at /opt/Actian/VectorVW and create an "actian" unix account

## Post installation - startup script (as "sudo" account)
sudo -u actian bash -c 'source ~actian/.ingVWsh && mkrc'
sudo cp -v /opt/Actian/VectorVW/ingres/files/rcfiles/actian-vectorVW /etc/init.d/
sudo systemctl enable actian-vectorVW
sudo systemctl start actian-vectorVW

## Post installation - clean up (as "sudo" account)
rm -rf /tmp/actian-vector-5.0.0-412-community-linux-x86_64*

## Create another unix account `uzer:password` to be granted database access later (as "sudo" account)
sudo apt install whois
crypt3passwd=`mkpasswd -m sha-512 -S requiresASalt -s <<< password`
sudo useradd -m -p $crypt3passwd -s /bin/bash uzer

## Post installation - test server status (as "actian" account)
su -l actian
source ~/.ingVWsh
echo 'select 1\g' | sql iidbdb

## Create a new database (still as "actian" account)
createdb ontimedb
iiodbcadmin add ontimedb
iiodbcadmin test ontimedb

## Grant the non-DBA `uzer` account local & remote database access (as "actian" account)
echo 'CREATE USER uzer WITH NOPROFILE, NOGROUP, NOEXPIRE_DATE, NOSECURITY_AUDIT \g' | sql iidbdb
echo 'GRANT ALL PRIVILEGES ON DATABASE ontimedb TO uzer \g' | sql iidbdb
echo "ALTER USER uzer WITH PASSWORD = 'password'\g" | sql iidbdb

## Test that the "uzer" account has database access (as "uzer" account)
su - uzer
source ~actian/.ingVWsh
export ODBCSYSINI=/opt/Actian/VectorVW/ingres/files
iiodbcadmin test ontimedb

## Download the zipped dataset to /tmp/data (as "uzer" account)
... 

## Download the sql files to /tmp/sql (as "uzer" account)
... 

## Make the included helper script for the load tool executable (as "sudo" account)
cd /tmp/data
unzip ontimefiles.zip
chmod +x loadall.sh

## Create the target tables (as "actian" account)
su - actian
source ~/.ingVWsh
cd /tmp/sql
sql ontimedb < 01_ontime.sql
sql ontimedb < 02_carriers.sql
echo 'GRANT ALL PRIVILEGES ON TABLE ontime, carriers TO uzer \g' | sql ontimedb

## Load the dataset (still as "actian" account)
cd /tmp/data
time ./loadall.sh
echo 'SELECT count(*) FROM ontime\g' | sql ontimedb
```
