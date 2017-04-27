mysql_db 'Creating MySQL DB' do
  db_user node['aps-db']['username']
  db_pass node['aps-db']['password']
  db_name node['aps-db']['database_name']

  action :run
end
