module JuiceFm
  module Models
    class User
      include Mongoid::Document
      field :first_name, type: String
    end
  end
end
