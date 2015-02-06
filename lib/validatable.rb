module Devise
  module Models
    module Validatable

      skip validates_confirmation_of :password

      protected
      def password_required?
        !persisted? || !password.nil?
      end
    end
  end
end
