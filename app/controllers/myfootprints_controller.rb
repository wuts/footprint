class MyfootprintsController < ApplicationController
  layout "admin"
  active_scaffold :myfootprint do |config|
    config.list.columns=[:user,:footprint,:progress,:photo,:occur_time]
    config.show.columns=[:user,:footprint,:progress,:photo,:occur_time]
    config.create.columns=[:user,:footprint,:progress,:photo,:occur_time]
    config.update.columns=[:user,:footprint,:progress,:photo,:occur_time]
   end
end
