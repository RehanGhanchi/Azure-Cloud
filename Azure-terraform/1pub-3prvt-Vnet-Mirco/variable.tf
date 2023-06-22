variable "vnet_cidr_block" {
  description = "The CIDR block for the VNet like (10.0.0.0/20)"
  type        = string
  default     = "10.0.0.0/20"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/20$", var.vnet_cidr_block))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/20."
  }
}

variable "CIDR_TransitPublicSubnetAz1" {
  description = "The CIDR block for the TransitPublicSubnetAz1 like (10.0.0.0/24)"
  type        = string
  default     = "10.0.0.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_TransitPublicSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_TransitPublicSubnetAz2" {
  description = "The CIDR block for the TransitPublicSubnetAz2 like (10.0.2.0/24)"
  type        = string
  default     = "10.0.2.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_TransitPublicSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_PresentationPrivateSubnetAz1" {
  description = "The CIDR block for the PresentationPrivateSubnetAz1 like (10.0.4.0/24)"
  type        = string
  default     = "10.0.4.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_PresentationPrivateSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_LogicPrivateSubnetAz1" {
  description = "The CIDR block for the LogicPrivateSubnetAz1 like (10.0.6.0/24)"
  type        = string
  default     = "10.0.6.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_LogicPrivateSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_DataPrivateSubnetAz1" {
  description = "The CIDR block for the DataPrivateSubnetAz1 like (10.0.8.0/24)"
  type        = string
  default     = "10.0.8.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_DataPrivateSubnetAz1))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_PresentationPrivateSubnetAz2" {
  description = "The CIDR block for the PresentationPrivateSubnetAz2 like (10.0.10.0/24)"
  type        = string
  default     = "10.0.10.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_PresentationPrivateSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_LogicPrivateSubnetAz2" {
  description = "The CIDR block for the LogicPrivateSubnetAz2 like (10.0.12.0/24)"
  type        = string
  default     = "10.0.12.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_LogicPrivateSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
  }
}

variable "CIDR_DataPrivateSubnetAz2" {
  description = "The CIDR block for the DataPrivateSubnetAz2 like (10.0.14.0/24)"
  default     = "10.0.14.0/24"
  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/24$", var.CIDR_DataPrivateSubnetAz2))
    error_message = "Invalid CIDR block format. Please provide a valid CIDR block in the format x.x.x.x/24."
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