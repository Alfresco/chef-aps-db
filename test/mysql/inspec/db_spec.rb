control 'aps-01' do
  impact 0.7
  title 'MYSQL configuration'
  desc 'Checks mysql connection'

  describe user('mysql') do
    it { should exist }
  end

  describe service('mysql-local') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
