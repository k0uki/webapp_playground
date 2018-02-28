node.default['ruby_build']['upgrade'] = 'sync'

node.default['rbenv']['rubies'] = ['2.5.0']
node.default['rbenv']['global'] = '2.5.0'
node.default['rbenv']['gems'] = {
  '2.5.0' => [
    { 'name'    => 'bundler',
      'version' => '1.16.1'
    }
  ]
}
