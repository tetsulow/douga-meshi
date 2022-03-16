class RenameNameToGenreNameInGenres < ActiveRecord::Migration[6.1]

  def up
    rename_column :genres, :name, :genre_name
  end

  def down
    rename_column :genres, :genre_name, :name
  end

end
