class Myfootprint < ActiveRecord::Base
  belongs_to :user
  belongs_to :footprint
  belongs_to :progress

  file_column :photo
  validates_filesize_of :photo,:in=>0..1000.kilobytes
end
