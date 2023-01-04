connection: "redshift"

include: "/views/*.view.lkml"
include: "/data_tests.lkml"
include: "/dashboards/categories_details.dashboard.lookml"
include: "/persistent/inventory_weekly_by_category.view.lkml"

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

# Dashboard source
explore: sales_details {
  view_name: order_items_with_details
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
  join: inventory_current {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.office_id} = ${inventory_current.office_id}
      and ${order_items_with_details.product_id} = ${inventory_current.product_id};;
  }
  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.product_id} = ${products_with_details.prod_id}
      and ${order_items_with_details.comp_id} = ${products_with_details.comp_id};;
  }
}

# Dashboard source
explore: inventory_daily  {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
  join: order_items_with_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items_with_details.office_id} = ${inventory_daily.office_id}
      and ${order_items_with_details.product_id} = ${inventory_daily.product_id}
      and ${order_items_with_details.confirmed_date} = ${inventory_daily.report_at_date};;
  }
  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.product_id} = ${products_with_details.prod_id}
      and ${order_items_with_details.comp_id} = ${products_with_details.comp_id};;
  }
}


# Persistent native derived table source
explore: inventory_daily_wo_access_filter  {
  view_name: inventory_daily
  join: order_items_with_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_items_with_details.office_id} = ${inventory_daily.office_id}
      and ${order_items_with_details.product_id} = ${inventory_daily.product_id}
      and ${order_items_with_details.confirmed_date} = ${inventory_daily.report_at_date};;
  }
}

# Dashboard source
explore: inventory_weekly_by_category {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

# Dashboard source
explore: inventory_current {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
  join: order_items_with_details {
    type: left_outer
    relationship: one_to_many
    sql_on: ${inventory_current.office_id} = ${order_items_with_details.office_id}
      and ${inventory_current.product_id} = ${order_items_with_details.product_id};;
  }
  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.product_id} = ${products_with_details.prod_id}
      and ${order_items_with_details.comp_id} = ${products_with_details.comp_id};;
  }
}


explore: cashier_details {}

explore: order_items_with_details {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

  join: product_transactions {
    sql_on: ${order_items_with_details.comp_id} = ${product_transactions.comp_id}
      AND ${order_items_with_details.order_id} = ${product_transactions.order_id}
      AND ${order_items_with_details.product_checkin_id} = ${product_transactions.product_checkin_id} ;;
    type: inner
    relationship: many_to_one
    # fields: [comp_id, order_id, product_checkin_id, transaction_type_name, quantity_sold]
  }

}
