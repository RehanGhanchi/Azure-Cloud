variable "vnet_cidr_block" {
  description = "The CIDR block for the VNet Like (10.0.0.0/16) "
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/16$", var.vnet_cidr_block))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/16."
  }
}

variable "CIDR_TransitPublicSubnetAz1" {
  description = "The CIDR block for the TransitPublicSubnetAz1 Like (10.0.0.0/20)"
  type        = string
  default     = "10.0.0.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_TransitPublicSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_TransitPublicSubnetAz2" {
  description = "The CIDR block for the TransitPublicSubnetAz2 Like (10.0.16.0/20)"
  type        = string
  default     = "10.0.16.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_TransitPublicSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_PresentationPublicSubnetAz1" {
  description = "The CIDR block for the PresentationPublicSubnetAz1 Like (10.0.32.0/20)"
  type        = string
  default     = "10.0.32.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_PresentationPublicSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_LogicPrivateSubnetAz1" {
  description = "The CIDR block for the LogicPrivateSubnetAz1 Like (10.0.48.0/20)"
  type        = string
  default     = "10.0.48.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_LogicPrivateSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_DataPrivateSubnetAz1" {
  description = "The CIDR block for the DataPrivateSubnetAz1 Like (10.0.64.0/20)"
  type        = string
  default     = "10.0.64.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_DataPrivateSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_PresentationPublicSubnetAz2" {
  description = "The CIDR block for the PresentationPublicSubnetAz2 Like (10.0.80.0/20)"
  type        = string
  default     = "10.0.80.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_PresentationPublicSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_LogicPrivateSubnetAz2" {
  description = "The CIDR block for the LogicPrivateSubnetAz2 Like (10.0.96.0/20)"
  type        = string
  default     = "10.0.96.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_LogicPrivateSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_DataPrivateSubnetAz2" {
  description = "The CIDR block for the DataPrivateSubnetAz2 Like (10.0.112.0/20)"
  type        = string
  default     = "10.0.112.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.CIDR_DataPrivateSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "EnvironmentLevel" {
  description = "The Azure EnvironmentLevel to create resources in Production/Dev/Staging/NonProduction"
  type        = string
  validation {
    condition     = contains(["Production", "Dev", "Staging", "NonProduction"], var.EnvironmentLevel)
    error_message = "Argument 'EnvironmentLevel' must be one of 'Production', 'Dev', 'Staging', 'NonProduction'."
  }
}

variable "AzureSubscriptionAlias" {
  description = "The Azure Subscription Alias in which the resources are getting created"
  type        = string
}

variable "VNetName" {
  description = "The Azure VNet Name"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "resourcegroupname" {
  description = "The Azure resource group name"
  type        = string
}