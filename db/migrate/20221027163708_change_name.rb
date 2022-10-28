class ChangeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :postscounter, :posts_counter
  end
end
