require "json"

class TodoList
  attr_reader :tasks

  def initialize
    @tasks = load
  end

  def add(item)
    @tasks << { "title" => item, "done" => false }
    save
  end

  def done(index)
    @tasks[index]["done"] = true
    save
  end

  def delete(index)
    @tasks.delete_at(index)
    save
  end

  private

  def save = File.write("tasks.json", JSON.pretty_generate(@tasks))
  def load
    if File.exist?("tasks.json")
      JSON.parse(File.read("tasks.json"))
    else
      []
    end
  rescue JSON::ParserError
    []
  end
end
