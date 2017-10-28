class AddImgToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :img, :string
  end
end
