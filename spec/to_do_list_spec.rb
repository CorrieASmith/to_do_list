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
end
