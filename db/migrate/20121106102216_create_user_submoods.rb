class CreateUserSubmoods < ActiveRecord::Migration
  def change
    create_table :user_submoods do |t|
      t.integer :user_id
      t.integer :sub_mood_id

      t.timestamps
    end
  end
end
