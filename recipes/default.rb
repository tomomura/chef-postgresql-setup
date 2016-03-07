#
# Cookbook Name:: postgresql-setup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "database::postgresql"

postgresql_connection_info = {
  host:     "127.0.0.1",
  port:     node[:postgresql][:config][:port],
  username: 'postgres',
  password: node[:postgresql][:password][:postgres]
}

node[:postgresql_setup][:users].each do |user_info|
  postgresql_database_user user_info[:name] do
    connection postgresql_connection_info
    password user_info[:password]
    privileges user_info[:privileges]
    superuser user_info[:superuser]
    action :create
  end
end
