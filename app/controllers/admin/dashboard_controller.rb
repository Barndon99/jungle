class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except:

  def show
  end
end
