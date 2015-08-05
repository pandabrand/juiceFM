module JuiceFm
  module Models
    class Product
      include Mongoid::Document
      include Mongoid::Timestamps

      embeds_many :inventories

      field :name
      field :ingredient,   type: Array, localize: true
      field :description, localize: true
      field :price,        type: BigDecimal
      field :type, localize: true
      field :category, localize: true

      validates :name, uniqueness: true
      validate :name, :ingredient, :description, :price, :type, :category, presence: true

    end
  end
end
