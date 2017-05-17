require 'spec_helper'
require 'chefspec'

describe 'aps-db::postgres' do
  before do
    stub_command('getenforce | grep -i enforcing').and_return(false)
  end
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'Creating Postgres DB' do
    expect(
      db_user: 'alfresco',
      db_pass: 'alfresco',
      db_name: 'process'
    )
  end
end
