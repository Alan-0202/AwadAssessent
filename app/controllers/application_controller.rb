class ApplicationController < ActionController::Base

  def no_coins
    raise ActionController::RoutingError.new('No Coins')
  rescue
    render_230
  end

  def render_230
    render file: "#{Rails.root}/public/230"
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404"
  end

end
