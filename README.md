# rails_automated_docker
Automated Docker to Create/Run Rails Application

Description

  1) Create a rails Application using docker.
  2) Provide dynamic project name
  3) Flexible to run the application in any mode 
  4) Volume mapped Project
  5) Volume mapped Gems

Steps
```
  1) Create a rails Project 
  
     ./start_application.sh APP_NAME

     Example: ./start_application.sh article

  2) Run the project in particular mode

     ./start_application.sh APP_NAME RAILS_ENV

     Example: ./start_application.sh article development

  3) Bundle install, Run migration, Run Seed

     ./start_application.sh APP_NAME RAILS_ENV CODE_CHANGED

     Example: ./start_application.sh article development code_changed
```
