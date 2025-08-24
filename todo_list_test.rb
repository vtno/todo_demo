require "minitest/autorun"
require_relative "todo_list"

class TodoListTest < Minitest::Test
  def test_initialize_with_empty_list
    todo = TodoList.new
    assert_equal [], todo.tasks
  end

  def test_add_adds_item_to_todo_list
    todo = TodoList.new
    todo.add("Buy milk")
    assert_equal [{ "title" => "Buy milk", "done" => false }], todo.tasks
  end

  def test_delete_deletes_item_from_todo_list
    todo = TodoList.new
    todo.add("Buy milk")
    todo.add("Buy car")
    assert_equal [{ "title" => "Buy milk", "done" => false }, { "title" => "Buy car", "done" => false }], todo.tasks

    todo.delete(0)
    assert_equal [{ "title" => "Buy car", "done" => false }], todo.tasks
  end

  def test_done_marks_item_as_done
    todo = TodoList.new
    todo.add("Buy milk")
    todo.done(0)
    assert_equal [{ "title" => "Buy milk", "done" => true }], todo.tasks
  end
end
