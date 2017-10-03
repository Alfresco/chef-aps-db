require 'spec_helper'

RSpec.describe 'aps-db::postgres' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.2.1511',
      file_cache_path: '/var/chef/cache'
    ) do |node|
    end.converge(described_recipe)
  end

  before do
    stub_command('ls /var/lib/pgsql/9.4.6/data/recovery.conf').and_return('')
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'includes the `database::postgresql` recipe' do
    expect(chef_run).to include_recipe('database::postgresql')
  end

  it 'includes the `postgresql::server` recipe' do
    expect(chef_run).to include_recipe('postgresql::server')
  end

  it 'Should create a Postgres DB' do
    expect(chef_run).to run_postgresql_db('Creating Postgres DB')
  end

  it 'Should create a Postgres Admin DB' do
    expect(chef_run).to run_postgresql_db('Creating Postgres Admin DB')
  end

  it 'Creating Postgres DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'process'
    )
  end

  it 'Creating Postgres Admin DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'activitiadmin'
    )
  end
end
