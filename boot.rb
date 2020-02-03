# frozen_string_literal: true

require_relative "./lib/md5_password"

Homeland.register_plugin do |s|
  s.name = "md5-password"
  s.display_name = "MD5 Password"
  s.description = "让用户系统验证密码兼容 MD5 加密方式，新的密码修改会用 Bcrypt，以此兼容一些 MD5 的系统迁移。"
  s.version = "0.1.0"
end
