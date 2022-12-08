view: customers {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: test.customers ;;

  dimension_group: first_day_of_prev_month {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: date_trunc('month', dateadd(month, -1, current_date)) ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${last_sales_date} >= ${first_day_of_prev_month_date} ;;
  }

  dimension: domain_prefix {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: comp_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.potify_sync_entity_updated_at ;;
  }

  dimension: subscription_name {
    type: string
    sql: ${TABLE}.subscription_name ;;
  }

  dimension: is_disabled {
    type: yesno
    sql: ${TABLE}.comp_is_disabled ;;
  }

  dimension: business_type {
    type: string
    sql: COALESCE(${TABLE}.business_type, 'Unspecified') ;;
  }

  dimension_group: trial_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.trial_date ;;
  }

  dimension: tv_device_limit {
    type: number
    sql: ${TABLE}.tv_device_limit ;;
  }

  dimension: use_pos {
    type: string
    sql: ${TABLE}.use_pos ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.county_name ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: has_unpaid_invoice {
    type: yesno
    sql: ${TABLE}.has_unpaid_invoice ;;
  }

  dimension: hear_about_us {
    type: string
    sql: COALESCE(${TABLE}.hear_about_us, 'Unspecified') ;;
  }

  dimension: is_delivery {
    type: yesno
    sql: ${TABLE}.is_delivery ;;
  }

  dimension: using_twillio {
    type: yesno
    sql: ${TABLE}.is_enabled_sms_integration ;;
  }

  dimension: is_recurly_dunning_last {
    type: yesno
    sql: ${TABLE}.is_recurly_dunning_last ;;
  }

  dimension: is_metrc_enabled {
    type: yesno
    sql: ${TABLE}.is_metrc_enabled ;;
  }

  dimension: locations_count {
    type: number
    sql: ${TABLE}.locations_count ;;
  }

  dimension: ondemand_offices_limit {
    type: number
    sql: ${TABLE}.ondemand_offices_count ;;
  }

  dimension: ondemand_storages_limit {
    type: number
    sql: ${TABLE}.ondemand_storages_count ;;
  }

  dimension: recurly_account_id {
    type: string
    sql: ${TABLE}.recurly_account_id ;;
  }

  dimension: is_recurly_account {
    type: yesno
    sql: ${recurly_account_id} IS NOT NULL ;;
  }

  dimension_group: recurly_dunning {
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
    sql: ${TABLE}.recurly_dunning_at ;;
  }

  dimension_group: recurly_expired {
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
    sql: ${TABLE}.recurly_expired_at ;;
  }

  dimension: recurly_hosted_login_token {
    type: string
    sql: ${TABLE}.recurly_hosted_login_token ;;
  }

  dimension: recurly_subscription_id {
    type: string
    sql: ${TABLE}.recurly_subscription_id ;;
  }

  dimension_group: recurly_trial_expired {
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
    sql: ${TABLE}.recurly_trial_expired_at ;;
  }

  dimension: recurly_unpaid_invoice_id {
    type: string
    sql: ${TABLE}.recurly_unpaid_invoice_id ;;
  }

  dimension: recurly_unpaid_invoice_number {
    type: number
    sql: ${TABLE}.recurly_unpaid_invoice_number ;;
  }

  dimension: staff_count {
    type: number
    sql: ${TABLE}.staff_count ;;
  }

  dimension: staff_tier {
    type: tier
    tiers: [0,1,5,30,70,150,300,600,1000]
    style: integer
    sql: ${staff_count} ;;
    # Bins: 0, 1-999, 1000-2999, 3000-9999, 10000-29999, 30000-99999, 100000-199999, >=200000
  }

  dimension: courier_limit {
    type: number
    sql: ${TABLE}.courier_limit ;;
  }

  dimension: register_limit {
    type: number
    sql: ${TABLE}.register_limit ;;
  }

  dimension: leafly_sync_offices_count {
    type: number
    sql:  COALESCE(${TABLE}.leafly_sync_offices_count, 0) ;;
  }

  dimension: weedmaps_sync_offices_count {
    type: number
    sql:  COALESCE(${TABLE}.weedmaps_sync_offices_count, 0) ;;
  }

  dimension: actual_storefront_offices_count {
    type: number
    sql:  ${TABLE}.actual_storefront_offices_count ;;
  }

  dimension: actual_ondemand_offices_count {
    type: number
    sql:  ${TABLE}.actual_ondemand_offices_count ;;
  }

  dimension: actual_ondemand_storages_count {
    type: number
    sql:  ${TABLE}.actual_ondemand_storages_count ;;
  }

  dimension: actual_ordinary_storages_count {
    type: number
    sql:  ${TABLE}.actual_ordinary_storages_count ;;
  }

  dimension: actual_sweede_offices_count {
    type: number
    sql:  ${TABLE}.actual_sweede_offices_count ;;
  }

  dimension: actual_sweede_accept_offices_count {
    hidden: yes
    type: number
    sql:  ${TABLE}.actual_sweede_accept_offices_count ;;
  }

  dimension: total_patients_count {
    type: number
    sql:  ${TABLE}.total_patients_count ;;
  }

  dimension: male_patients_count {
    type: number
    sql:  ${TABLE}.male_patients_count ;;
  }

  dimension: female_patients_count {
    type: number
    sql:  ${TABLE}.female_patients_count ;;
  }

  dimension: unspecified_patients_count {
    type: number
    sql:  ${TABLE}.unspecified_patients_count ;;
  }

  dimension: total_products_count {
    type: number
    sql:  ${TABLE}.total_products_count ;;
  }

  dimension: mj_products_count {
    type: number
    sql:  ${TABLE}.mj_products_count ;;
  }

  dimension: non_mj_products_count {
    type: number
    sql:  ${TABLE}.non_mj_products_count ;;
  }

  dimension: total_registers_count {
    type: number
    sql:  ${TABLE}.total_registers_count ;;
  }

  dimension: pos_registers_count {
    type: number
    sql:  ${TABLE}.pos_registers_count ;;
  }

  dimension: mobile_registers_count {
    type: number
    sql:  ${TABLE}.mobile_registers_count ;;
  }

  dimension: tv_registers_count {
    type: number
    sql:  ${TABLE}.tv_registers_count ;;
  }

  dimension_group: joined_indica {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.min_report_date ;;
  }

  dimension_group: last_sales {
    type: time
    timeframes: [
      date,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.max_report_date ;;
  }

  dimension: months_with_indica {
    type: number
    sql:  ${TABLE}.months_with_indica ;;
  }

  dimension: sweede_sales_offices_count {
    type: number
    sql:  ${TABLE}.sweede_sales_offices_count ;;
  }

  dimension: mj_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${mj_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: non_mj_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${non_mj_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: total_products_tier {
    type: tier
    tiers: [0,1,500,1000,3000,5000,10000]
    style: integer
    sql: ${total_products_count} ;;
    # Bins: 0, 1-499, 500-999, 1000-2999, 3000-4999, 5000-9999, >=10000
  }

  dimension: total_patients_tier {
    type: tier
    tiers: [0,1,1000,3000,10000,30000,100000,200000]
    style: integer
    sql: ${total_patients_count} ;;
    # Bins: 0, 1-999, 1000-2999, 3000-9999, 10000-29999, 30000-99999, 100000-199999, >=200000
  }

  dimension: ondemand_offices_tier {
    type: tier
    tiers: [0,1,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${actual_ondemand_offices_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: ondemand_storages_tier {
    type: tier
    tiers: [0,1,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${actual_ondemand_storages_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: ordinary_storages_tier {
    type: tier
    tiers: [0,1,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${actual_ordinary_storages_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  dimension: storefront_offices_tier {
    type: tier
    tiers: [0,1,5,15,30,50,100,200,400,800,1600]
    style: integer
    sql: ${actual_storefront_offices_count} ;;
    # Bins: 1-4, 5-14, 15-29, 30-49, 50-99, 100-199, 200-399, 400-799, 800-1599, >=1600
  }

  measure: customer_count {
    type: count
  }

}

# view: customers {
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
