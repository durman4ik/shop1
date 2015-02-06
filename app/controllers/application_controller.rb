class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

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
