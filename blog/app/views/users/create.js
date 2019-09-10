<% if user.errors.any? %>
<div id="error_explanation">
  <h2><%= pluralize(user.errors.count, "error") %> prohibited this user from being saved:</h2>

  <ul>
    <% user.errors.full_messages.each do |message| %>
      <li><%= message %></li>
    <% end %>
  </ul>
</div>
<% end %>