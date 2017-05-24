require 'spec_helper'
require 'chefspec'

describe 'aps-db::mysql' do
  before do
    stub_command('getenforce | grep -i enforcing').and_return(false)
  end
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
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

  it 'Should create a MYSQL DB' do
    expect(chef_run).to run_mysql_db('Creating MySQL DB')
  end
end
