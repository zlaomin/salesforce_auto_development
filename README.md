# salesforce_auto_development
This repo include auto-deploy script for a salesfroce page and Source code for a  Salesforce org, with Customnized pages, layout, tab and tables.

Require JAVA, ANT.
We also need API Access of that ORG.
We should be aware that ​API Access is only available for Enterprise & Unlimited(paid user) as well as Developer.

Put username, password, security token. into file build.properties.
Cd to the folder “./ant/salesforce_ant_46.0/sample” and use command “ant test” to check if the environment is fine.
Be aware that the “original test” command will change the metadata of Sobject in the org we login. Do not use it in productivity environment unless we rewrite that command.
All the command is stored in the ​build.xml​. The most important commands are “deploy and download”.
Youcan also use upload_app_details.py to upload data.
