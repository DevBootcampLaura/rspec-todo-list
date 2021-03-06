class List
  attr_reader :title, :tasks

  def initialize(title, tasks = [])
    @title = title
    @tasks = tasks
  end

  def add_task(task)
    tasks << task
  end

  def complete_task(index)
    if tasks[index]
      tasks[index].complete!
      true
    else
      false
    end
  end

  def delete_task(index)
    if tasks[index]
      tasks.delete_at(index)
      true
    else
      false
    end
  end

  def completed_tasks
    tasks.select { |task| task.complete? }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete? }
  end
end
