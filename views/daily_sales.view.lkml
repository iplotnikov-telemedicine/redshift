view: daily_sales {

  # # You can specify the table name if it's different from the view name:
  sql_table_name: test.daily_sales ;;

  dimension: domain_prefix {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: comp_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: office_id {
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension_group: report_date {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.report_date ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: sales_volume {
    hidden: yes
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.sales_volume ;;
  }

  measure: total_sales_volume {
    type: sum
    value_format_name: usd_0
    sql: ${sales_volume} ;;
  }

  dimension: order_quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.order_quantity ;;
  }

  measure: total_order_quantity {
    type: sum
    sql: ${order_quantity} ;;
  }

  # companies.domain_prefix,
  # unioned.comp_id,
  # unioned.office_id,
  # unioned.report_date,
  # channels.channel_name,
  # unioned.type,
  # unioned.payment_method,
  # unioned.sales_volume,
  # unioned.order_quantity

  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
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

# view: daily_sales {
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
