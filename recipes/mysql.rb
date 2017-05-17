mysql_db 'Creating MySQL DB' do
  db_user node['aps-db']['mysql']['username']
  db_pass node['aps-db']['mysql']['password']
  db_name node['aps-db']['mysql']['database_name']

  action :run
end
