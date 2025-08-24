#!/usr/bin/env ruby
require_relative "todo_list"

list = TodoList.new
cmd, *args = ARGV

case cmd
when "list"
  if list.tasks.empty?
    puts "No tasks yet!"
  else
    list.tasks.each_with_index do |t, i|
      status = t["done"] ? "[x]" : "[ ]"
      puts "#{i + 1}. #{status} #{t["title"]}"
    end
  end

when "add"
  title = args.join(" ")
  if title.empty?
    warn "Usage: ruby todo_cli.rb add <task name>"
    exit 1
  end
  list.add(title)
  puts "Added: #{title}"

when "done"
  index = args.first.to_i - 1
  list.done(index)
  puts "Marked done: #{list.tasks[index]["title"]}" if index >= 0

when "delete"
  index = args.first.to_i - 1
  if index >= 0 && index < list.tasks.size
    removed = list.tasks[index]["title"]
    list.delete(index)
    puts "Deleted: #{removed}"
  else
    warn "Invalid task number"
  end

else
  puts <<~USAGE
    Usage:
      ruby todo_cli.rb list
      ruby todo_cli.rb add "Task name"
      ruby todo_cli.rb done <task number>
      ruby todo_cli.rb delete <task number>
  USAGE
end
