class CreateSashes < ActiveRecord::Migration[4.2]
  def change
    create_table :sashes do |t|
      t.timestamps null: false
    end
  end
end
