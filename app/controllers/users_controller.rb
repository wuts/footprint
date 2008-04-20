class UsersController < ApplicationController
  layout "admin"
  active_scaffold :user do |config|
    config.list.columns=[:name,:password,:email]
    config.show.columns=[:name,:password,:email]
    config.create.columns=[:name,:password,:email]
    config.update.columns=[:name,:password,:email]
  end
end
