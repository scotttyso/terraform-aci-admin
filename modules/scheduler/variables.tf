variable "annotation_scheduler" {
  description = "Annotation for the Scheduler.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "annotation_window" {
  description = "Annotation for the Window.  Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "days" {
  description = "The day of the week that the recurring window begins. Options are:\n * every-day\n * Monday\n * Tuesday\n * Wednesday\n * Thursday\n * Friday\n * Saturday\n * Sunday\n * odd-day\n * even-day"
  type        = string
  default     = "every-day"
  validation {
    condition     = (can(regexall("^(every-day|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday|odd-day|even-day)$", var.days)))
    error_message = "Options are every-day, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, odd-day or even-day."
  }
}

variable "description" {
  description = "A Description for the Remote Host."
  type        = string
  default     = ""
}

variable "hour" {
  description = "The hour that the recurring window begins. Specify the hour as 0 to 24."
  type        = number
  default     = 0
  validation {
    condition = (
      var.hour >= 0 &&
      var.hour <= 24
    )
    error_message = "The Hour of the day should be between 0 and 24."
  }
}

variable "minute" {
  description = "The minute that the recurring window begins. Specify the minute as 0 to 59."
  type        = number
  default     = 0
  validation {
    condition = (
      var.minute >= 0 &&
      var.minute <= 59
    )
    error_message = "The Minute should be between 0 and 59."
  }
}

variable "max_concurrent_nodes" {
  description = "The concurrency capacity limit. This is the maximum number of tasks that can be processed concurrently.  Default is 0.  Value options are between 0 and 65535"
  type        = number
  validation {
    condition = (
      var.max_concurrent_nodes >= 0 &&
      var.max_concurrent_nodes <= 65535
    )
    error_message = "The Max Concurrent Nodes should be between 0 and 65535."
  }
}

variable "max_running_time" {
  description = "The processing time capacity limit. This is the maximum duration of the window. The range is 0 to (2^64 - 1) milliseconds. The default value of 0 indicates unlimited, meaning there is no time limit enforced on the scheduler window."
  type        = number
  default     = 0
  validation {
    condition = (
      var.max_running_time >= 0 &&
      var.max_running_time <= 18446744073709551615
    )
    error_message = "The Max Concurrent Nodes should be between 0 and 65535."
  }
}

variable "name_scheduler" {
  description = "The name for the scheduler policy."
  type        = string
  default     = "default"
}

variable "name_window" {
  description = "The name of the recurring schedule window. A schedule window that triggers a task every 24 hours.  If not defined the name of the scheduler will be used for the window as well.  This is optional."
  type        = string
  default     = "default"
}

variable "name_alias_scheduler" {
  description = "Alias for the Scheduler.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "name_alias_window" {
  description = "Alias for the Window.  A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

locals {
  name_window = coalesce(v.name_window, v.name_scheduler)
}
