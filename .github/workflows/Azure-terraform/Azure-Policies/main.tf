provider "azurerm" {
  features {}
}

resource "azurerm_policy_definition" "Tag-Policy" {
  name         = "Mandatory-Tag-Policy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Mandatory-Tag"
  management_group_id = "/providers/Microsoft.Management/managementGroups/${var.managementgroupid}"

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA


  policy_rule = <<POLICY_RULE
  {
    "if": {
      "anyof": [
        {
          "not": {
            "field": "[concat('tags[', parameters('Owner'), ']')]",
            "like": "*@vertexinc.com"
          }
        },
        {
          "field": "[concat('tags[', parameters('Product'), ']')]",
          "exists": "false"
        },
        {
          "not": {
            "field": "[concat('tags[', parameters('CreatedUsing'), ']')]",
            "in": "[parameters('CreatedUsingValues')]"
          }
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE

  parameters = <<PARAMETERS
  {
    "Owner": {
        "type": "String",
        "metadata": {
          "displayName": "Owner",
          "description": "a valid Vertex emailaddress in the format *@vertexinc.com  that can be emailed in the event of a need to contact a key person/team to address problems with the infrastructure"
        }
      },
    "Product": {
      "type": "String",
      "metadata": {
        "displayName": "Product",
        "description": "This is the high level product that is sold to customers or used internally"
      }
    },
    "CreatedUsing": {
      "type": "String",
      "metadata": {
        "displayName": "Created_Using",
        "description": "This is the method by which the resource was created"
      }
    },
    "CreatedUsingValues": {
      "type": "Array",
      "metadata": {
        "displayName": "Created_Using_Values",
        "description": "Value of the tag 'Created_Using'"
      },
      "allowedValues": [
        "Console",
        "CLI",
        "Terraform",
        "PowerShell",
        "ARM"
      ]
    }
  }
PARAMETERS
}

resource "azurerm_management_group_policy_assignment" "Tag-policy-assignment" {
  name                 = "Mandatory-Tag-Policy"
  policy_definition_id = azurerm_policy_definition.Tag-Policy.id
  management_group_id  = "/providers/Microsoft.Management/managementGroups/${var.managementgroupid}"

  parameters = jsonencode({
    Owner             = {
      value = "Owner"
    }
    Product           = {
      value = "Product"
    }
    CreatedUsing      = {
      value = "Created_Using"
    }
    CreatedUsingValues = {
      value = ["Console", "CLI", "Terraform", "PowerShell", "ARM"]
    }
  })
}