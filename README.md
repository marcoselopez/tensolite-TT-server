# TENSOLITE TECHNICAL TEST - CRUD (Server)

CRUD created for a Technical Test for Tensolite.

The CRUD is developed using React for the Fron-end, SQL Server for the Database and Node for the API, using Node "mssql" package.

----------------------------------------------------------------------------------------------------------------------------------

# .ENV Configuration
---------------------
To set up the API, you need to configure the .env file for the connection to the database using the following parameters:

***PORT: Set up a port number for the "app.listen"
***USER: Set up the username used on your database
***PASSWORD: Set up the password used on your database
***SERVER: Set up the name of your database server
***DATABASE: Set up the name of your database

# API USAGE
-----------

***READ URL
```
https://localhost:PORTNUMBER/api/developers
```
This returns an array of developers.

***CREATE URL
```
https://localhost:PORTNUMBER/api/developers/add
```
This returns a modified array of developers (with the added developer) - You must send all the parameters of the object through the body of the petition, except the ID

***EDIT URL
```
https://localhost:PORTNUMBER/api/developers/edit
```
This returns a modified array of developers (with the edited developer) - You must send all the parameters of the object through the body of the petition, including the ID

***DELETE URL
```
https://localhost:PORTNUMBER/api/developers/delete/:id
```
This returns a modified array of developers (with the deleted developer) - You must send ID of the developer that you wish to eliminate through the body of the petition
