services = ['postgresql']

control 'aps-02' do
  impact 0.7
  title 'Postgres configuration'
  desc 'Checks postgres connection'

  describe user('postgres') do
    it { should exist }
  end

  describe 'Postgres DB' do
    services.each do |service|
      it "Has a running #{service} service" do
        expect(service(service)).to be_running
      end
    end
  end
end
