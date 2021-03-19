class CreateJapps < ActiveRecord::Migration[6.1]
  def change
    create_table :japps do |t|
      t.boolean :status
      t.timestamps
    end
  end
end
