default[:postgresql_setup][:users] = [
  { name: 'vagrant', password: 'vagrant', privileges: [ :all ] }
]
