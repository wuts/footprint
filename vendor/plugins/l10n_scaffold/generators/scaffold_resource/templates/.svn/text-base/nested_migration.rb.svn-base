class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
<% for attribute in attributes -%>
      t.column :<%= attribute.name %>, :<%= attribute.type %>
<% end -%>
      t.column :<%= parent_singular_name %>_id, :integer
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
