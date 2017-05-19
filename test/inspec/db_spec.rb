control 'aps-01' do
  impact 0.7
  title 'DB configuration'
  desc 'Checks databases connection'

  describe.one do
    describe user('mysql') do
      it { should exist }
    end
    describe user('postgres') do
      it { should exist }
    end
  end

  describe.one do
    describe service('mysql-local') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
    describe service('postgresql') do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  end
end
