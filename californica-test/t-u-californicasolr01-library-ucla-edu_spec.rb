# require_relative '../spec_helper'
# leaving this here as an example of how to test multiple servers with a single
# rake task... but we do not have a shared login on all of our servers
# so we can only test from the point of view of the rails server
#
# describe 't-u-californicasolr01.library.ucla.edu' do
#
#     ENV['TARGET_HOST'] = 't-u-californicasolr01.library.ucla.edu'
#
#     include_examples 'solr::init'
#
#     # the host name should be set to host
#     describe host(ENV['TARGET_HOST']) do
#       it { should be_resolvable }
#     end
#
#     # TODO verify command outputs
#
# end
