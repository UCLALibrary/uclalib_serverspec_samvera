shared_examples 'remote-solr::init' do

# required ENV VARS: remote-solr-host and remote-solr-core-name
# this shared example requires a domain for the remote-solr host
# it then verifies that the remote solr host is accessible from the current host
# and that the URL returns reasonable results

# build our solr_url
solr_url = 'http://'
solr_url << ENV['REMOTE-SOLR-HOST']
solr_url << '/solr/admin/cores?action=STATUS'

# build our expected core
expected_solr_core = '"name":"'
expected_solr_core << ENV['REMOTE-SOLR-CORE-NAME']
expected_solr_core << '",'

#TODO parameterize this
# verify the Solr URL returns a result
describe command("curl -o - #{solr_url}") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain( expected_solr_core ).from(/^  "status":/).to(/^.*}}}}/) }
end

end
