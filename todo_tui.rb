#!/usr/bin/env ruby
require_relative "todo_list"

class TodoTUI
  def initialize
    @list = TodoList.new
  end

  def run
    loop do
      clear_screen
      puts "=== Ruby Todo App (TUI) ==="
      puts
      list_tasks
      puts
      puts "1. Add Task"
      puts "2. Mark Task as Done"
      puts "3. Delete Task"
      puts "4. Quit"
      print "> "

      case gets.chomp
      when "1" then add_task
      when "2" then mark_done
      when "3" then delete_task
      when "4" then break
      else
        puts "Invalid choice. Press Enter..."
        gets
      end
    end
  end

  private

  def list_tasks
    if @list.tasks.empty?
      puts "No tasks yet!"
    else
      @list.tasks.each_with_index do |t, i|
        status = t["done"] ? "[x]" : "[ ]"
        puts "#{i + 1}. #{status} #{t["title"]}"
      end
    end
  end

  def add_task
    print "Enter task name: "
    title = gets.chomp
    @list.add(title)
  end

  def mark_done
    print "Enter task number to mark as done: "
    @list.done(gets.to_i - 1)
  end

  def delete_task
    print "Enter task number to delete: "
    @list.delete(gets.to_i - 1)
  end

  def clear_screen
    system("clear") || system("cls")
  end
end

TodoTUI.new.run
