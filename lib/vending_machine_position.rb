class VendingMachinePosition
  attr_reader :location,
              :cost,
              :capactiy,
              :items

  def initialize(args)
    @location = args[:location]
    @cost = args[:cost]
    @capacity = args[:capacity]
    @items = args[:items]
  end

end
