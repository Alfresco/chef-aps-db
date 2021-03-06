require 'spec_helper'
require 'chefspec'

RSpec.describe 'aps-db::mysql' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '7.2.1511',
      file_cache_path: '/var/chef/cache'
    ) do |node|
    end.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'Creating MySQL DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'process'
    )
  end

  it 'Creating MySQL Admin DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'activitiadmin'
    )
  end

  it 'Should create a MYSQL DB' do
    expect(chef_run).to run_mysql_db('Creating MySQL DB')
  end

  it 'Should create an admin MYSQL DB' do
    expect(chef_run).to run_mysql_db('Creating MySQL Admin DB')
  end
end
