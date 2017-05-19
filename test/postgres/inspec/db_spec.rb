control 'aps-01' do
  impact 0.7
  title 'Postgres configuration'
  desc 'Checks postgres connection'

  describe user('postgres') do
    it { should exist }
  end

  describe service('postgresql') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end
end
