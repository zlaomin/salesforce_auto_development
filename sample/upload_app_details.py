import pandas as pd
from simple_salesforce import Salesforce
pd.set_option('display.max_columns', None)
csv_file = "app_details.csv"
csv_data = pd.read_csv(csv_file, low_memory = False)
df = pd.DataFrame(csv_data)
# upload_data = df[['app_category',"current_download","previous_week_download","previous_week_revenue","release_date","app_id","company_name"]]
upload_data = df[["app_id",'app_name','app_category','company_name',"current_download","current_revenue","previous_week_download","previous_week_revenue"]]
# upload_data = df[[
# "app_id"
# ,'app_name'
# # ,'app_category'
# # ,'company_name'
# # ,"current_download","current_revenue"
# # "previous_week_download"
# # ,"previous_week_revenue"
# ]
# ]
print(upload_data)
new_columns={}
for i in upload_data.columns:
    new_columns[i] = i+"__c"
upload_data=upload_data.rename(columns=new_columns)
upload_data=upload_data.rename(columns={'app_name__c':'Name'})
upload_data=upload_data.to_dict(orient="records")
print(upload_data)
sf = Salesforce(password="knfWW6rt53k7b.7zD", username="zlaomamin@gmail.com", security_token="rEWh5UpM2ZldN4TJASSk8T")
sf.bulk.Company_apps__c.insert(upload_data)
