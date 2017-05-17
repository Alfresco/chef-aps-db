services = ['mysql-local']

control 'aps-01' do
  impact 0.7
  title 'MySQL configuration'
  desc 'Checks mysql connection'

  describe user('mysql') do
    it { should exist }
  end

  describe 'MySql DB' do
    services.each do |service|
      it "Has a running #{service} service" do
        expect(service(service)).to be_running
      end
    end
  end
end
