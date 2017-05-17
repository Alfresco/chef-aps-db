default['aps-db']['postgres']['engine'] = 'postgres'
default['aps-db']['postgres']['username'] = 'alfresco'
default['aps-db']['postgres']['password'] = 'alfresco'
default['aps-db']['postgres']['database_name'] = 'process'
default['aps-db']['postgres']['default_user'] = 'postgres'
default['aps-db']['postgres']['default_password'] = node['postgresql']['password']['postgres']

default['postgresql']['version'] = '9.4.6'
default['postgresql']['enable_pgdg_apt'] = true
default['postgresql']['config']['lc_messages'] = nil
default['postgresql']['config']['lc_monetary'] = nil
default['postgresql']['config']['lc_numeric'] = nil
default['postgresql']['config']['lc_time'] = nil
