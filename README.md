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

## Attributes

| Key | Type | Description | Default |
|-----|------|-------------|---------|
| default['aps-db']['engine'] | String | Engine of choice  | mysql  |

## Usage

Just add the reference of this cookbook inside your `metadata.rb` file:

```
depends 'aps-db', '~> v1.0'
```

Main recipe is:

- `aps-db::default` will install the database of your choice ( specified under the `default['aps-db']['engine']` attribute)

```
## Testing
Refer to: [Testing](./TESTING.md)
## License and Authors

- Author:: Marco Mancuso (<marco.mancuso@alfresco.com>)

```text
Copyright 2017, Alfresco

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
```
