class AddIpToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :ip, :string
  end
end
