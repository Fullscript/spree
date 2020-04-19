class MoveTrackInventoryFromVariantToStockItem < ActiveRecord::Migration
  def up
    add_column :spree_stock_items, :track_inventory, :boolean, :default => true
    Spree::StockItem.unscoped.find_each do |si|
      variant = Spree::Variant.select('id, track_inventory').find(si.variant_id)
      si.update_column :track_inventory, si.variant.track_inventory
    end
    remove_column :spree_variants, :track_inventory
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
