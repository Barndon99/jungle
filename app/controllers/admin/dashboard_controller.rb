class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except:

  def show
    @Category_count = Category.select(:categories).count
    @Product_count = Product.select(:products).count
  end
end
