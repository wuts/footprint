# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fdba8d79ee591207747fc915c4e32258'

   ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at,:updated_at]
    #config.theme=:blue
    #config.theme=:default
  end

end
