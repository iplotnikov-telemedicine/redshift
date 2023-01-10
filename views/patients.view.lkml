view: patients {
  sql_table_name: test.patients;;

  dimension: primary_key {
    primary_key: yes
    type: number
    sql: concat(${TABLE}.comp_id, ${TABLE}.patient_id) ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: patient_id {
    hidden: yes
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${TABLE}.first_name, ${TABLE}.last_name) ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: date_of_birth {
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
    sql: ${TABLE}.date_of_birth ;;
    hidden: yes
  }

  dimension: age {
    type: number
    sql: datediff(year, ${date_of_birth_raw}, GETDATE()) ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [18, 19, 20,
      21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
      31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
      41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
      51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
      61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
      71, 72, 73, 74, 75, 76, 77, 78, 79, 80]
    style: integer
    sql: ${age} ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: last_visit {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_visit_date ;;
  }

  dimension: patient_type {
    type: string
    sql: ${TABLE}.patient_type ;;
  }

  dimension: has_phone_consent {
    type: yesno
    sql: ${TABLE}.has_phone_consent ;;
  }

  dimension: has_email_consent {
    type: yesno
    sql: ${TABLE}.has_email_consent ;;
  }

  dimension: top_purchased_brands {
    type: string
    sql: ${TABLE}.top_purchased_brands ;;
    value_format_name: usd
  }

  dimension: total_purchase_amount {
    type: number
    sql: ${TABLE}.total_purchase_amount ;;
    value_format_name: usd
  }

  dimension: offline_purchase_amount {
    type: number
    sql: ${TABLE}.offline_purchase_amount ;;
    value_format_name: usd
  }

  dimension: online_purchase_amount {
    type: number
    sql: ${TABLE}.online_purchase_amount ;;
    value_format_name: usd
  }

  measure: total_offline_purchase_amount {
    type: sum
    sql: ${offline_purchase_amount} ;;
    value_format_name: usd
  }

  measure: total_online_purchase_amount {
    type: sum
    sql: ${online_purchase_amount} ;;
    value_format_name: usd
  }

  dimension_group: min_order {
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
    sql: ${TABLE}.min_order_dt ;;
  }

  dimension_group: max_order {
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
    sql: ${TABLE}.max_order_dt ;;
  }

  dimension: lifetime_in_days {
    type: number
    sql: ${TABLE}.lifetime_in_days ;;
  }

  dimension: max_silent_period_in_days {
    type: number
    sql: ${TABLE}.max_silent_period_in_days ;;
  }

  dimension: max_order_amount {
    type: number
    sql: ${TABLE}.max_order_amount ;;
  }

  dimension: avg_order_amount {
    type: number
    sql: ${TABLE}.avg_order_amount ;;
  }

  dimension: avg_order_amount_tier {
    type: tier
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100,
      110, 120, 130, 140, 150, 160, 170, 180, 190, 200,
      210, 220, 230, 240, 250, 260, 270, 280, 290, 300]
    style: relational
    sql: ${avg_order_amount} ;;
  }

  dimension: distinct_offices_count {
    type: number
    sql: ${TABLE}.distinct_offices_count ;;
  }

  dimension: total_order_count {
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  dimension: avg_order_freq_in_days {
    type: number
    sql: ${TABLE}.avg_order_freq_in_days ;;
  }

  dimension: offline_order_count {
    type: number
    sql: ${TABLE}.offline_order_count ;;
  }

  dimension: online_order_count {
    type: number
    sql: ${TABLE}.online_order_count ;;
  }

  dimension: visited_offices_count {
    type: number
    sql: ${TABLE}.visited_offices_count ;;
  }

  dimension: monday_order_count {
    type: number
    sql: ${TABLE}.monday_order_count ;;
  }

  dimension: tuesday_order_count {
    type: number
    sql: ${TABLE}.tuesday_order_count ;;
  }

  dimension: wednesday_order_count {
    type: number
    sql: ${TABLE}.wednesday_order_count ;;
  }

  dimension: thursday_order_count {
    type: number
    sql: ${TABLE}.thursday_order_count ;;
  }

  dimension: friday_order_count {
    type: number
    sql: ${TABLE}.friday_order_count ;;
  }

  dimension: saturday_order_count {
    type: number
    sql: ${TABLE}.saturday_order_count ;;
  }

  dimension: sunday_order_count {
    type: number
    sql: ${TABLE}.sunday_order_count ;;
  }

  measure: total_monday_order_count {
    type: sum
    sql: ${monday_order_count} ;;
  }

  measure: total_tuesday_order_count {
    type: sum
    sql: ${tuesday_order_count} ;;
  }

  measure: total_wednesday_order_count {
    type: sum
    sql: ${wednesday_order_count} ;;
  }

  measure: total_thursday_order_count {
    type: sum
    sql: ${thursday_order_count} ;;
  }

  measure: total_friday_order_count {
    type: sum
    sql: ${friday_order_count} ;;
  }

  measure: total_saturday_order_count {
    type: sum
    sql: ${saturday_order_count} ;;
  }

  measure: total_sunday_order_count {
    type: sum
    sql: ${sunday_order_count} ;;
  }

  dimension: month_orders {
    type: number
    sql: CASE WHEN ${lifetime_in_days} = 1
          THEN 1
          ELSE CEILING(${total_order_count} / (${lifetime_in_days}/30.5))
          END;;
  }

  dimension: month_orders_tier {
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 6, 7, 10, 13]
    style: integer
    sql: ${month_orders};;
  }

  measure: patients_count {
    type: count
  }

}
