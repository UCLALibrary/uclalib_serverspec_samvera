shared_examples 'remote-fedora::init' do

# required ENV VARS: remote-fedora-host
# this shared example requires a domain for the remote-solr host
# it then verifies that the remote solr host is accessible from the current host
# and that the URL returns reasonable results

# TODO refactor this to be suitable for our fedora instance

# build our fedora_url
fedora_url = 'http://'
fedora_url << ENV['REMOTE-FEDORA-HOST']
fedora_url << '/fcrepo/rest'

# verify the Fedora URL returns a result
describe command("curl -o - #{fedora_url}") do
  its(:exit_status) { should eq 0 }

  # TODO revise this
  its(:stdout) { should contain( 'rdf:type                       fedora:RepositoryRoot' ) }
end

end
