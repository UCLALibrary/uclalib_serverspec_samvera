require_relative '../spec_helper'

#TODO: use properties instead of these environment variables, whenever I can
# be bothered to figure out how
ENV['APP_NAME'] = 'ursus'
ENV['REMOTE-SOLR-HOST'] = 's-u-californicasolr01.library.ucla.edu'
ENV['REMOTE-SOLR-CORE-NAME'] = 'calursus'
ENV['REMOTE-IIIF-HOST'] = 's-u-cantaloupe01.library.ucla.edu'

describe 'ursus-stage--blacklight' do
    # include all the shared_examples
    include_examples 'remote-solr::init'
    include_examples 'remote-iiif::init'
    include_examples 'proxy::init'
    include_examples 'railsapp::init'


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
