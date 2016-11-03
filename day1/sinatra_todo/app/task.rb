class Task
  attr_reader :id, :created_at, :name
  @@current_id = 1

  def initialize(args)
    @name = args
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