connection: "redshift"

include: "/views/**/*.view"
include: "/data_tests.lkml"

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

  join: warehouse_orders {
    relationship: one_to_many
    type: left_outer
    sql_on: ${patients_stat.comp_id} = ${warehouse_orders.comp_id}
      and ${patients_stat.patient_id} = ${warehouse_orders.patient_id};;
  }

  join: warehouse_order_items {
    relationship: one_to_many
    type: left_outer
    sql_on: ${warehouse_orders.comp_id} = ${warehouse_order_items.comp_id}
      and ${warehouse_orders.id} = ${warehouse_order_items.order_id};;
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


#---------------------------------------------------------
# BRAND DETAILS DASHBOARD SOURCE
#---------------------------------------------------------

explore: order_items_with_details {
  sql_always_where: ${comp_id} = 3628;;
}
explore: daily_inventory  {
  sql_always_where: ${comp_id} = 3628;;
}

#---------------------------------------------------------
# AD-HOC REPORTS SOURCES
#---------------------------------------------------------
# Customer Frequency Report for IO
explore: monthly_orders_group_stat {}


#---------------------------------------------------------
# DICTIONARIES FOR FILTERS IN DIFFERENT REPORTS
#---------------------------------------------------------
explore: offices {
  sql_always_where: ${office_comp_id} = 3628;;
}

explore: brands {
  sql_always_where: ${comp_id} = 3628;;
  join: products {
    relationship: one_to_many
    type: left_outer
    sql_on: ${products.comp_id} = ${brands.comp_id}
      and ${products.brand_id} = ${brands.id} ;;
  }
}
