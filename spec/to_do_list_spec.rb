require('rspec')
require('to_do_list')
require('pry')

describe(Task) do

  before() do
    Task.clear()
  end

  describe('#description') do
    it('properly stores added to_do_list item') do
      test_task = Task.new("Go To School")
      expect(test_task.description()).to(eq("Go To School"))
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves new task with save method") do
      test_task = Task.new("Go To School")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it("empties all of the saved tasks") do
      Task.new("Go To School")
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#delete') do
    it("deletes single task with delete method") do
      test1 = Task.new("Go To School")
      test1.save()
      test2 = Task.new("Walk The Dog")
      test2.save()
      Task.delete(1)
      expect(Task.all().at(0).description()).to(eq("Go To School"))
    end
  end

  describe('#completed') do
    it("checks if a single task is completed") do
      test_completed = Task.new("Eat Lunch")
      test_completed.completed()
      test_completed.save()
      expect(Task.all().at(0).completed?()).to(eq(true))
    end
  end
end
