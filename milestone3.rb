require "date"

class Todo
  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..
  def initialize(text,date,completed)
     @text=text
     @due_date=date
     @completed=completed
  end
  def overdue?
     @due_date<Date.today
  end
  def due_today?
     @due_date==Date.today
  end
  def due_later?
     @due_date>Date.today
  end
  def to_displayable_string
    # FILL YOUR CODE HERE
    string="[]"
    if @completed
       string="[X]"
    end
    if @due_date==Date.today
       string=string+" #{@text} "
       return string
    end
    string=string+" #{@text} "
    string=string+" #{@due_date} "
    return string
  end
end

class TodosList 
  def initialize(todos)
    @todos = todos
  end

  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end  

  # ..
  # ..
  # FILL YOUR CODE HERE
  # ..
  # ..
  def add(todo_s)
     @todos.push(todo_s)
  end
  def due_today
     TodosList.new(@todos.filter { |todo| todo.due_today? })
  end
  def due_later
     TodosList.new(@todos.filter { |todo| todo.due_later? })
  end
  def to_displayable_list
    # FILL YOUR CODE HERE
    to_displayable_list=@todos.map { |todo| todo.to_displayable_string}
    to_displayable_list.join("\n")
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"
