class Task

  @@all_tasks = []

  define_method(:initialize) do |description, completed=false|
    @description = description
    @completed = completed
  end

  define_method(:description) do
    @description
  end

  define_method(:completed?) do
    @completed
  end

  define_method(:completed) do
    if @completed
      @completed = false
    else
      @completed = true
    end
  end

  define_singleton_method(:all) do
    @@all_tasks
  end

  define_method(:save) do
    @@all_tasks.push(self)
  end

  define_singleton_method(:clear) do
    @@all_tasks = []
  end

  define_singleton_method(:delete) do |index|
    @@all_tasks.delete_at(index)
  end
end
