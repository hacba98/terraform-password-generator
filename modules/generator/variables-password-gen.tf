variable "password_strength" {
  description = "Number of characters of the password"
  type        = number
  default     = 16
}

variable "password_special" {
  description = "(Optional) Allow the password to contain special characters"
  type        = bool
  default     = false
}

variable "password_override_special" {
  description = "(Optional) List of allowed special characters. Is required if password_special = true"
  type        = string
  default     = "@!#$_-=+"

  # Validate the list of special characters
  validation {
    condition     = var.password_override_special != null && length(var.password_override_special) > 0
    error_message = "Allow special characters but no list of special characters provided."
  }
}
