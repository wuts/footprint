class <%= class_name %> < ActiveRecord::Base
  belongs_to :<%= parent_singular_name %>
  
  # human names
  # ModelName = "<%= class_name %>"
  # ColumnNames ={
<% for attribute in attributes -%>
     #:<%= attribute.name %> => "<%= attribute.name %>",
<% end -%>
     #:nil => "Nothing"
  # }
end
