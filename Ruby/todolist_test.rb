require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'byebug'
require 'simplecov'
SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todos)
  end

  def test_to_a
      assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    list_shift = @list.shift
    assert_equal(@todos.first, list_shift)
    assert_equal([@todo2,@todo3],@list.to_a)
  end

  def test_pop
    list_pop = @list.pop
    assert_equal(@todos.last, list_pop)
    assert_equal([@todo1,@todo2],@list.to_a)
  end

  def test_done_question
     assert_equal(false,@list.done?)
  end

  def test_raise_type_error
    assert_raises(TypeError){@list.add(1)}
    assert_raises(TypeError){@list.add('hi')}
  end

  def test_alias_add
    @todos << Todo.new("Read")
    @list << @todos.last
    assert_includes(@list.to_a,@todos.last)
    assert_equal(@todos, @list.to_a)
  end

  def test_raise_index_error
    assert_raises(IndexError){@list.item_at(100)}
  end

  def test_item_at
    assert_equal(@todos.first,@list.item_at(0))
    assert_equal(@todos.last,@list.item_at(@list.size-1))
  end

  def test_mark_done_at
    assert_raises(IndexError){@list.mark_done_at(100)}
    @todos.first.done!
    assert_equal(@todos.first.done?,@list.first.done?)
    @todos[2].done!
    assert_equal(@todos[2].done?,@list.item_at(2).done?)
    assert_equal(@todos[1].done?,@list.item_at(1).done?)
    assert_equal(false,@list.item_at(1).done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError){@list.mark_undone_at(100)}
    @todos.first.undone!
    assert_equal(@todos.first.done?,@list.first.done?)
    @todos[2].undone!
    assert_equal(@todos[2].done?,@list.item_at(2).done?)
    assert_equal(@todos[1].done?,@list.item_at(1).done?)
    assert_equal(false,@list.item_at(1).done?)
  end

  def test_done_all
    @list.done!
    @list.each do |each_todo|
      assert_equal(true,each_todo.done?)
    end
    @todos.each do |each_todo|
      assert_equal(true,each_todo.done?)
    end
  end

  def test_remove_at
    assert_raises(IndexError){@list.remove_at(100)}
    @list.remove_at(@list.size - 1 )
    @todos.pop
    test_to_a
    @list.mark_all_done
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
       ---- Today's Todos ----
       [ ] Buy milk
       [ ] Clean room
       [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
       ---- Today's Todos ----
       [X] Buy milk
       [ ] Clean room
       [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
       ---- Today's Todos ----
       [X] Buy milk
       [X] Clean room
       [X] Go to gym
    OUTPUT

    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    each_todos = []

    @list.each do |each_todo|
      each_todos << each_todo
    end
    assert_equal(@todos,each_todos)
    assert_equal(@todos.size,each_todos.size)
    assert_equal(@todos.first,each_todos.first)
    assert_equal(@todos.last,each_todos.last)
    assert_equal(@list,@list.each{ |_| nil})
    assert_equal(@list.object_id,@list.each{|_| nil}.object_id)
  end

  def test_select
    refute_equal(@list.object_id,@list.select{|_| true}.object_id)
    @todos.first.done!
    @list.mark_done_at(0)
    assert_equal(@todos.first,@list.select(&:done?).first)
    assert_equal(TodoList.new(@list.title).add(@todos.first).to_s,@list.select(&:done?).to_s)
  end
end
