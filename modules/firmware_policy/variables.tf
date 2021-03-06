variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "description" {
  description = "A description for the Firmware Policy."
  type        = string
  default     = ""
}

variable "effective_on_reboot" {
  description = "A property that indicates if the selected firmware version will be active after reboot. The firmware must be effective on an unplanned reboot before the scheduled maintenance operation.  Options are yes or no.  Default is no."
  type        = string
  default     = "no"
  validation {
    condition     = (var.effective_on_reboot == "yes" || var.effective_on_reboot == "no")
    error_message = "The effective_on_reboot options are yes or no."
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
  description = "The firmware policy name."
  type        = string
  default     = "default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "sw_version" {
  description = "The firmware version."
  type        = string
  default     = "n9000-14.2(5k)"
}

variable "version_check_override" {
  description = "A property for specifying whether the firmware upgrade should be triggered or not.  Options are trigger, trigger-immediate or untriggered.  Default is untriggered."
  type        = string
  default     = "untriggered"
  validation {
    condition     = (can(regexall("^(trigger|untriggered|trigger-immediate)$", var.version_check_override)))
    error_message = "The version_check_override options are trigger, untriggered, trigger-immediate."
  }
}

