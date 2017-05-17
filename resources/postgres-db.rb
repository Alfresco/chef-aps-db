resource_name :postgresql_db

property :db_user, String
property :db_pass, String
property :db_name, String
property :db_defuser, String
property :db_defpass, String
property :db_port, String, default: '5432'
property :db_host, String, default: '127.0.0.1'

action :run do
  postgresql_connection_info =
    {
      host: db_host,
      port: db_port,
      username: db_defuser,
      password: db_defpass,
    }
  postgresql_database db_name do
    connection postgresql_connection_info
    action :create
  end

  postgresql_database_user db_user do
    connection postgresql_connection_info
    password   db_pass
    encoding 'utf8'
    action :create
  end

  postgresql_database_user db_user do
    connection    postgresql_connection_info
    database_name db_name
    schema_name 'public'
    tables [:all]
    sequences [:all]
    functions [:all]
    privileges    [:all]
    action        [:grant, :grant_schema, :grant_table, :grant_sequence, :grant_function]
  end
end
