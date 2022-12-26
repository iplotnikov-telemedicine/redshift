# The name of this view in Looker is "Product Audit"
view: product_audit {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: staging.product_audit ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: number
    sql: concat(${id}, ${comp_id}) ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bag ID" in Explore.

  dimension: bag_id {
    type: number
    sql: ${TABLE}.bag_id ;;
  }

  dimension: bag_name {
    type: string
    sql: ${TABLE}.bag_name ;;
  }

  dimension: driver_id {
    type: number
    sql: ${TABLE}.driver_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: ended {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ended_at ;;
  }

  dimension_group: audit_duration {
    type: duration
    sql_start: ${TABLE}.started_at ;;  # often this is a single database column
    sql_end: ${TABLE}.ended_at ;;  # often this is a single database column
    intervals: [minute, hour] # valid intervals described below
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    type: string
    sql: ${TABLE}.office_name ;;
  }

  dimension: office_selling_type {
    type: string
    sql: ${TABLE}.office_selling_type ;;
  }

  dimension: staff_id {
    type: number
    sql: ${TABLE}.staff_id ;;
  }

  dimension: staff_name {
    type: string
    sql: ${TABLE}.staff_name ;;
  }

  dimension_group: started {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.started_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, staff_name, bag_name, office_name]
  }

  measure: number_of_audited_products {
    type: count_distinct
    sql: ${product_audit_item.product_id} ;;
  }
}
