connection: "redshift"

include: "/views/**/*.view"
# include: "/data_tests.lkml"

explore: customer_limits_history {

  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

}


explore: register_shifts_stat {

  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

}


explore: orders_stat {

  join: patients_stat {
    relationship: many_to_one
    type: inner
    sql_on: ${orders_stat.comp_id} = ${patients_stat.comp_id}
      and ${orders_stat.patient_id} = ${patients_stat.patient_id};;
  }
}

explore: patients_stat {
  # sql_always_where: ${warehouse_orders.confirmed_at} IS NOT NULL ;;

  join: companies {
    relationship: many_to_one
    type: inner
    sql_on: ${patients_stat.comp_id} = ${patients_stat.comp_id} ;;
  }

  join: orders_stat {
    relationship: one_to_one
    type: inner
    sql_on: ${orders_stat.comp_id} = ${patients_stat.comp_id}
      and ${orders_stat.patient_id} = ${patients_stat.patient_id};;
  }

  join: order_item_stat {
    relationship: one_to_one
    type: inner
    sql_on: ${order_item_stat.comp_id} = ${patients_stat.comp_id}
      and ${order_item_stat.patient_id} = ${patients_stat.patient_id};;
  }

  join: orders_with_details {
    relationship: one_to_many
    type: left_outer
    sql_on: ${patients_stat.comp_id} = ${orders_with_details.comp_id}
      and ${patients_stat.patient_id} = ${orders_with_details.patient_id};;
  }

  join: warehouse_order_items {
    relationship: one_to_many
    type: left_outer
    sql_on: ${orders_with_details.comp_id} = ${warehouse_order_items.comp_id}
      and ${orders_with_details.id} = ${warehouse_order_items.order_id};;
  }
  join: products {
    relationship: many_to_one
    type: inner
    sql_on: ${warehouse_order_items.comp_id} = ${products.comp_id}
      and ${warehouse_order_items.product_id} = ${products.prod_id};;
  }
  join: product_categories {
    relationship: one_to_many
    type: inner
    sql_on: ${products.comp_id} = ${product_categories.comp_id}
      and ${products.prod_category_id} = ${product_categories.id};;
  }
  join: brands {
    relationship: many_to_one
    type: left_outer
    sql_on: ${products.comp_id} = ${brands.comp_id}
      and ${products.brand_id} = ${brands.id};;
  }
}

explore: monthly_orders_group_stat {}


explore: offices {
  access_filter: {
    field: office_comp_id
    user_attribute: allowed_customers
  }
}

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


explore: companies {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

explore: customers {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

explore: orders_with_details {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

# explore: cashier_details {}

# explore: order_items_with_details {
#   access_filter: {
#     field: comp_id
#     user_attribute: allowed_customers
#   }

#   join: product_transactions {
#     sql_on: ${order_items_with_details.comp_id} = ${product_transactions.comp_id}
#       AND ${order_items_with_details.order_id} = ${product_transactions.order_id}
#       AND ${order_items_with_details.product_checkin_id} = ${product_transactions.product_checkin_id} ;;
#     type: inner
#     relationship: many_to_one
#     # fields: [comp_id, order_id, product_checkin_id, transaction_type_name, quantity_sold]
#   }

# }

explore: daily_sales {
  join: customers {
    type: inner
    relationship: many_to_one
    sql_on: ${daily_sales.comp_id} = ${customers.comp_id} ;;
  }
}


explore: inventory_daily {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

explore: patients  {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

  join: patient_metrics {
    relationship: one_to_one
    type: inner
    sql_on: ${patients.comp_id} = ${patient_metrics.comp_id}
      and ${patients.patient_id} = ${patient_metrics.patient_id};;
  }

  join: orders_with_details {
    relationship: one_to_many
    type: inner
    sql_on: ${patients.comp_id} = ${orders_with_details.comp_id}
      and ${patients.patient_id} = ${orders_with_details.patient_id};;
  }

  join: order_items_with_details {
    relationship: one_to_many
    type: inner
    sql_on: ${patients.comp_id} = ${order_items_with_details.comp_id}
      and ${patients.patient_id} = ${order_items_with_details.patient_id};;
  }

  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.product_id} = ${products_with_details.prod_id}
      and ${order_items_with_details.comp_id} = ${products_with_details.comp_id} ;;
  }
}

explore: order_items_with_details {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

  join: offices {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.office_id} = ${offices.office_id} ;;
  }

  join: product_transactions {
    sql_on: ${order_items_with_details.comp_id} = ${product_transactions.comp_id}
      AND ${order_items_with_details.order_id} = ${product_transactions.order_id}
      AND ${order_items_with_details.product_checkin_id} = ${product_transactions.product_checkin_id} ;;
    type: inner
    relationship: many_to_one
    # fields: [comp_id, order_id, product_checkin_id, transaction_type_name, quantity_sold]
  }

  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.product_id} = ${products_with_details.prod_id}
      and ${order_items_with_details.comp_id} = ${products_with_details.comp_id};;
  }
}


explore: product_audit {

  join: customers {
    type: inner
    relationship: many_to_one
    sql_on: ${product_audit.comp_id} = ${customers.comp_id} ;;
  }

  join: product_audit_item {
    type: inner
    relationship: one_to_many
    sql_on: ${product_audit.id} = ${product_audit_item.audit_id} ;;
  }
}


# explore: order_items_with_discounts {
#   from: order_items_with_details

#   access_filter: {
#     field: comp_id
#     user_attribute: allowed_customers
#   }

#   join: discounts {
#     type: inner
#     relationship: many_to_one
#     sql_on: ${order_items_with_discounts.discount_id} = ${discounts.id}
#       and ${order_items_with_discounts.comp_id} = ${discounts.comp_id} ;;
#   }

#   join: product_filter_index {
#     type: inner
#     relationship: many_to_many
#     sql_on: ${discounts.product_filter_id} = ${product_filter_index.product_filter_id}
#       and ${discounts.comp_id} = ${product_filter_index.comp_id} ;;
#   }
# }


explore: discounts {
  sql_always_where: discounts.apply_type = 'item'
    and discounts.is_ongoing = 0
    and discounts.use_type <> 'auto_apply';;

  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }

  join: companies {
    relationship: many_to_one
    type: inner
    sql_on: ${discounts.comp_id} = ${companies.comp_id} ;;
  }

  join: product_filter_index {
    type: inner
    relationship: many_to_many
    sql_on: ${discounts.product_filter_id} = ${product_filter_index.product_filter_id}
      and ${discounts.comp_id} = ${product_filter_index.comp_id} ;;
  }

  join: products_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${product_filter_index.product_id} = ${products_with_details.prod_id}
      and ${product_filter_index.comp_id} = ${products_with_details.comp_id} ;;
  }

  join: order_items_with_details {
    type: inner
    relationship: many_to_many
    sql_on: ${product_filter_index.product_id} = ${order_items_with_details.product_id}
    and ${product_filter_index.comp_id} = ${order_items_with_details.comp_id} ;;
  }

  join: orders_with_details {
    type: inner
    relationship: many_to_one
    sql_on: ${order_items_with_details.order_id} = ${orders_with_details.id}
      and ${order_items_with_details.comp_id} = ${orders_with_details.comp_id} ;;
  }
}
