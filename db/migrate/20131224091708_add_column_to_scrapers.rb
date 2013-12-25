class AddColumnToScrapers < ActiveRecord::Migration
  def change
    add_column :scrapers, :current_companies, :text
  end
end
