require "./connect_db.rb"

connect_db!

# `force: true` will drop the existing table and create a new one
# shouldn't be preferred in production

# for production `if_not_exists: true`
ActiveRecord::Migration.create_table(:todos, force: true) do |t|
  t.column :todo_text, :text
  t.column :due_date, :date
  t.column :completed, :bool
end
