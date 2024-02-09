# Feature: Admin Dashboard Counts
# Instruction
# Implement the following feature:

# The admin dashboard page is currently just a place holder, providing no value to admins.

# Replace the text on the dashboard page with these general stats about the store:

# Display a count of how many products are in the database
# Display a count of how many categories are in the database
# Tips
# We could use AR models to query the database directly from the ERB views. However a better, more MVC approach to this is to let the controller fetch the data and pass it to the template. In other words, set instance variables in the controller action with values, and then render those instance variables in the ERB template
# Stretch
# Try to make it look nice, using Bootstrap 5 elements.
# Link to the product admin list/index pages when displaying the counts.

class Admin::DashboardController < ApplicationController
  before_action :authenticate

  def show
    @products_count = Product.count
    @categories_count = Category.count
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end or handle_unauthorized_access
  end

end
