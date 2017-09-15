#
# Cookbook Name:: aps-db
# Recipe:: postgres
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

include_recipe 'database::postgresql'
include_recipe 'postgresql::server'

postgresql_db 'Creating Postgres DB' do
  db_user node['aps-db']['postgres']['username']
  db_pass node['aps-db']['postgres']['password']
  db_name node['aps-db']['postgres']['database_name']
  db_defuser node['aps-db']['postgres']['default_user']
  db_defpass node['postgresql']['password']['postgres']

  action :run
end

postgresql_db 'Creating Postgres Admin DB' do
  db_user node['aps-db']['postgres']['username']
  db_pass node['aps-db']['postgres']['password']
  db_name node['aps-db']['postgres']['admin_db_name']
  db_defuser node['aps-db']['postgres']['default_user']
  db_defpass node['postgresql']['password']['postgres']

  action :run
end
