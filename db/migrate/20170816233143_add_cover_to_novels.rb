class AddCoverToNovels < ActiveRecord::Migration[5.1]
  def change
    add_column :novels, :cover, :string
  end
end
