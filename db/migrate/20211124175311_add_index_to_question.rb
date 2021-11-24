class AddIndexToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_index :questions, :author_id
  end
end
