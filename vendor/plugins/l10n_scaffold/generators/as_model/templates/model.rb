class <%= class_name %> < ActiveRecord::Base
  # active_scaffold callbacks: authorized_for_crud
  def authorized_for_create?
    true
  end

  def authorized_for_read?
    true
  end

  def authorized_for_update?
    true
  end

  def authorized_for_destroy?
    true
  end

  # human names
  ModelName = "<%= class_name %>"
  ColumnNames ={
<%= attributes.collect {|attr|  "    :#{attr.name} => \"#{attr.name}\""}.join(",\n") %>
  }
end
