class TodoList < ApplicationRecord
    has_many :todo_items

    def items
        self.todo_items | self.todo_items.map(&:items).flatten
    end
end
