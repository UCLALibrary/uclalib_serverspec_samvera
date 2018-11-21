shared_examples 'imagemagick::init' do

  # define required packages
  # not an exhaustive list, just a few key ones without which we'd be doomed, like Ruby, Imagemagick, etc.
  # Define packages
  packages = {
      'ImageMagick' => {
      version: '6.7.8.9'
    }
  }

  # Verify packages
  packages.each do |name, details|
    describe package(name) do
      it { should be_installed.with_version(details[:version]) }
    end
  end

  # TODO verify command outputs



end
