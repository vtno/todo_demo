#!/usr/bin/env ruby
require "sinatra"
require_relative "todo_list"

list = TodoList.new

get "/" do
  @tasks = list.tasks
  erb :index
end

post "/add" do
  list.add(params[:title]) unless params[:title].to_s.strip.empty?
  redirect "/"
end

post "/done/:i" do
  list.done(params[:i].to_i)
  redirect "/"
end

post "/delete/:i" do
  list.delete(params[:i].to_i)
  redirect "/"
end

__END__

@@ index
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Ruby Todo</title>
  <style>
    body { font-family: sans-serif; margin: 2rem; }
    li { margin: .5rem 0; }
    form { display: inline; }
  </style>
</head>
<body>
  <h1>Todo List</h1>
  <ul>
    <% @tasks.each_with_index do |t, i| %>
      <li>
        <%= t["done"] ? "[x]" : "[ ]" %> <%= t["title"] %>
        <form action="/done/<%= i %>" method="post"><button>Done</button></form>
        <form action="/delete/<%= i %>" method="post"><button>Delete</button></form>
      </li>
    <% end %>
  </ul>
  <form action="/add" method="post">
    <input type="text" name="title" placeholder="New task">
    <button>Add</button>
  </form>
</body>
</html>
