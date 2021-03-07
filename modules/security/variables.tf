variable "annotation_aaaBlock" {
  description = "Annotation for the Lockout Policy.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "annotation_aaaPwd" {
  description = "Annotation for the Password Policy.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "lockout" {
  description = "A user who fails the login attempts too many times consecutively within a specified time period will become locked out for a specified time. The value can be:\n  * enable: A user will be locked out for failing to log in successfully too many times.\n  * disable: A user will not be locked out despite failing to log in.\nThe default is enable."
  type        = string
  default     = "enable"
  validation {
    condition     = (var.lockout == "enable" || var.lockout == "disable")
    error_message = "The lockout setting should be either enable or disable."
  }
}

variable "lockout_duration" {
  description = "The time period, in minutes, that a user will be locked out for having too many failed login attempts. The range is from 1 minutes to 1440 minutes. The default is 60 minutes."
  type        = number
  default     = 60
  validation {
    condition = (
      var.lockout_duration >= 1 &&
      var.lockout_duration <= 1440
    )
    error_message = "The lockout_duration should be between 1 and 1440."
  }
}

variable "lockout_max_failed_attempts" {
  description = "The number failed login attempts a user has before being locked out if Lockout User after multiple failed login attempts is set to Enable. The range is from 1 to 15. The default is 5."
  type        = number
  default     = 5
  validation {
    condition = (
      var.lockout_max_failed_attempts >= 1 &&
      var.lockout_max_failed_attempts <= 15
    )
    error_message = "The lockout_max_failed_attempts should be between 1 and 15."
  }
}

variable "lockout_time_period" {
  description = "The time period, in minutes, during which consecutive failed login attempts are counted for lockout purposes. The range is from 1 minutes to 720 minutes. The default is 5 minutes."
  type        = number
  default     = 5
  validation {
    condition = (
      var.lockout_time_period >= 1 &&
      var.lockout_time_period <= 720
    )
    error_message = "The lockout_time_period should be between 1 and 720."
  }
}

variable "pwd_change_count" {
  description = "The maximum number of times a locally authenticated user can change his or her password during the Change Interval. The range is from 0 to 10 changes. The default is 2."
  type        = number
  default     = 2
  validation {
    condition = (
      var.pwd_change_count >= 0 &&
      var.pwd_change_count <= 10
    )
    error_message = "The pwd_change_count should be between 0 and 10."
  }
}

variable "pwd_change_interval" {
  description = "The maximum number of hours over which the number of password changes specified in the Change Interval field are enforced. The range is from 1 to 745 hours. The default is 48.\n\nFor example, if this field is set to 48 and the Change Interval field is set to 2, a locally authenticated user can make no more than 2 password changes within a 48 hour period."
  type        = number
  default     = 48
  validation {
    condition = (
      var.pwd_change_interval >= 1 &&
      var.pwd_change_interval <= 745
    )
    error_message = "The pwd_change_interval should be between 1 and 745."
  }
}

variable "pwd_enforce_interval" {
  description = "Restricts the number of password changes a locally authenticated user can make within a given number of hours. The value can be:\n  * enable—The change interval policy is active.\n  * disable—The change count policy is active.\nThe default is enable."
  type        = string
  default     = "enable"
  validation {
    condition     = (var.pwd_enforce_interval == "enable" || var.pwd_enforce_interval == "disable")
    error_message = "The pwd_enforce_interval should be either enable or disable."
  }
}

variable "pwd_expiration_warn" {
  description = "A warning period (days) before password expiration. A warning will be displayed when a user logs in within this number of days of an impending password expiration. Valid value is between 0 and 30 days.  Default is 15."
  type        = number
  default     = 15
  validation {
    condition = (
      var.pwd_expiration_warn >= 0 &&
      var.pwd_expiration_warn <= 30
    )
    error_message = "The pwd_expiration_warn period should be between 0 and 30."
  }
}

variable "pwd_history" {
  description = "The number of unique passwords that a locally authenticated user must create before that user can reuse a previously used password. The range is from 0 to 15. The default is 5."
  type        = number
  default     = 5
  validation {
    condition = (
      var.pwd_history >= 0 &&
      var.pwd_history <= 15
    )
    error_message = "The pwd_history count should be between 0 and 15."
  }
}

variable "pwd_nochange_interval" {
  description = "A minimum period after a password change before the user can change the password again.  The default is 24 hours"
  type        = number
  default     = 24
  validation {
    condition = (
      var.pwd_nochange_interval >= 0 &&
      var.pwd_nochange_interval <= 745
    )
    error_message = "The pwd_nochange_interval interval should be between 0 and 745 hours."
  }
}

variable "pwd_strength_check" {
  description = "Cisco recommends using a strong password enforcement. The default value is true."
  type        = string
  default     = "yes"
  validation {
    condition     = (var.pwd_strength_check == "yes" || var.pwd_strength_check == "no")
    error_message = "The pwd_strength_check should be equal to either yes or no."
  }
}

variable "web_idle_timeout" {
  description = "The maximum amount of time that can elapse after the last refresh request before the APIC considers a web session as inactive. If this time limit is exceeded, the session is automatically terminated. The range is from 60 seconds to 65525 seconds. The default time is 1200 seconds."
  type        = number
  default     = 1200
  validation {
    condition = (
      var.web_idle_timeout >= 60 &&
      var.web_idle_timeout <= 65525
    )
    error_message = "The web_idle_timeout value should be between 60 and 65525 seconds."
  }
}

variable "webtoken_timeout" {
  description = "APIC uses web session limits to restrict the number of web sessions that a given user account is permitted to access at any one time. The range is from 300 seconds to 9600 seconds. The default is 600 seconds."
  type        = number
  default     = 600
  validation {
    condition = (
      var.webtoken_timeout >= 300 &&
      var.webtoken_timeout <= 9600
    )
    error_message = "The webtoken_timeout value should be between 300 and 9600 seconds."
  }
}

variable "webtoken_validity" {
  description = "The maximum number of concurrent web sessions allowed for each user. The default is 24 hours."
  type        = number
  default     = 24
  validation {
    condition = (
      var.webtoken_validity >= 4 &&
      var.webtoken_validity <= 24
    )
    error_message = "The webtoken_validity value should be between 4 and 24 hours."
  }
}

