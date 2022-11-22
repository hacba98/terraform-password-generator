# module to generate long random string with special characters
# suitable for password
module "random_string" {
  source                    = "./modules/generator"
  password_strength         = 32
  password_special          = true
  password_override_special = "@$%!^+_-="
}
