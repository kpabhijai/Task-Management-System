# Task-Management-System

This Project follows FW1 (MVC) framework

Environment Setup

1) Clone the branch in a directory.
2) Open IIS (Internet Information Serivces).
(Make sure you have added all the world wide web features for IIS).
(Add urlrewrite 2 to IIS.)
3) Right Click the "Sites" section in the left panel of IIS.
4) Select "Add Sites" from the menu.
5) Add "local.tms.com" with a port which is not used for other sites.
6) In Physical Path section, select the folder that the branch is cloned.
7) In IP Address field, add 127.0.0.1.
8) Add Add "local.tms.com" in Host Name.
9) Click "OK" and Save the details.
10) Open Coldfusion Web Server Configuration Tool
11) Select IIS website to "local.tms.com"
12) Restart IIS.
13) Add 127.0.0.1 local.tms.com in hosts file
14) Navigate to http://local.tms.com:{desiredPort}/

Database setup

1) Run the scripts in "dbScripts\taskManagementSystem.sql".
2) Add datasource "TaskManagementSystem" in coldfusion administration.

Key Features

1) Create and edit the task with ease.
2) Used FW1 framework to make it lightweight and scalable.
3) Easy creation and deletion of users.
