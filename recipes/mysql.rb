#
# Cookbook Name:: aps-db
# Recipe:: mysql
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

mysql_db 'Creating MySQL DB' do
  db_user node['aps-db']['mysql']['username']
  db_pass node['aps-db']['mysql']['password']
  db_name node['aps-db']['mysql']['database_name']

  action :run
end

mysql_db 'Creating MySQL Admin DB' do
  db_user node['aps-db']['mysql']['username']
  db_pass node['aps-db']['mysql']['password']
  db_name node['aps-db']['mysql']['admin_db_name']
end
