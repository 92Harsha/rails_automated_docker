# rails_automated_docker
2
Automated Docker to Create/Run Rails Application
3
​
4
Description
5
​
6
  1) Create a rails Application using docker.
7
  2) Provide dynamic project name
8
  3) Flexible to run the application in any mode 
9
  4) Volume mapped Project
10
  5) Volume mapped Gems
11
​
12
Steps
13
​
14
  1) Create a rails Project 
15
     
16
     ./start_application.sh APP_NAME
17
     
18
     Example: ./start_application.sh article
19
     
20
  2) Run the project in particular mode
21
     
22
     ./start_application.sh APP_NAME RAILS_ENV
23
     
24
     Example: ./start_application.sh article development
25
     
26
  3) Bundle install, Run migration, Run Seed
27
  
28
     ./start_application.sh APP_NAME RAILS_ENV CODE_CHANGED
29
     
30
     Example: ./start_application.sh article development code_changed
31
# rails_automated_docker
