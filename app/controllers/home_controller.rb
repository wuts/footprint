class HomeController < ApplicationController
layout "main"
  def index
    @progresses=Progress.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @progresses }
    end
  end
end
