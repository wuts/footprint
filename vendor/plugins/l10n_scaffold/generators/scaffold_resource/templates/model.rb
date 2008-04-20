class <%= class_name %> < ActiveRecord::Base
  # human names
  ModelName = "<%= class_name %>"
  ColumnNames ={
<%= attributes.collect {|attr|  "    :#{attr.name} => \"#{attr.name}\""}.join(",\n") %>
  }
end
