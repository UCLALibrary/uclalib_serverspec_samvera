shared_examples 'remote-iiif::init' do

# required ENV VARS: remote-iiif-host
# this shared example requires a domain for the remote-iiif host
# it then verifies that the remote iiif host is accessible from the current host
# and that the URL returns reasonable results

# IIIF_SERVER_URL=https://t-u-cantaloupe01.library.ucla.edu/cantaloupe/iiif/2
# build our iiif_server_url
iiif_server_url = 'https://'
iiif_server_url << ENV['REMOTE-IIIF-HOST']
iiif_server_url << '/cantaloupe/iiif/2'

# verify the IIIF URL returns a result
describe command("curl -o - #{iiif_server_url}") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain( "#{iiif_server_url}/{identifier}/info.json" ).from(/<li>Sample Requests/).to(/<li>Also Available:/) }
end

end
