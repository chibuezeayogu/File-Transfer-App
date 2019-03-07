# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :require_valid_user!, only: :index

  def index; end
end
