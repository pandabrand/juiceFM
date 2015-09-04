module JuiceFm
  module Models
    class User
      include Mongoid::Document
      include Mongoid::Timestamps
      include BCrypt

      before_create :hash_password

      field :first_name,  type:  String
      field :last_name,   type:  String
      field :email,       type:  String
      field :is_admin,    type:  Boolean
      field :address_one, type:  String
      field :address_two, type:  String
      field :phone,       type:  String
      field :city,        type:  String
      field :zip,         type:  String
      field :state,       type:  String
      field :password,    type:  String

      validates :email, :phone, uniqueness: true
      validates :first_name, :last_name, :email, :address_one, :city, :state, :zip, :phone, presence: true
      validates :email, confirmation: true, format: { with: /@/, message: "Please use a valid email address"}
      validates :zip, zip_code: true
      validates :password, confirmation: true, length: {in: 6..20}

      def hash_password
        self.password = Password.create self.password, cost: 5
      end

      def authenticate(attempted_password)
        if self.password == Password.create( attempted_password, cost: 6 )
          true
        else
          false
        end
      end
      
    end
  end
end
