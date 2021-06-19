# Setting up Ubuntu server for Flask web deployment

```
sudo apt-get update
sudo apt-get upgrade  -y 
sudo apt install python3-pip -y
sudo apt-get install python3-venv
sudo apt-get install libsndfile1
```

* SSH

- For github

```
ssh-keygen
#copy contents of /home/<user-name>/.ssh/id_rsa.pub #to github -> settings -> SSH and GPG keys

```

* Firewall

View status of the firewall
<b>Note<b>: on AWS you have to add rules in the security group option of the instance to allow particular trafic to and from the ports. 
Following commands only if you have your own sever where firewall option needs to be managed via terminal 

#to check open ports
sudo apt install net-tools
netstat -nlp


Uncomplicated firewall (ufw)
```
sudo apt install ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 5000
sudo ufw enable


sudo ufw status
E.g. output ->

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
5000                       ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)
5000 (v6)                  ALLOW       Anywhere (v6)

```


*  Nginx
```
#nginx handles static files
sudo apt-get install nginx -y
#gunicorn handles python part
pip3 install gunicorn 


#Remove the default nginx file
sudo rm /etc/nginx/sites-enabled/default

Add ngnix config for the project
vi /etc/nginx/sites-enabled/<project-name>
systemctl restart nginx
```

* Gunicorn
```
pip3 install gunicorn
#To run the app go to the root directory of your flask project and 
gunicorn -w 2 <file-name-w/o-.py-extension>:<name-of-app-object-in-code>
```

* Make website run as a systemd service (runs the web app in the background)
```
Add your systemd file in 
/lib/systemd/system/
```

An example systemd file -
```
[Unit]
Description=Flask app to show audio augmentations

[Service]
Type=simple
WorkingDirectory=/home/<user-name>/<app-directory>
ExecStart=/home/<user-name>/<app-directory>/bin/gunicorn -w 2 <app>:<app>
Environment=/home/<user-name>/<app-directory>/bin
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
  
  ```
 systemctl start <service-name>
 #check status of the service 
 systemctl status  <service-name>
 systemctl enable  <service-name>
 
  systemctl stop  <service-name>
  ```
  
 
