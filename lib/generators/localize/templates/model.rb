<%= @loc %>:
  <%= plural_name %>:
    attributes:
<% @attributes.each do |attribute| -%>
      <%= attribute %>: <%= attribute.gootra(@loc) %>
<% end -%> 
