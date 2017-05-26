# chef-aps-db cookbook
[![Build Status](https://travis-ci.com/Alfresco/chef-aps-db.svg)](https://travis-ci.com/Alfresco/chef-aps-db.svg?token=yHqELzyFjvFuT3MeD8Vf&branch=develop)

This cookbook will create the database needed for APS.
The default choice is Mysql, but it can be expanded to use Postgres as well.

## Requirements

### Cookbooks

The following cookbooks are direct dependencies because they're used for common "default" functionality.

- [`database`](https://github.com/chef-boneyard/database) to init the databases
- [`postgresql`](https://github.com/sous-chefs/postgresql) to create the Postgres Service 

### Platforms

The following platforms are supported and tested with Test Kitchen:

- CentOS 7+

### Chef

- Chef 12.1+

## Attributes for default recipe

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['aps-db']['engine'] | String | Engine of choice  | mysql  |

## Attributes for mysql recipe

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['aps-db']['mysql']['username'] | String | Database Username  | alfresco  |
| default['aps-db']['mysql']['password'] | String | Database Password  | alfresco  |
| default['aps-db']['mysql']['database_name'] | String | Database Name  | process  |

## Attributes for postgres recipe

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['aps-db']['postgres']['username'] | String | Database Username  | alfresco  |
| default['aps-db']['postgres']['password'] | String | Database Password  | alfresco  |
| default['aps-db']['postgres']['database_name'] | String | Database Name  | process  |
| default['aps-db']['postgres']['default_user'] | String | Database Default Username  | postgres  |
| default['postgresql']['password']['postgres'] | String | Database Default Password  | alfresco  |
| default['postgresql']['version'] | String | Postgres version  | 9.4.6  |
| default['postgresql']['enable_pgdg_apt'] | String | Enable apt repo  | true  |


## Mysql recipe

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| db_user | String | Database Username  | node['aps-db']['mysql']['username']  |
| db_pass | String | Database Password  | node['aps-db']['mysql']['password']  |
| db_name | String | Database Name  | node['aps-db']['mysql']['database_name']  |


## Postgres recipe

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| db_user | String | Database Username  | node['aps-db']['postgres']['username']  |
| db_pass | String | Database Password  | node['aps-db']['postgres']['password']  |
| db_name | String | Database Name  | node['aps-db']['postgres']['database_name']  |
| db_defuser | String | Database Password  | node['aps-db']['postgres']['default_user']  |
| db_defpass | String | Database Name  | node['postgresql']['password']['postgres']  |

## Mysql Resources

| Function | Description |
|-----|------|
| mysql2_chef_gem | installation of mysql using a chef gem  |
| mysql_service | creation and init of mysql service  |
| mysql_connection_info | setting up the connection info  |
| mysql_database | creation of the database  |
| mysql_database_user | creation of the user for the database access  |


### Properties

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| db_user | String | Database Username  |  *  |
| db_pass | String | Database Password  |  *  |
| db_name | String | Database Name  |  *  |
| mysql_root_password | String | Mysql root password | alfresco  |
| db_port | String | Database Port  | 3306 |
| mysql_version | String | Mysql port  | 5.6  |
| db_host | String | Host Url/IP/DNS  | 127.0.0.1  |
| db_root_user | String | Database Root Username  | root  |

*-> default values from attributes.rb

## Postgres Resources

| Function | Description |
|-----|------|
| postgresql_connection_info | setting up the connection info  |
| postgresql_database | creation of the database  |
| postgresql_database_user | creation of the user for the database access  |
| postgresql_database_user | setting up the permissions for the user  |


### Properties

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| db_user | String | Database Username  |  *  |
| db_pass | String | Database Password  |  *  |
| db_name | String | Database Name  |  *  |
| db_defuser | String | Mysql root password |  *  |
| db_defpass | String | Database Port  |  *  |
| db_port | String | Mysql port  |  5432  |
| db_host | String | Host Url/IP/DNS  | 127.0.0.1  |

*-> default values from attributes.rb

## Usage

Just add the reference of this cookbook inside your `metadata.rb` file:

```
depends 'aps-db', '~> v1.0'
```

Main recipe is:

- `aps-db::default` will install the database of your choice ( specified under the `default['aps-db']['engine']` attribute)


## Testing
Refer to: [Testing](./TESTING.md)
## License and Authors

- Author:: DevOps (<devops@alfresco.com>)

```text
Copyright 2017, Alfresco

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```
