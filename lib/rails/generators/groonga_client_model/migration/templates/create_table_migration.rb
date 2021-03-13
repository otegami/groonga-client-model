class <%= migration_class_name %> < GroongaClientModel::Migration
  def change
    create_table :<%= table_name %><%=
                 create_table_options("    create_table ".size)
                 %> do |t|
<% target_attributes.each do |attribute| -%>
      t.<%= normalize_attribute_type(attribute.type) %> :<%= attribute.name %><%= attribute.inject_options %>
<% end -%>
<% if options[:timestamps] -%>
      t.timestamps
<% end -%>
    end
  end
end
