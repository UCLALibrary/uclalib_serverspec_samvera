shared_examples 'remote-db::init' do

# required ENV VARS: remote-db-host and remote-db-name
# this shared example requires a domain for the remote-solr host
# it then verifies that the remote solr host is accessible from the current host
# and that the URL returns reasonable results

mysql_host = ENV['REMOTE-DB-HOST']
mysql_user_name = ENV['REMOTE-DB-USER-NAME']

# define required packages
packages = {
  'mysql-community-client' => {
    version: '5.6.44'
  }
}

# Verify packages
packages.each do |name, details|
  describe package(name) do
    it { should be_installed.with_version(details[:version]) }
  end
end

# run a command to connect to the mysql server (don't use a password, we just
# want to confirm the connection... we'll see a different error if the remote
# mysql server is unavailable)
describe command("/usr/bin/mysql -u #{mysql_user_name} -h #{mysql_host} -pintentionallywrong") do
  its(:exit_status) { should eq 1 }
  # ERROR 1045 (28000): Access denied for user 'califstageuser'@'s-w-californicaweb01.library.ucla.edu' (using password: YES)
  its(:stderr) { should contain( "ERROR 1045" ) }
  its(:stderr) { should contain( "Access denied for user '#{mysql_user_name}'" ) }
  its(:stderr) { should contain( "using password: YES" ) }
end


end
