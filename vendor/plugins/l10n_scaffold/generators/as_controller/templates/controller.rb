class <%= class_name %>Controller < ApplicationController
  active_scaffold do |config|
    config.columns = <%= class_name.singularize %>::ColumnNames.collect {|column, human_name| column}

    #list.columns.exclude :nil
    #create.columns.exclude :nil
    #update.columns.exclude :nil
    #show.columns.exclude :nil
  end

  # active_scaffold callbacks
  def conditions_for_collection()
  end

  def before_create_save(record)
  end

  def after_create_save(record)
  end
  
  def before_update_save(record)
  end

  def after_update_save(record)
  end
end
