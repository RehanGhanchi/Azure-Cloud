provider "azurerm" {
  features {}
}

# Create VNet
resource "azurerm_virtual_network" "vnet_test" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-VNet-${var.VNetName}"
  location            = var.location
  address_space       = [var.vnet_cidr_block]
  resource_group_name = var.resourcegroupname
  tags = {
    Environment = var.EnvironmentLevel
    Created-By  = "DZtech"
    Purpose     = "Test"
  }
}

# Create Subnets
resource "azurerm_subnet" "TransitPublicSubnetAz1" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-TransitPublicSubnetAz1"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_TransitPublicSubnetAz1]
}

resource "azurerm_subnet" "TransitPublicSubnetAz2" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-TransitPublicSubnetAz2"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_TransitPublicSubnetAz2]
}

resource "azurerm_subnet" "PresentationPublicSubnetAz1" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-PresentationPublicSubnetAz1"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_PresentationPublicSubnetAz1]
}

resource "azurerm_subnet" "LogicPrivateSubnetAz1" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-LogicPrivateSubnetAz1"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_LogicPrivateSubnetAz1]
}

resource "azurerm_subnet" "DataPrivateSubnetAz1" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-DataPrivateSubnetAz1"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_DataPrivateSubnetAz1]
}

resource "azurerm_subnet" "PresentationPublicSubnetAz2" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-PresentationPublicSubnetAz2"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_PresentationPublicSubnetAz2]
}

resource "azurerm_subnet" "LogicPrivateSubnetAz2" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-LogicPrivateSubnetAz2"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_LogicPrivateSubnetAz2]
}

resource "azurerm_subnet" "DataPrivateSubnetAz2" {
  name                 = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-DataPrivateSubnetAz2"
  resource_group_name  = var.resourcegroupname
  virtual_network_name = azurerm_virtual_network.vnet_test.name
  address_prefixes     = [var.CIDR_DataPrivateSubnetAz2]
}

# Create Private Route Tables
resource "azurerm_route_table" "private_route_table_1" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-PrivateRouteTable1"
  resource_group_name = var.resourcegroupname
  location            = var.location
  disable_bgp_route_propagation = true

  route {
    name           = "privateroute1"
    address_prefix = "10.0.0.0/18"
    next_hop_type  = "VnetLocal"
  }

  tags = {
    Environment = var.EnvironmentLevel
    Created-By  = "DZtech"
    Purpose     = "Private"
  }
}

resource "azurerm_route_table" "private_route_table_az2" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-PrivateRt2"
  resource_group_name = var.resourcegroupname
  location            = var.location
  disable_bgp_route_propagation = true

  route {
    name           = "privateroute2"
    address_prefix = "10.0.0.0/18"
    next_hop_type  = "VnetLocal"
  }

  tags = {
    Environment = var.EnvironmentLevel
    Created-By  = "DZtech"
    Purpose     = "Private"
  }
}

# Create Public Route Table
resource "azurerm_route_table" "public_route_table" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-PublicRouteTable"
  resource_group_name = var.resourcegroupname
  location            = var.location
  disable_bgp_route_propagation = true

  route {
    name           = "publicroute1"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }

  route {
    name           = "publicroute2"
    address_prefix = "10.0.0.0/18"
    next_hop_type  = "VnetLocal"
  }

  tags = {
    Environment = var.EnvironmentLevel
    Created-By  = "DZtech"
    Purpose     = "Public"
  }
}

#Net gateway public ip
resource "azurerm_public_ip" "NatGatewayIp1" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-nat-gateway-publicIP1"
  resource_group_name = var.resourcegroupname
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_public_ip" "NatGatewayIp2" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-nat-gateway-publicIP2"
  resource_group_name = var.resourcegroupname
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}


# Create Network Gateways
resource "azurerm_nat_gateway" "gateway1" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-Gateway1"
  location            = var.location
  resource_group_name = var.resourcegroupname

  depends_on = [
    azurerm_subnet.TransitPublicSubnetAz1,
    azurerm_route_table.public_route_table,
  ]
}

resource "azurerm_nat_gateway" "gateway2" {
  name                = "Azure-${var.AzureSubscriptionAlias}-${var.location}-${var.EnvironmentLevel}-${var.VNetName}-Gateway2"
  location            = var.location
  resource_group_name = var.resourcegroupname

  depends_on = [
    azurerm_subnet.TransitPublicSubnetAz2,
    azurerm_route_table.public_route_table,
  ]
}
#Nat gateway public ip association 
resource "azurerm_nat_gateway_public_ip_association" "public-ip-association1" {
  nat_gateway_id       = azurerm_nat_gateway.gateway1.id
  public_ip_address_id = azurerm_public_ip.NatGatewayIp1.id
}

resource "azurerm_nat_gateway_public_ip_association" "public-ip-association2" {
  nat_gateway_id       = azurerm_nat_gateway.gateway2.id
  public_ip_address_id = azurerm_public_ip.NatGatewayIp2.id
}


# Associate Subnets with Route Tables
resource "azurerm_subnet_route_table_association" "public_route_table_association_1" {
  subnet_id      = azurerm_subnet.TransitPublicSubnetAz1.id
  route_table_id = azurerm_route_table.public_route_table.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_2" {
  subnet_id      = azurerm_subnet.PresentationPublicSubnetAz1.id
  route_table_id = azurerm_route_table.public_route_table.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_3" {
  subnet_id      = azurerm_subnet.LogicPrivateSubnetAz1.id
  route_table_id = azurerm_route_table.private_route_table_1.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_4" {
  subnet_id      = azurerm_subnet.DataPrivateSubnetAz1.id
  route_table_id = azurerm_route_table.private_route_table_1.id
}

resource "azurerm_subnet_route_table_association" "public_route_table_association_5" {
  subnet_id      = azurerm_subnet.TransitPublicSubnetAz2.id
  route_table_id = azurerm_route_table.public_route_table.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_6" {
  subnet_id      = azurerm_subnet.PresentationPublicSubnetAz2.id
  route_table_id = azurerm_route_table.public_route_table.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_7" {
  subnet_id      = azurerm_subnet.LogicPrivateSubnetAz2.id
  route_table_id = azurerm_route_table.private_route_table_az2.id
}

resource "azurerm_subnet_route_table_association" "private_route_table_association_8" {
  subnet_id      = azurerm_subnet.DataPrivateSubnetAz2.id
  route_table_id = azurerm_route_table.private_route_table_az2.id
}

#Nat gateway association 

resource "azurerm_subnet_nat_gateway_association" "NatGatewayAssociation2" {
  subnet_id      = azurerm_subnet.LogicPrivateSubnetAz1.id
  nat_gateway_id = azurerm_nat_gateway.gateway1.id
}

resource "azurerm_subnet_nat_gateway_association" "NatGatewayAssociation3" {
  subnet_id      = azurerm_subnet.DataPrivateSubnetAz1.id
  nat_gateway_id = azurerm_nat_gateway.gateway1.id
}

resource "azurerm_subnet_nat_gateway_association" "NatGatewayAssociation5" {
  subnet_id      = azurerm_subnet.LogicPrivateSubnetAz2.id
  nat_gateway_id = azurerm_nat_gateway.gateway2.id
}

resource "azurerm_subnet_nat_gateway_association" "NatGatewayAssociation6" {
  subnet_id      = azurerm_subnet.DataPrivateSubnetAz2.id
  nat_gateway_id = azurerm_nat_gateway.gateway2.id
}