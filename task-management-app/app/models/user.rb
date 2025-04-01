class User < ApplicationRecord
    has_secure_password
    validates :password, length: { minimum: 12 }, allow_nil: true
    
    # Password complexity requirements
    validate :password_complexity

    private

    def password_complexity
        return if password.blank?

        unless password.match?(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])./)
            errors.add :password, 'must include at least one lowercase letter, one uppercase letter, one digit, and one special character'
        end
    end
end
