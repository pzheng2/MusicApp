class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, presence: true

      t.timestamps
    end
  end
end
