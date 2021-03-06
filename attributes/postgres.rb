default['aps-db']['postgres']['username'] = 'alfresco'
default['aps-db']['postgres']['password'] = 'alfresco'
default['aps-db']['postgres']['database_name'] = 'process'
default['aps-db']['postgres']['admin_db_name'] = 'activitiadmin'
default['aps-db']['postgres']['default_user'] = 'postgres'
default['postgresql']['password']['postgres'] = 'alfresco'

default['postgresql']['version'] = '9.4.6'
default['postgresql']['enable_pgdg_apt'] = true

# setting up this attributes as nil, in order for postgres setting up correctly the locales to 'C'
default['postgresql']['config']['lc_messages'] = nil
default['postgresql']['config']['lc_monetary'] = nil
default['postgresql']['config']['lc_numeric'] = nil
default['postgresql']['config']['lc_time'] = nil
