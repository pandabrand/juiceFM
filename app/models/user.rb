module JuiceFm
  module Models
    class User
      include Mongoid::Document
      include Mongoid::Timestamps
      field :first_name,  type:  String
      field :last_name,   type:  String
      field :email,       type:  String
      field :is_admin,    type:  Boolean
      field :address_one, type:  String
      field :address_two, type:  String
      field :phone,       type:  String
      field :city,        type:  String
      field :zip,         type:  Integer
      field :state,       type:  String
    end
  end
end
