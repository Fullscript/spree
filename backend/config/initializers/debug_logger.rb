module DebugLogger
  DEBUG_LOGGER_PATH = "#{Rails.root}/log/hw_spree_debug.log"

  def self.log order, action: nil, package_count: nil, completed_at: nil, **extra
    shipment_ids = order.shipments.pluck(:id)
    hash = {
      order_id: order.id,
      order_state: order.state,
      shipment_ids: shipment_ids,
      shipment_count: shipment_ids.count,
      t: Time.now.utc.iso8601
    }
    hash.merge!(action: action, package_count: package_count, completed_at: completed_at)
    hash.merge!(extra)

    logger.log "#{hash.to_json}"
  end

  def self.logger
    @@logger ||= Logger.new(DEBUG_LOGGER_PATH)
  end
end
