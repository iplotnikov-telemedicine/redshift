view: orders_with_details {
  sql_table_name: test.orders_with_details ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.comp_id, ${TABLE}.id) ;;
    hidden: yes
  }

  filter: account_name {
    type: string
    suggest_dimension: domain_prefix
    sql: {% condition account_name %} ${domain_prefix} {% endcondition %} ;;
  }

  dimension: domain_prefix {
    type: string
    sql: ${TABLE}.domain_prefix ;;
    hidden: yes
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
    hidden: yes
  }

  dimension: num_days {
    type: number
    sql: CEILING(TIMESTAMPDIFF(HOUR,{% date_start confirmed_at %},{% date_end confirmed_at %})/24) ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: office_zip_name {
    type: zipcode
    sql: ${TABLE}.office_zip_name ;;
  }

  dimension: cashier_id {
    type: string
    sql: ${TABLE}.cashier_id ;;
  }

  dimension: cashier_name {
    type: string
    sql: ${TABLE}.cashier_name ;;
  }

  dimension: order_type {
    type: string
    sql: ${TABLE}.type ;;
    suggestions: ["pickup", "delivery"]
    suggest_persist_for: "24 hours"
  }

  dimension: confirmed_at {
    type: date_time
    sql: ${TABLE}.confirmed_at ;;
    html: {{ rendered_value | date: "%D %r" }} ;;
  }

  # DATE_PART(dayofweek, created_at)

  dimension: weekday {
    type: number
    sql: DATE_PART(dayofweek, ${TABLE}.confirmed_at) ;;
  }

  dimension: day_of_week {
    type: string
    case: {
      when: {
        sql: ${weekday} = 0 ;;
        label: "Sun"
      }
      when: {
        sql: ${weekday} = 1 ;;
        label: "Mon"
      }
      when: {
        sql: ${weekday} = 2 ;;
        label: "Tue"
      }
      when: {
        sql: ${weekday} = 3 ;;
        label: "Wed"
      }
      when: {
        sql: ${weekday} = 4 ;;
        label: "Thu"
      }
      when: {
        sql: ${weekday} = 5 ;;
        label: "Fri"
      }
      when: {
        sql: ${weekday} = 6 ;;
        label: "Sat"
      }
    }
  }

  dimension_group: confirmed {
    description: "Datetime of order confirming"
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
    sql: ${TABLE}.confirmed_at ;;
  }

  measure: max_confirmed_at {
    type: date_time
    sql: MAX(${TABLE}.confirmed_at) ;;
  }

  measure: min_confirmed_at {
    type: date_time
    sql: MIN(${TABLE}.confirmed_at) ;;
  }

  dimension_group: sync_created_at {
    description: "Datetime of order creating"
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
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: placed_at {
    description: "Datetime of order placing"
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
    sql: ${TABLE}.placed_at ;;
  }

  dimension: order_status {
    type:  string
    sql:   ${TABLE}.order_status ;;
  }

  dimension: register_id {
    type:  number
    sql:   ${TABLE}.register_id ;;
  }

  dimension: channel {
    type: string
    case: {
      when: {
        sql: ${TABLE}.marketplace = 1 ;;
        label: "POS"
      }
      when: {
        sql: ${TABLE}.marketplace = 2 ;;
        label: "e-commerce"
      }
      when: {
        sql: ${TABLE}.marketplace = 3 ;;
        label: "sweede"
      }
      when: {
        sql: ${TABLE}.marketplace = 4 ;;
        label: "offline POS"
      }
      when: {
        sql: ${TABLE}.marketplace = 5 ;;
        label: "weedmaps"
      }
      when: {
        sql: ${TABLE}.marketplace = 6 ;;
        label: "openAPI"
      }
    }
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: patient_first_name {
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: patient_phone {
    type: string
    sql: ${TABLE}.patient_phone ;;
  }

  dimension: is_completed {
    type: yesno
    sql: ${status} = 'completed' ;;
  }

  measure: number_of_orders {
    type: count
    description: "Number of Orders"
    value_format_name: decimal_0
  }

  measure: number_of_completed {
    type: count
    description: "Number of Completed Orders"
    filters:[order_status:"completed"]
    value_format_name: decimal_0
  }

  measure: total_amount {
    type: sum
    description: "Total Sales"
    sql: ${TABLE}.total_amount ;;
    value_format:"$#.00;($#.00)"
  }

  measure: total_amount_completed {
    type: sum
    description: "Total Sales for Completed Orders"
    sql: ${TABLE}.total_amount ;;
    filters:[order_status:"completed"]
    value_format:"$#.00;($#.00)"
  }

  measure: avg_amount {
    type: average
    description: "Avg Ticket"
    sql: ${TABLE}.total_amount ;;
    value_format:"$#.00;($#.00)"
  }

  measure: avg_amount_completed {
    type: average
    description: "Avg Ticket for Completed Orders"
    sql: ${TABLE}.total_amount ;;
    filters:[order_status:"completed"]
    value_format:"$#.00;($#.00)"
  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
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

# view: patients {
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
