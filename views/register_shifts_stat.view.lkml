view: register_shifts_stat {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: test.register_shifts_stat ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: register_id {
    type: number
    sql: ${TABLE}.register_id ;;
  }

  dimension: register_name {
    type: string
    sql: ${TABLE}.register_name ;;
  }

  dimension_group: open {
    description: "The time when the shift is open"
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.open_at ;;
  }

  dimension_group: closed {
    description: "The time when the shift is closed"
    type: time
    timeframes: [time, date, week, month, year]
    sql: ${TABLE}.closed_at ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.order_type ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  dimension: orders_count {
    hidden: yes
    type: number
    sql: ${TABLE}.orders_count ;;
  }

  dimension: sales_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.sales_amount ;;
    value_format_name: usd
  }

  dimension: wait_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}.wait_minutes ;;
  }

  measure: total_orders_count {
    type: sum
    sql: ${orders_count} ;;
  }

  measure: total_sales_amount {
    type: sum
    sql: ${sales_amount} ;;
    value_format_name: usd
  }

  measure: total_wait_minutes {
    type: sum
    sql: ${wait_minutes} ;;
  }

}

# view: register_shifts_stat {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
