class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.string :headline
      t.text :body

      t.timestamps
    end
  end
end
