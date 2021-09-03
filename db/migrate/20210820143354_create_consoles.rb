class CreateConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :consoles do |t|
      t.string :description
      t.string :acronym
      t.string :url_image

      t.timestamps
    end
  end
end
