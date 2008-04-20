class User < ActiveRecord::Base
  has_many :footprints,:through=>:myfootprints
  has_many :myfootprints
end
