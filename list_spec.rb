require "rspec"

require_relative "list"
require_relative "task"

describe List do
  let(:task1){Task.new("Task 1")}
  let(:task2){Task.new("Task 2")}
  let(:task3){Task.new("Task 3")}
  let(:list){
    List.new("List Test",[task1,task2,task3])
  }

  describe "#initialize" do
    it "creates a new list" do
      expect(list).to be_a_kind_of(List)
    end

    it "title returns the title" do
      expect(list.title).to eq("List Test")
    end

    it "tasks returns the tasks" do
      expect(list.tasks).to eq([task1,task2,task3])
    end
  end

  describe "#add_task" do
    it "adds a task to the list's task array" do
      expect{list.add_task(Task.new("Task 4"))}.to change{list.tasks.length}.by(1)
    end
  end

  describe "#complete_task" do
    it "changes the complete status of the task from false to true" do
      list.complete_task(0)
      expect(list.tasks[0].complete?).to eq(true)
    end

    it "returns false if task index does not exist" do
      expect(list.complete_task(7)).to eq(false)
    end
  end

  describe "#delete_task" do
    it "removes a task from the list's task array" do
      expect{list.delete_task(1)}.to change{list.tasks.length}.by(-1)
    end

    it "returns false if task index does not exist" do
      expect(list.delete_task(7)).to eq(false)
    end
  end

  describe "#completed_tasks" do
    it "returns a list of completed tasks" do
      list.complete_task(1)
      list.complete_task(2)
      expect(list.completed_tasks).to eq([list.tasks[1], list.tasks[2]])
    end
  end

  describe "#incomplete_tasks" do
    it "returns a list of tasks that are incomplete" do
      list.complete_task(1)
      expect(list.incomplete_tasks).to eq([list.tasks[0], list.tasks[2]])
    end
  end

end
