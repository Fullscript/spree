module Spree
  module Stock
    class Quantifier
      attr_reader :stock_items

      def initialize(variant)
        @variant = variant
        @stock_items = Spree::StockItem.joins(:stock_location).where(:variant_id => @variant, Spree::StockLocation.table_name =>{ :active => true})
      end

      def total_on_hand
        if !Spree::Config.track_inventory_levels || stock_items.any? {|si| !si.track_inventory? }
          Float::INFINITY
        else
          stock_items.sum(:count_on_hand)
        end
      end

      def backorderable?
        stock_items.any?(&:backorderable)
      end

      def can_supply?(required)
        total_on_hand >= required || backorderable?
      end

    end
  end
end
