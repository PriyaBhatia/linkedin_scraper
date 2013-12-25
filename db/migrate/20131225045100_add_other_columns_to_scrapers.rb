class AddOtherColumnsToScrapers < ActiveRecord::Migration
  def change
  	add_column :scrapers,:organizations,:text
  	add_column :scrapers,:education ,:text
		add_column :scrapers,:websites ,:text
		add_column :scrapers,:groups ,:text
		add_column :scrapers,:languages , :text
		add_column :scrapers,:certifications ,:text
		add_column :scrapers,:current_companies,:text
  end
end
