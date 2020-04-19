FactoryGirl.define do
  factory :stock_item, class: Spree::StockItem do
    backorderable true
    stock_location
    track_inventory true
    variant

    after(:create) { |object| object.adjust_count_on_hand(10) }
  end
end
