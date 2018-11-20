shared_examples 'redis::init' do

  # port 6379 is open
  %w{6379}.each do |ports|
    describe port(ports) do
      it { should be_listening }
    end
  end

  # Verify services
  %w{redis}.each do |svc|
    describe service(svc) do
      it { should be_running }
    end
  end

  # TODO verify command outputs



end
