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