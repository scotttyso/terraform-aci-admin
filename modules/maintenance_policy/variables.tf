variable "admin_state" {
  description = "Maintenance Policy Admin State.  Options are triggered or untriggered.  Default is untriggered"
  type        = string
  default     = "untriggered"
  validation {
    condition     = (can(regexall("^(triggered|untriggered)$", var.admin_state)))
    error_message = "The admin_state options are triggered or untriggered."
  }
}

variable "admin_notify" {
  description = "Maintenance Policy Admin Notification.  Options are notifyAlwaysBetweenSets, notifyNever, or notifyOnlyOnFailures.  Default is notifyOnlyOnFailures"
  type        = string
  default     = "notifyOnlyOnFailures"
  validation {
    condition     = (can(regexall("^(notifyAlwaysBetweenSets|notifyNever|notifyOnlyOnFailures)$", var.admin_notify)))
    error_message = "The admin_notify options are triggered or notifyAlwaysBetweenSets, notifyNever, or notifyOnlyOnFailures."
  }
}

variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A description for the Maintance Policy."
  type        = string
  default     = ""
}

variable "graceful" {
  description = "This option will enable Graceful Insertion and Removal mode.  Options are yes or no.  Default is no."
  type        = string
  default     = "no"
  validation {
    condition     = (var.graceful == "yes" || var.graceful == "no")
    error_message = "The graceful options are yes or no."
  }
}

variable "ignore_compatability" {
  description = "A property for specifying whether compatibility checks should be ignored when applying the firmware policy.  Options are yes or no.  Default is no."
  type        = string
  default     = "no"
  validation {
    condition     = (var.ignore_compatability == "yes" || var.ignore_compatability == "no")
    error_message = "The ignore_compatability options are yes or no."
  }
}

variable "name" {
  description = "The Maintenance Policy name."
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "run_mode" {
  description = "Maintenance Policy Admin Notification.  Options are pauseAlwaysBetweenSets, pauseNever, or pauseOnlyOnFailures.  Default is pauseOnlyOnFailures"
  type        = string
  default     = "pauseOnlyOnFailures"
  validation {
    condition     = (can(regexall("^(pauseAlwaysBetweenSets|pauseNever|pauseOnlyOnFailures)$", var.run_mode)))
    error_message = "The admin_notify options are triggered or pauseAlwaysBetweenSets, pauseNever, or pauseOnlyOnFailures."
  }
}

variable "sw_version" {
  description = "The firmware version."
  type        = string
  default     = "n9000-14.2(5k)"
}

variable "version_check_override" {
  description = "A property for specifying whether the firmware upgrade should be triggered or not.  Options are trigger, trigger-immediate, triggered or untriggered.  Default is untriggered."
  type        = string
  default     = "untriggered"
  validation {
    condition     = (can(regexall("^(trigger|trigger-immediate|triggered|untriggered)$", var.version_check_override)))
    error_message = "The version_check_override options are trigger, trigger-immediate, triggered or untriggered."
  }
}

