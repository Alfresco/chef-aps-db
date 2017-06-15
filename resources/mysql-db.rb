resource_name :mysql_db

property :db_user, String
property :db_pass, String
property :db_name, String
property :mysql_root_password, String, default: 'alfresco'
property :db_port, String, default: '3306'
property :mysql_version, String, default: '5.6'
property :db_host, String, default: '127.0.0.1'
property :db_root_user, String, default: 'root'

action :run do
  mysql2_chef_gem 'default' do
    client_version mysql_version
    action :install
  end

  selinux_commands = {}
  selinux_commands['mkdir -p /var/lib/mysql-local ; semanage fcontext -a -t mysqld_db_t "/var/lib/mysql-local(/.*)?" ; restorecon -Rv /var/lib/mysql-local;']  = 'ls -lZ /var/lib/mysql-local | grep mysqld_db_t'
  selinux_commands['mkdir -p /var/log/mysql-local ; semanage fcontext -a -t mysqld_log_t "/var/log/mysql-local(/.*)?" ; restorecon -Rv /var/log/mysql-local;'] = 'ls -lZ /var/log/mysql-local | grep mysqld_log_t'
  # TODO: - add nginx 2100 port rule => into nginx.rb

  # TODO: - make it a custom resource
  selinux_commands.each do |command, not_if|
    execute "selinux-command-#{command}" do
      command command
      only_if 'getenforce | grep -i enforcing'
      not_if not_if
    end
  end


  mysql_service 'local' do
    port db_port
    version mysql_version
    initial_root_password mysql_root_password
    action [:create, :start]
  end

  mysql_connection_info = {
    host: db_host,
    username: db_root_user,
    password: mysql_root_password,
  }

  mysql_database db_name do
    connection mysql_connection_info
    collation 'utf8_general_ci'
    encoding 'utf8'
    action :create
  end

  mysql_database_user db_user do
    connection mysql_connection_info
    host '%'
    password db_pass
    action [:create, :grant]
  end

  service 'mysql-local' do
    action :restart
  end
end
