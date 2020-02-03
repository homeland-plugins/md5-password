# frozen_string_literal: true

require "digest/md5"

class User
  # Override valid_password? method for compatible with MD5
  def valid_password?(password)
    super
  rescue BCrypt::Errors::InvalidHash
    valid_md5_password?(password)
  end

  private

    def valid_md5_password?(password)
      Digest::MD5.hexdigest(Setting.md5_password_format.sub("${password}", password)) == self.encrypted_password
    end
end

class Setting
  field :md5_password_format, default: "${password}"

  class << self
    def editable_keys
      EDITABLE_KEYS + %w[md5_password_format]
    end
  end
end
