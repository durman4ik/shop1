class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  before_action :set_locale

  protect_from_forgery with: :exception

  private

  def set_locale
    if params[:locale].blank?
      redirect_to "/#{extract_locale}"
    else
      I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
      session[:locale] = I18n.locale
    end
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  def extract_locale
    browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].try(:scan, /^[a-z]{2}/).try(:first).try(:to_sym)
    if I18n.available_locales.include? browser_locale
      browser_locale
    else
      I18n.default_locale
    end
  end

end
