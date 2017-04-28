# Kindergarten Management System (KMS)

KMS is a system developed to manage student enrollment in a kindergarten school. 

## Table of Contents

- [Feature](#feature)
- [Backend Technology](#backend-technology)
- [Installation](#installation)
- [Documentation](#documentation)

## Feature

- Login
- Manage user
- Manage grade
- Manage session
- Manage room
- Manage fee type
- Manage fee
- Manage course
- Manage course room
- Manage student
- Manage entrollment
- Manage payment
- Enrollment Report

## Backend Technology

- Spring MVC
- Spring REST Api
- Spring Security
- MyBatis

## Installation


1. Clone project from this repository:
```sh
git clone https://github.com/ngsophal/student-management-system.git
```

2. Import database from kms.sql in the root of project
3. Update database connection configuration in pom.xml
4. cd to project directory
5. Install maven dependencies: ``` mvn install```
6. Generate Eclipse IDE files (Specifically for Eclipse)``` mvn eclipse:eclipse```
7. Import project to IDE
8. Start web server service using jetty ``` mvn jetty:run```
9. Open browser and login with account 
- username: admin
- password: admin123


## Documentation

- [REST Documentation as html](https://github.com/ngsophal/student-management-system/docs/index.html)
- [REST Documentation as pdf](https://github.com/ngsophal/student-management-system/docs/index.pdf)
- [Presentation Slide](https://github.com/ngsophal/student-management-system/docs/slide.pdf)
- [Demonstration Video](https://github.com/ngsophal/student-management-system/docs/slide.pdf)


