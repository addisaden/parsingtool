class AddShortToServices < ActiveRecord::Migration
  def change
    add_column :services, :short, :string
  end
end
