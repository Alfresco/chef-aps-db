require 'spec_helper'
require 'chefspec'

describe 'aps-db::postgres' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  # it 'converges successfully' do
  #  expect { chef_run }.to_not raise_error
  # end

  # it 'includes the `database::postgresql` recipe' do
  #   expect(chef_run).to include_recipe('database::postgresql')
  # end

  # it 'includes the `postgresql::server` recipe' do
  #   expect(chef_run).to include_recipe('postgresql::server')
  # ends

  # it 'Should create a Postgres DB' do
  #   expect(chef_run).to run_postgresql_db('Creating Postgres DB')
  # end

  it 'Creating Postgres DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'process'
    )
  end
end
