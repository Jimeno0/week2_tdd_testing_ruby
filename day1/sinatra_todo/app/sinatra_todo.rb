class Task
  attr_reader :id, :created_at
  @@current_id = 1

  def initialize(args)
    @task = args
    @id = @@current_id
    @status = false
    @created_at = Time.new
    @updated_at = nil
    @@current_id += 1
  end

  def complete?
    @status
  end

  def complete!
    @status = true
  end

  def make_incomplete!
    @status = false
  end

  def updated_at
    @updated_at
  end

  def update_content!
    @updated_at = Time.new
  end

end


class TodoList
  attr_reader :tasks, :user
  def initialize(user)
    @tasks = []
    @user = user
  end

  def add_task (task)
    @tasks.push(task)
  end

  def delete_task(id)
    @tasks.delete_if { |task| task.id == id}
  end

  def find_task_by_id(id)
    @tasks.select { |task| task.id == id } [0]
  end

  def sort_by_created (order = 'ASC')
    if order == 'DESC'
      @tasks.sort! { |a, b| a.created_at<=> b.created_at}  
    else
    @tasks.sort! { |a, b| b.created_at<=> a.created_at}  
    end
  end
end