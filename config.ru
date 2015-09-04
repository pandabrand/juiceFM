require './app'

use Warden::Manager do |config|
  config.serialize_into_session{|user| user.id}
  config.serialize_from_session{|id| User.get(id)}
  config.scope_defaults :default, strategies: [:password], action: 'auth/unauthenticated'
  config.failure_app = self
end

Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

Warden::Strategies.add(:password) do
  def valid?
    params['user']['email'] && ['user']['password']
  end

  def authenticate!
    user = User.first(username: params['user']['email'])

    if user.nil?
      throw(:warden, message: "The email you entered does not exist.")
    elsif user.authenticate(params['user'][password])
      sucess!(user)
    else
      throw(:warden, message: "Wrong username and password combination.")
    end
  end
end


map "/fonts" do
  run Rack::Directory.new("./app/assets/fonts")
end


run JuiceFm::App
