class AddJsonColumnPlace < ActiveRecord::Migration
  def change
    add_column :places, :google_result, :json
  end
end
