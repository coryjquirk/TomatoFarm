# Java-CaseStudy
Full stack Java project

## Requirements
* Tomcat webserver
* Views:
  * CSS stylesheet
  * Six different views/pages (wireframed)
  * HTML and Thymeleaf (or Angular/React) for dynamic pages
  * At least one script written in JavaScript (jQuery allowed)
* Models and DB:
  * Config file (persistence.xml or application.properties)
  * 3+ custom queries, test each in each repository 
  * Test at least one method in each service class
  * Parameterized test (1+)
  * Test suite (1+)
  * MariaDB as DMBS
  * 4+ models with tables in a relational DB
  * schema diagram of tables
  * Jakarta Persistence API (JPA) directly or through Spring Data JPA
  * One example of each CRUD operation
  * JUnit for unit tests on JPA repositories/services
* Spring Boot:
  * Include at least two ways of creating a managed bean/object
  * Use correct implementations of dependency injection with appropriate use of the @Autowired annotation
  * Session management (can be Spring Security)
  * Apply exception handling where required by code
* Signup/login with bcrypt encrypted passwords (can be Spring Security)
* Custom exceptions
* Project package structure should be shown in class where models, DAO/repositories, services, controllers, exceptions, etc. have a package (views or templates don't require a package)
* Standard Java naming conventions:
  * Classes: Pascal case
  * Variables, methods, and URLS: camel case
  * Files, including file views: snake case 
  * Packages: all lowercase with each word seperated by dots, include name of project and your name (e.g. org.johndoe.myprojectname).
  * Comments to describe each class and methods (reference Java - JavaDoc in Canvas)
  * Host on GitHub with readme file
    * User stories and technical challenges, along with how they were resolved.
* Extras:
  * Spring security
  * Special user types (e.g. admin, analyst)
  * Utility class or Enum for constant variables (e.g. queries, named queries, HTML pages, URL patterns)
  * Selenium test
  * Mocking in a unit test
  * Web services (provider, consumer, or both)
