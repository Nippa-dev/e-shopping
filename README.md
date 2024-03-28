# Green Supermarket Web Application

This is a web application for the Green Supermarket project. The application is built using Java Servlets and JSPs, and it connects to a MySQL database for data storage.

## Prerequisites

Before running the application, make sure you have the following installed:

- Java Development Kit (JDK) 14 or higher
- Apache Maven
- MySQL Server
- Tomcat 9.0 or higher

## Getting Started

1. **Clone the Repository:**

   ```bash
   git clone ssh(git@gitlab.com:tmcds/e-shopping.git) https(https://gitlab.com/tmcds/e-shopping.git )  
   cd project

   ```

2. **Setup Environment:**

### Move these files to apache-tomcat/lib

- [mysqlConnector](mysql-connector-java-8.0.23.jar)
- [activation.jar](activation.jar)
- [java emails](javax.mail.jar)

3.  **Build Project:**

```
mvn clean install

```

4. **Run Project:**

```
mvn org.apache.tomcat.maven:tomcat9-maven-plugin:run
```
## Full Repo

Find the full repo here:
https://gitlab.com/Nippa-dev/e-shopping
