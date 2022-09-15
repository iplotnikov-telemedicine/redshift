# Define the database connection to be used for this model.
connection: "redshift"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

# datagroup: redshift_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "24 hours"
# }

# persist_with: redshift_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Redshift"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

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
