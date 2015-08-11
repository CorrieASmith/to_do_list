require('rspec')
require('to_do_list')

describe(Task) do
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
end
