class AddConsoleTypestoConsoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :consoles, :console_type, foreign_key: true
  end
end
