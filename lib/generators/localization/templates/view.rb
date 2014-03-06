<%= @loc %>:
  <%= plural_name %>:
    form:
      save: <%= "save".gootra(@loc) %>
      cancel: <%= "cancel".gootra(@loc) %>
    show:
      title: <%= "#{human_name} detail".gootra(@loc) %>
      index: <%= "All #{plural_name}".gootra(@loc) %>
      edit:
      destroy:
<% @attributes.each do |attribute| -%>
      <%= attribute %>: <%= attribute.gootra(@loc) %>
<% end -%>
    index:
      title: <%= "All #{plural_name}".gootra(@loc) %>
      new: <%= "New #{file_name}".gootra(@loc) %>
      index: <%= "All #{plural_name}".gootra(@loc) %>
    edit:
      title: <%= "Edit #{file_name}".gootra(@loc) %>
    new:
      title: <%= "New #{file_name}".gootra(@loc) %>
