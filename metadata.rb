name 'aps-db'
maintainer 'Alfresco T&A Team'
maintainer_email 'devops@alfresco.com'
license 'Apache 2.0'
description 'Installs/Configures aps-db'
long_description 'Installs/Configures aps-db'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
issues_url 'https://github.com/Alfresco/aps-db/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
source_url 'https://github.com/Alfresco/aps-db' if respond_to?(:source_url)

depends 'database', '~> 6.1.1'
depends 'mysql', '~> 7.2'
depends 'mysql2_chef_gem', '>= 1.0.1'
depends 'postgresql', '~> 6.1.1'

chef_version '~> 12'
supports 'centos', '>= 7.0'
