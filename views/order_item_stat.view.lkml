view: order_item_stat {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: marts.order_item_stat ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: total_quantity {
    type: number
    sql: ${TABLE}.total_quantity ;;
    value_format_name: decimal_1
  }

  dimension: paid_quantity {
    type: number
    sql: ${TABLE}.paid_quantity ;;
    value_format_name: decimal_1
  }

  dimension: free_quantity {
    type: number
    sql: ${TABLE}.free_quantity ;;
    value_format_name: decimal_1
  }

  dimension: is_free {
    type: yesno
    sql: ${TABLE}.is_free ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: discount_type {
    type: string
    sql: ${TABLE}.discount_type ;;
  }

  dimension: free_amount {
    type: number
    sql: ${TABLE}.free_amount ;;
  }

  dimension: paid_amount {
    type: number
    sql: ${TABLE}.paid_amount ;;
  }

  measure: total_paid_quantity {
    type: sum
    sql: ${paid_quantity};;
  }

  measure: total_free_quantity {
    type: sum
    sql: ${free_quantity};;
  }

  measure: total_total_quantity {
    type: sum
    sql: ${total_quantity};;
  }

}

# view: order_item_stat {
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
