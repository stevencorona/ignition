class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :theme
      t.text :description
      t.string :state
      t.date :starting_at
      t.date :ending_at
      t.timestamps null: false
    end
  end
end
