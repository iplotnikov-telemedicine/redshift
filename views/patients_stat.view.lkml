# The name of this view in Looker is "Patients Stat"
view: patients_stat {

  sql_table_name: marts.patients_stat ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.comp_id, ${TABLE}.patient_id) ;;
    hidden: yes
  }

  dimension: avg_order_amount {
    type: number
    sql: ${TABLE}.avg_order_amount ;;
  }

  dimension: avg_order_amount_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100,
      110, 120, 130, 140, 150, 160, 170, 180, 190, 200,
      210, 220, 230, 240, 250]
    style: integer
    sql: ${avg_order_amount} ;;
  }

  dimension: avg_order_freq_in_days {
    type: number
    sql: ${TABLE}.avg_order_freq_in_days ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: state_name {
    map_layer_name: us_states
    sql: ${TABLE}.state_name ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
    # hidden: yes
  }

  dimension: comp_name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_date ;;
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

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: friday_order_count {
    type: number
    sql: ${TABLE}.friday_order_count ;;
  }

  dimension: gender {
    type: string
    case: {
      when: {
        sql: ${TABLE}.gender in ('Male', 'M', 'male') ;;
        label: "Male"
      }
      when: {
        sql: ${TABLE}.gender in ('Female', 'F', 'female') ;;
        label: "Female"
      }
      else: "Unspecified"
    }
    alpha_sort: yes
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_visit {
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
    sql: ${TABLE}.last_visit_date ;;
  }

  dimension: lifetime_in_days {
    type: number
    sql: ${TABLE}.lifetime_in_days ;;
  }

  dimension: max_order_amount {
    type: number
    sql: ${TABLE}.max_order_amount ;;
  }

  dimension_group: max_order_dt {
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

  dimension: max_silent_period_in_days {
    type: number
    sql: ${TABLE}.max_silent_period_in_days ;;
  }

  dimension_group: min_order_dt {
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

  dimension: offline_order_count {
    type: number
    sql: ${TABLE}.offline_order_count ;;
  }

  dimension: offline_purchase_amount {
    type: number
    sql: ${TABLE}.offline_purchase_amount ;;
    value_format_name: usd
  }

  measure: total_offline_purchase_amount {
    type: sum
    sql: ${offline_purchase_amount} ;;
    value_format_name: usd
  }

  dimension: online_order_count {
    type: number
    sql: ${TABLE}.online_order_count ;;
  }

  dimension: online_purchase_amount {
    type: number
    sql: ${TABLE}.online_purchase_amount ;;
    value_format_name: usd
  }

  measure: total_online_purchase_amount {
    type: sum
    sql: ${online_purchase_amount} ;;
    value_format_name: usd
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
    # hidden: yes
  }

  dimension: top_purchased_brands {
    type: string
    sql: ${TABLE}.top_purchased_brands ;;
  }

  dimension: top_dispensaries {
    type: string
    sql: ${TABLE}.top_dispensaries ;;
  }

  dimension: total_order_count {
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  dimension: month_orders {
    type: number
    sql: CASE WHEN ${patients_stat.lifetime_in_days} = 1
          THEN 1
          ELSE CEILING(${patients_stat.total_order_count} / (${patients_stat.lifetime_in_days}/30.5))
          END;;
  }

  dimension: month_orders_tier {
    type: tier
    tiers: [0, 1, 2, 3, 4, 5, 6, 7, 10, 13]
    style: integer
    sql: ${month_orders};;
  }

  dimension: total_purchase_amount {
    type: number
    sql: ${TABLE}.total_purchase_amount ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: patients_count {
    type: count
  }

  measure: patients_count_all_comp {
    type: count_distinct
    sql: ${primary_key};;
  }

}
