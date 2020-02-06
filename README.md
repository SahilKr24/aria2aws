# aria2_for_aws

## Description

This project uses an instance based on aws(amazon web services) ec2 to download files on via aria2(command-line downlaod utility) and uplaoding them using rsync to your personal google drive account for easy accesss. Front end is handled by **[AriaNG](https://github.com/mayswind/AriaNg)**. This runs off a linux based server and has a bash script running on a cronjob that checks when the downloads are complete and then starts to upload them eliminating the need for manual intervention. Once the downlaod is complete the script the deletes the file from the server.

---

### Perquisites
* Knowing your way around a command-line.(MUST! XD)
* An ec2 instance on aws with the following configuration(1-vCPU, 1-gig RAM and 30GB of storage).
This configuration is eligible for free tier for 1 year. There are various guides on the internet that show how to set up an instance.*
* A public IP(elastic IP) to connect to your system and ssh/putty connection to login into the server.
* Knowledge of opening various ports to your instance via security groups.

## Table of Contents:
1. SSHing into and setting up the server.
2. Installing aria2c and setting up *aria2.conf* file.
3. Setting up *rsync* to upload files to personal google drive.
4. Writing a shell script to upload files when downlaod completes automatically.
5. Installing *apache2 server* to host front-end webpage.
6. Setting up RPC token key and load testing.

----

## Installation

### *Step 1:* SShing into your server

-Use your preferred ssh client to connect to your server. If you have set a new server this might be using a private *.pem* file or you can enable *passwordauthentication* to *yes* and use any terminal to ssh on port 22.

    $ ssh username@your-ip -p 22
    
-update the packages on your instance.

    $ sudo apt update
    $ sudo apt upgrade
    
### *Step 2:* Installing aria2c

-Now we will install aria2 on the server. Since it is a ubuntu machine we will be covering only ubuntu here.

    $ sudo apt-get install aria2
    
-Provide sudo password if asked and wait for the install to finish.

aria2 requires a configuration file to run. You can use my config file provided below.

    $ cd ~
    $ wget https://github.com/SahilKr24/aria2aws/blob/master/aria2.conf
    
We need to set the session file for aria2 to save sessions into so we'll create that

    $ mkdir ${HOME}/.aria2/
    $ touch ${HOME}/.aria2/aria2.session
   
We need to start aria2 now so execute the command below with the path of the *conf* file.

    $ aria2c --conf-path={aria2 configuration file} -D
    
    //assuming the file is in home disrectory
    
    $ aria2c --conf-path=aria2.conf -D
    
    //-D starts aria2 in background
    
We can now 

    $ htop
    
and see if aria2 is running. 

![](images/ariarunning.PNG)

-We have successfully installed aria2.

### *Step 3:* Setting up rsync


