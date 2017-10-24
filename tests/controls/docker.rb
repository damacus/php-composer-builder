# encoding: utf-8
# copyright: 2017, DeBankeGroup

title 'Built Container'

control 'container-name' do
  impact 0.7
  title 'Names & Tags'
  desc 'Should be tagged php-composer-builder'
  describe docker_image('damacus/php-composer-builder:latest') do
    it { should exist }
    its('repo') { should match /damacus\/php-composer-builder/ }
    its('tag') { should eq 'latest' }
  end
end
