# encoding: utf-8
# copyright: 2017, DeBankeGroup

title 'Composer Command'

control 'composer-commands' do
  impact 0.7
  title 'composer'
  desc 'Should respond to the composer command'
  describe command('composer') do
    its('exit_status') { should match 0 }
    its('stdout') { should match /Composer version 1.5.2/ }
  end
end
