require_relative "../app/sinatra_todo.rb"

describe Task do

  before(:all) do
    @task1 = Task.new("walk the dog")
    @task2 = Task.new("Make the dinner")
  end

  describe 'check uniques IDs' do
    it 'index 1 for first task' do
      expect(@task1.id).to eq(1)
    end
    it 'index for task 2' do
      expect(@task2.id).to eq(2)
    end
  end

  describe '.complete?' do
    it 'should return false for a new method' do
      expect(@task1.complete?).to be false
    end
  end

  describe '.complete!' do
    it 'change the instance status to true' do
      expect(@task1.complete!).to be true
    end
    it 'when complete! complete? = true' do
      expect(@task1.complete?).to be true
    end
  end

  describe '.make_incomplete!' do
    it 'on init retrun false' do
      expect(@task2.make_incomplete!).to be false   
    end
    it 'return false even if you apply the complete! method before' do
      expect(@task1.make_incomplete!).to be false
    end
  end

  describe '.updated_at' do
    it 'on initialize update_at should be nil' do
      expect(@task1.updated_at).to be_falsy
    end
  end

  describe '.update_content!' do
    it 'actualize the updated_at attr to the current time' do
      @task1.update_content!
      expect(@task1.updated_at.class).to be_a(Time.class)
    end
  end
end

describe TodoList do
  before(:all) do
    @user = "Carlos"
    @todo_list = TodoList.new(@user)
    @dog_task = Task.new("walk the dog")
    @cat_task = Task.new("walk the cat")
    @dishes_task = Task.new("wash your dishes")
    @todo_list.add_task(@cat_task)
    @todo_list.add_task(@dog_task)
    @todo_list.add_task(@dishes_task)
  end

  describe '.initialize' do
    it 'with an empty array' do
      expect(TodoList.new("Carlos").tasks).to eq([])
    end  
    it 'propertie user is the inialize param' do
      expect(@todo_list.user).to eq(@user)
      end  
  end

  describe '.add_task' do
    it 'fills the tasks array' do
      @todo_list.add_task(@dog_task)
      expect(@todo_list.tasks).to include(@dog_task)
    end
  end

  describe '.delete_task' do
    it 'delete a task by index' do
      @todo_list.delete_task(@dog_task.id)
      expect(@todo_list.tasks).not_to include(@dog_task)
    end 
  end

  describe '.find_task_by_id' do
    it 'returns al element from the todolist tasks by ID' do
      @todo_list.add_task(@dog_task)
      expect(@todo_list.find_task_by_id(@dog_task.id)).to eq(@dog_task)
    end

    it 'returns nil if there are no match' do
      expect(@todo_list.find_task_by_id(200)).to eq(nil)
    end
  end

  describe '.sort_by_created' do
    before(:all) do
      @todo_list_to_order = TodoList.new("Charlie")
      @todo_list_to_order.add_task(@dog_task)
      @todo_list_to_order.add_task(@cat_task)
      @todo_list_to_order.add_task(@dishes_task)
      @first_created = @todo_list_to_order.tasks[0]
      @todo_list_to_order.sort_by_created  
    end
    it 'order tasks by date no params' do
      expect(@first_created).to eq( @todo_list_to_order.tasks[-1]) 
    end

    it 'order tasks by older first if params="DESC"' do
      @todo_list_to_order.sort_by_created("DESC")
      expect(@first_created).to eq( @todo_list_to_order.tasks[0]) 
    end
  end
end


















