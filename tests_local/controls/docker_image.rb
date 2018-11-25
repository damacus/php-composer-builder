
title 'Container Running'
control 'Running' do
  impact 1
  title 'Container should be running'
  desc 'Container should be running'

  describe docker_container('php-composer-builder') do
    it { should exist }
    it { should be_running }
  end

  describe docker_image('damacus/php-composer-builder') do
    it { should exist }
    its('tag') { should eq 'latest' }
  end
end
