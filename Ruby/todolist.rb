require_relative 'todo'
require 'byebug'

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    Array(todo).each do |each_todo|
      raise TypeError, 'can only add Todo objects' unless each_todo.instance_of? Todo
      @todos << each_todo
    end
    self
  end

  alias_method :<<, :add

  def done!
    @todos.each_index { |indx| mark_done_at(indx) }
  end

  def done?
    @todos.all?(&:done?)
  end

  def size
    @todos.size
  end

  def first
   @todos.first
  end

  def last
   @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def select
    result = TodoList.new(title)

    each do |each_todo|
      result << each_todo if yield each_todo
    end
    result
  end

  def each
    counter = 0
    while counter < size
      yield item_at(counter)
      counter += 1
    end
    self
  end

  def find_by_title(todo_title)
    each do |each_todo|
      return each_todo if each_todo.title == todo_title
    end
    nil
  end

  def all_done
    select(&:done?)
  end

  def -(todo_list)
    TodoList.new(title).add(self.to_a - todo_list.to_a)
  end

  def all_not_done
    self - all_done
  end

  def mark_done(todo_title)
    find_by_title(todo_title) && find_by_title(todo_title).done!
  end

  def mark_all_undone
    each(&:undone!)
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
      @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    text =  "---- Today's Todos ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end
end
