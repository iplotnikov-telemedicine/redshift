# The name of this view in Looker is "Patients Stat"
view: patients_stat {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: marts.patients_stat ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Order Amount" in Explore.

  dimension: avg_order_amount {
    type: number
    sql: ${TABLE}.avg_order_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_avg_order_amount {
  #   type: sum
  #   sql: ${avg_order_amount} ;;
  # }

  # measure: average_avg_order_amount {
  #   type: average
  #   sql: ${avg_order_amount} ;;
  # }

  dimension: avg_order_freq_in_days {
    type: number
    sql: ${TABLE}.avg_order_freq_in_days ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
    hidden: yes
  }

  dimension: comp_name {
    type: string
    sql: ${TABLE}.comp_name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: distinct_offices_count {
    type: number
    sql: ${TABLE}.distinct_offices_count ;;
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
    sql: ${TABLE}.gender ;;
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

  dimension: monday_order_count {
    type: number
    sql: ${TABLE}.monday_order_count ;;
  }

  dimension: offline_order_count {
    type: number
    sql: ${TABLE}.offline_order_count ;;
  }

  dimension: offline_purchase_amount {
    type: number
    sql: ${TABLE}.offline_purchase_amount ;;
  }

  dimension: online_order_count {
    type: number
    sql: ${TABLE}.online_order_count ;;
  }

  dimension: online_purchase_amount {
    type: number
    sql: ${TABLE}.online_purchase_amount ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
    hidden: yes
  }

  dimension: saturday_order_count {
    type: number
    sql: ${TABLE}.saturday_order_count ;;
  }

  dimension: sunday_order_count {
    type: number
    sql: ${TABLE}.sunday_order_count ;;
  }

  dimension: thursday_order_count {
    type: number
    sql: ${TABLE}.thursday_order_count ;;
  }

  dimension: top_purchased_brands {
    type: string
    sql: ${TABLE}.top_purchased_brands ;;
  }

  dimension: total_order_count {
    type: number
    sql: ${TABLE}.total_order_count ;;
  }

  dimension: total_purchase_amount {
    type: number
    sql: ${TABLE}.total_purchase_amount ;;
  }

  dimension: tuesday_order_count {
    type: number
    sql: ${TABLE}.tuesday_order_count ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: visited_offices_count {
    type: number
    sql: ${TABLE}.visited_offices_count ;;
  }

  dimension: wednesday_order_count {
    type: number
    sql: ${TABLE}.wednesday_order_count ;;
  }

  measure: count {
    type: count
  }
}
