class CreateCategoriesProductsJoin < ActiveRecord::Migration[5.0]
  def change
    create_table 'categories_products', :id => false do |t|
    	 t.column :category_id, :integer
    	 t.column :product_id, :integer
    end
  end
end
