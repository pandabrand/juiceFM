module JuiceFm
  module Models
    class Inventory
      include Mongoid::Document
      include Mongoid::Timestamps

      embedded_in :product
      
      field :qty, type: Integer
      validates :qty, presence: true
    end
  end
end
