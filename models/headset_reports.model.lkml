connection: "redshift"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/data_tests.lkml"


# Dictionary for filters
explore: offices {
  access_filter: {
    field: office_comp_id
    user_attribute: allowed_customers
  }
}

# Dictionary for filters
explore: brands {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
  join: products {
    relationship: one_to_many
    type: left_outer
    sql_on: ${products.comp_id} = ${brands.comp_id}
      and ${products.brand_id} = ${brands.id} ;;
  }
}

# Dictionary for filters
explore: companies {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}



# REPORTS:
# - Brand Details (Top level statistics, Sales and Margin, Sales by Category);
# - Discount Overview (General)
explore: sales_details {
  view_name: order_items_with_details
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
  join: inventory_current {
    type: full_outer
    relationship: many_to_one
    sql_on: ${order_items_with_details.comp_id} = ${inventory_current.comp_id}
      and ${order_items_with_details.office_id} = ${inventory_current.office_id}
      and ${order_items_with_details.product_id} = ${inventory_current.product_id};;
  }
}

# REPORTS: Brand Details (Sales and Stock)
explore: inventory_daily  {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

# REPORTS: Brand Details (As Yesterday)
explore: inventory_current {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}
