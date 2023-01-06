# The name of this view in Looker is "Stg Io Product Filter Index"
view: product_filter_index {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: test.stg_io__product_filter_index ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: number
    sql: CONCAT(${comp_id}, ${id}) ;;
  }

  dimension: product_filter_id {
    type: number
    sql: ${TABLE}.product_filter_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: promo_products_count {
    type: count_distinct
    sql:  ${product_id} ;;
  }
}
