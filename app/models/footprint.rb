class Footprint < ActiveRecord::Base
  has_many :users,:through=>:myfootprints
  has_many :myfootprints
end
