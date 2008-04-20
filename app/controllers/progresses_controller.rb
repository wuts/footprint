class ProgressesController < ApplicationController
  layout "admin"
  active_scaffold :progress do |config|
    config.list.columns=[:name,:description,:start,:end,:keywords]
    config.show.columns=[:name,:description,:start,:end,:keywords]
    config.create.columns=[:name,:description,:start,:end,:keywords]
    config.update.columns=[:name,:description,:start,:end,:keywords]
  end
end
