class RenameTitleToNameInServices < ActiveRecord::Migration
  def change
    rename_column :services, :title, :name
  end
end
