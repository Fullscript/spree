require 'spec_helper'

module Spree
  module Stock
    describe Coordinator do
      let!(:order) { create(:order_with_line_items) }

      subject { Coordinator.new(order) }

      context "packages" do
        it "builds, prioritizes and estimates" do
          expect(subject).to receive(:build_packages).and_call_original
          expect(subject).to receive(:prioritize_packages).and_call_original
          expect(subject).to receive(:estimate_packages).and_call_original
          subject.packages
        end
      end

      context "build packages" do
        it "builds a package for every stock location" do
          subject.packages.count == StockLocation.count
        end

        context "missing stock items in stock location" do
          let!(:another_location) { create(:stock_location, propagate_all_variants: false) }

          it "builds packages only for valid stock locations" do
            subject.build_packages.count.should == (StockLocation.count - 1)
          end
        end
      end
    end
  end
end
