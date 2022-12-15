view: product_transactions {
  sql_table_name: test.stg_io__product_transactions ;;

  dimension: surrogate_key {
    primary_key: yes
    type: number
    sql: CONCAT(${comp_id}::varchar, ${id}::varchar) ;;
  }

  dimension: comp_id {
    # hidden: yes
    type: number
    sql:${TABLE}.comp_id;;
  }

  dimension: id {
    type: number
    sql:${TABLE}.id;;
  }

  dimension: base_weight {
    type: number
    sql: ${TABLE}.base_weight ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: date_for_dynamics_start {
    convert_tz: no
    type: date_time
    sql: TIMESTAMP(${date_date});;
  }

  dimension: date_for_dynamics_end {
    convert_tz: no
    type: date_time
    sql: TIMESTAMP(date_add(${date_date}, interval 1 day));;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: doctor_id {
    type: number
    sql: ${TABLE}.doctor_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: item_type_multiplier {
    type: string
    sql:
      CASE ${item_type}
      WHEN 'gram' THEN 1
      WHEN 'pp_eighth' THEN 3.5
      WHEN 'pp_quarter' THEN 7
      WHEN 'pp_half' THEN 14
      WHEN 'pp_ounce' THEN 28
      WHEN 'joint' THEN 1
      ELSE 1 end ;;
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }

  dimension: qty_free {
    type: number
    sql: ${TABLE}.qty_free ;;
  }

  dimension: qty_total {
    type: number
    sql: ${qty} + ${qty_free} ;;
  }

  dimension: item_qty {
    type: number
    sql: ${qty_total}*${item_type_multiplier} ;;
  }

  measure: quantity_sold {
    type: sum
    sql: ${item_qty} ;;
    filters: [is_sold: "yes"]
  }

  dimension: is_checked_in {
    type: yesno
    sql: ${TABLE}.type = 1;;
  }

  measure: quantity_checked_in {
    type: sum
    sql:  ${item_qty} ;;
    filters: [is_checked_in: "yes"]
  }

  dimension: is_adjustment_increase {
    type: yesno
    sql: ${TABLE}.type in (12, 15) ;;
  }

  dimension: is_adjustment_decrease {
    type: yesno
    sql: ${TABLE}.type in (13, 16) ;;
  }

  dimension: is_sold {
    type: yesno
    sql: ${TABLE}.type = 3;;
  }

  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.type = 9;;
  }

  dimension: is_unlinked {
    description: "Transferred to another product"
    type: yesno
    sql: ${TABLE}.type = 10;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: office_id {
    type: number
    sql:${TABLE}.office_id;;
    # CASE ${dataset}
    #   WHEN 'main' THEN ${TABLE}.office_id
    #   ELSE ${TABLE}.office_to_id END;;
  }

  dimension: office_to_id {
    type: number
    sql:${TABLE}.office_to_id;;
    # CASE ${dataset}
    #   WHEN 'main' THEN ${TABLE}.office_to_id
    #   ELSE NULL END;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: usd
  }

  dimension: price_per_unit {
    type: number
    sql: ${price} / ${item_qty} ;;
    value_format_name: usd
  }

  dimension: price_per {
    type: string
    sql: ${TABLE}.price_per ;;
  }

  dimension: product_checkin_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_checkin_id ;;
  }

  dimension: product_checkin_to_id {
    type: number
    sql: ${TABLE}.product_checkin_to_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_to_id {
    type: number
    sql: ${TABLE}.product_to_id ;;
  }

  dimension: product_to_name {
    type: string
    sql: ${TABLE}.product_to_name ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
    value_format_name: usd
  }

  dimension: transfer_direction {
    type: string
    sql: ${TABLE}.transfer_direction ;;
  }

  dimension: transaction_type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension: transaction_type_name {
    type: string
    sql: CASE ${transaction_type}
            WHEN 3 THEN 'Sale'
            WHEN 9 THEN 'Return'
            END ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: number_of_product_transaction {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      product_name,
      product_to_name,
      products.prod_name,
      products.wm_product_id,
      products.brand_product_strain_name,
      product_checkins.id,
      product_checkins.vendor_name,
      account_transaction.count,
      adjustment.count
    ]
  }
}
