1. Prerequisites
2. Installation
3. Usage
4. Folder Structure



1--->   Prerequisites
Before running this project, ensure you have the following installed:
        
Java Development Kit (JDK) (Version 8 or above)
Apache Tomcat (Version 8.5 or above)
MySQL (Version 5.7 or above)
Maven (Optional for dependency management)
A web browser for accessing the application.


2--->      Installation
Follow these steps to set up the project locally:

git clone https://github.com/msandeep75/CEP-WTS.git
cd CEP-WTS
CREATE DATABASE cep_wts;
mysql -u <username> -p cep_wts < path/to/schema.sql
Configure the Server:
Deploy the project in an Apache Tomcat server.
Place the project folder in the webapps directory of your Tomcat installation.
Start the Server:
Start the Tomcat server.
Access the application in your browser at http://localhost:8080/CEP-WTS.


3--->      Usage

Admin Panel: Accessible after logging in as an admin user.
Key Functionalities:
[Briefly describe major functionalities, e.g., managing users, viewing data, etc.]
Sample Login Details
Username: admin
Password: admin123


4--->      Folder Structure

CEP-WTS/
├── src/                 # Source files (Servlets)
├── webContent/          #(JSPs,css,html,js)
├── WEB-INF/             # Static assets (xml,.class)
├── uploads              # storing uploaded images loacally
└── README.md            # Project documentation
 

