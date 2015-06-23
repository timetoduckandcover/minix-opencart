# Mini X Developer Documentation

## Front End

### Setting up the project to run locally (OS X)

####1.Download [MAMP](https://www.mamp.info/en/) on your Mac (free)	
This will run an apache server & a mySQL server on your mac. The installation path should be /Applications/MAMP

####2.Clone Repository
Clone this repository to */Applications/MAMP/htdocs/minixstyle* using a git client like [Sourcetree](https://www.sourcetreeapp.com/)

####3.Edit Hosts File	   
Open Mac Terminal (type terminal into spotlight search) and type *sudo nano /private/etc/hosts* and enter your password if required
Shift down to the 127.0.0.1 localhost and on the next line add *127.0.0.1 minixstyle.local* in the same format as the localhost line above
Hold down *Control* and hit *X* - you will be prompted to save by hitting *Y* and *Enter/Return*

####4.Edit the vHosts file
Navigate to /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
Scroll down to the bottom, add the below & save
```
<VirtualHost *:80>
    DocumentRoot "/Applications/MAMP/htdocs/minixstyle"
    ServerName minixstyle.local
</VirtualHost> 
```

####5.Import the database		
Open MAMP and click 'start servers' - ensure that Apache Server & MySQL server lights turn green (Skype might possibly conflict with the MySQL Server if they run on the same port)
Open your browser and navigate to *http://localhost/phpmyadmin*
Create a new database called *minix* and import the minix.sql database that you'll find in the root of the project at */Applications/MAMP/htdocs/minixstyle* (if this is unsuccessful, open the database in a text editor like Sublime Text and add ```--``` before line 22 - the create statement - to comment this out. Then try again).
Issues: If you have set up a different user/password on your phpmyadmin, you will need to change this in the *config.php* file in the root directory on lines 24 & 25 (replace 'root' with whatever you have chosen)

####6.Run Grunt and watching for changes
The front end of this site uses Grunt to watch Sass & Js files for changes and compiles them all to to minified files (this reduces http requests, keeps the css & js structure clean and tidy and speeds up the final running of the site)










