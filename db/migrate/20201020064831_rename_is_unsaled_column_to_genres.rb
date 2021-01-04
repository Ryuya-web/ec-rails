class RenameIsUnsaledColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :is_unsaled, :is_valid
  end
end
