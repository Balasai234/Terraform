resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    var.vpc_tags,
   local.common_tags,{
        project = "${var.project}-${var.environment}"
    }
  )
}
# IGW roboshop-dev
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # association with VPC

  tags = merge(
     var.IGW_tags,
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}
resource "aws_subnet" "public_subnet_id" {
    count = length(var.public_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = local.az_names[count.index]
   map_public_ip_on_launch = true
  tags =merge(
    var.vpc_tags,
    local.common_tags,{
        Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
    }) 
  
}
resource "aws_subnet" "private_subnet_id" {
    count = length(var.private_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = local.az_names[count.index]
  tags =merge(
    var.private_tags,
    local.common_tags,{
        Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
    }) 
  
}
resource "aws_subnet" "database_subnet_id" {
    count = length(var.database_cidr_block)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_cidr_block[count.index]
  availability_zone = local.az_names[count.index]
  tags =merge(
    var.private_tags,
    local.common_tags,{
        Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
    }) 
  
}
resource "aws_eip" "nat" {
  domain   = "vpc"
  tags =merge(
    var.eip_tags,
    local.common_tags,{
         Name = "${var.project}-${var.environment}"
    }
    )
}
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_subnet_id[0].id

  tags =merge(
    var.nat_tags,
    local.common_tags,{
         Name = "${var.project}-${var.environment}"
    }
  )
  depends_on = [ aws_internet_gateway.main]
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    tags = merge(
     local.common_tags,{
          Name ="${var.project}-${var.environment}-public"
      }
    )
    
  
}
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    tags = merge(
    local.common_tags,{
          Name ="${var.project}-${var.environment}-private"
      }
    )
    
  
}
resource "aws_route_table" "backend" {
    vpc_id = aws_vpc.main.id
    tags = merge(
     local.common_tags,{
          Name ="${var.project}-${var.environment}-backend"
      }
    )
    
  
}
resource "aws_route" "public" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = ["0.0.0.0./0"]
    gateway_id = aws_internet_gateway.main.id
  
}
resource "aws_route" "private" {
    route_table_id = aws_route_table.private.id
    destination_cidr_block = ["0.0.0.0/0"]
    gateway_id = aws_nat_gateway.main.id
  
}
resource "aws_route" "backend" {
    route_table_id = aws_route_table.backend.id
    destination_cidr_block = ["0.0.0.0/0"]
    gateway_id = aws_nat_gateway.main.id
  
}
resource "aws_route_table_association" "public" {
    count = length(var.public_cidr_block)
    subnet_id = aws_subnet.public_subnet_id[count.index].id
    route_table_id = aws_route_table.public.id
  
}

resource "aws_route_table_association" "private" {
  count = length(var.private_cidr_block)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "database" {
  count = length(var.database_cidr_block)
  subnet_id      = aws_subnet.database[count.index].id
  route_table_id = aws_route_table.database.id
}