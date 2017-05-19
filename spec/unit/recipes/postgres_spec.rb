require 'spec_helper'
require 'chefspec'

describe 'aps-db::postgres' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'includes the `postgres` recipe' do
    expect(chef_run).to include_recipe('aps-db::postgres')
  end

  it 'Should create a Postgres DB' do
    expect(chef_run).to run_postgresql_db('Creating Postgres DB')
  end

  it 'Creating Postgres DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'process'
    )
  end
end
