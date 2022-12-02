connection: "redshift"

include: "/views/**/*.view"
# include: "/data_tests.lkml"

explore: customer_limits_history {

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

explore: orders_with_details {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}


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
    fields: [comp_id, order_id, product_checkin_id, transaction_type_name]
  }

}


explore: daily_inventory  {
  access_filter: {
    field: comp_id
    user_attribute: allowed_customers
  }
}

explore: patients  {}
