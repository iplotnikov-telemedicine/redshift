view: orders_stat {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: marts.orders_stat ;;
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

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: number_of_items {
    type: number
    sql: ${TABLE}.number_of_items ;;
  }

  dimension: number_of_free_items {
    type: number
    sql: ${TABLE}.number_of_free_items ;;
  }

  dimension: has_promo_items {
    type: yesno
    sql: ${TABLE}.has_promo_items ;;
  }

  dimension: order_product_count {
    type: number
    sql: ${TABLE}.order_product_count ;;
  }

  dimension: promo_product_count {
    type: number
    sql: ${TABLE}.promo_product_count ;;
  }

  measure: total_order_product_count {
    type: sum
    sql: ${order_product_count} ;;
  }

  measure: total_promo_product_count {
    type: sum
    sql: ${promo_product_count} ;;
  }

  measure: promo_product_share {
    type: number
    sql: ${total_promo_product_count} / ${total_order_product_count} ;;
  }

  dimension: promo_discount_amount {
    type: number
    sql: ${TABLE}.promo_discount_amount ;;
  }

  dimension: promo_products_amount {
    type: number
    sql: ${TABLE}.promo_products_amount ;;
  }

  dimension: all_products_amount {
    type: number
    sql: ${TABLE}.all_products_amount ;;
  }

  measure: patient_count {
    type: count_distinct
    sql: CONCAT(${comp_id}, ${patient_id}) ;;
  }

  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: orders_stat {
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
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
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
