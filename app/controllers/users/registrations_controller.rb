#deviseのregistrationコントローラーを継承
#class Users::RegistrationsController < Devise::RegistrationsControllerとすることで、Devise::RegistrationsControllerを継承しています。
class Users::RegistrationsController < Devise::RegistrationsController
  #devise/registrations_controllerのbuild_resource(hash=nil)を上書き
  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end
end
