Play-Deployment-Scripts
=======================

Script to automate deployment of zipped play file (dist)


Args: name of project (snapshot) without .zip extension

Example - To compile for production run 
```
play dist
```


This will produce a zip file <project_name.zip>.  
Copy file to server directory and run (note , omit .zip extension)
```
bash deployment.sh <project_name>	
```
