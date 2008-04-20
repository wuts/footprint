class FootprintsController < ApplicationController
  layout "admin"
  active_scaffold :footprint do |config|
    config.list.columns=[:name,:description,:quantity,:users]
    config.show.columns=[:name,:description,:quantity,:users]
    config.create.columns=[:name,:description,:quantity,:users]
    config.update.columns=[:name,:description,:quantity,:users]
    #config.action_links.add 'get_pdf',:label=>'download pdf'
    #config.columns[:name].description='footprint title'
    #config.columns[:title].inplace_edit=true
  end
end
