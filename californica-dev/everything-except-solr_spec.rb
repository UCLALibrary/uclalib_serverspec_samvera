require_relative '../spec_helper'

#TODO: use properties instead of these environment variables, whenever I can
# be bothered to figure out how
ENV['REMOTE-SOLR-HOST'] = 'd-u-californicasolr01.library.ucla.edu'
ENV['REMOTE-SOLR-CORE-NAME'] = 'calursus'

describe 'californica-dev--everything-except-solr' do
    # include all the shared_examples
    include_examples 'database::init'
    include_examples 'proxy::init'
    include_examples 'fedora::init'
    include_examples 'railsapp::init'
    include_examples 'remote-solr::init'

    # the host name should be set to host
    describe host(ENV['TARGET_HOST']) do
      it { should be_resolvable }
    end

    # SELinux should be disabled
    describe selinux do
      it { should be_disabled }
    end

    # TODO verify command outputs

end
