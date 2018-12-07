require './lib/vending_machine_position.rb'
require 'json'
require 'pry'

class VendingMachine
  attr_reader :contents

  def initialize(contents_file)
    @contents = set_contents_from_json(contents_file)
  end

  def print_contents
    @contents.each do |c|
      puts "Location #{c.location}: #{c.items.join(", ")} "
    end
  end


  private

  def set_contents_from_json(file)
    read_file = File.read(file)
    contents_hash = JSON.parse(read_file)
    @contents = contents_hash["contents"][0].map do |item|
      a = VendingMachinePosition.new({location: item[0],
                                cost: item[1]["cost"],
                                capacity: item[1]["capacity"],
                                items: get_item_names(item[1]["contents"])
      })
    end
  end

  def get_item_names(item_hashes)
    item_hashes.map do |item_hash|
      item_hash["type"]
    end
  end
end
