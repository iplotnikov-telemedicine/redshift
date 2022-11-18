view: order_items_with_details {
  sql_table_name: test.order_items_with_details ;;

#---------------------------------------------------------
# FILTERS AND PARAMETRS
#---------------------------------------------------------

  filter: date_time_filter {
    # convert_tz: no
    type: date_time
    datatype: datetime
    sql: ${confirmed_date} between {% date_start date_time_filter %} and {% date_end date_time_filter %} ;;
  }

#---------------------------------------------------------
# ORIGINAL TABLE FEILDS AS DIMENSIONS
#---------------------------------------------------------

  dimension: account_name {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }
  dimension: office_name {
    type: string
    suggest_persist_for: "24 hours"
    sql: ${TABLE}.office_name ;;
  }
  dimension: office_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.office_id ;;
  }
  dimension: comp_id {
    # hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.comp_id ;;
  }
  dimension: id {
    type: number
    value_format_name: id
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: prod_sku {
    type: string
    sql: ${TABLE}.prod_sku ;;
  }
  dimension: descr {
    type: string
    sql: ${TABLE}.descr ;;
  }
  dimension: price_type {
    type: string
    sql: ${TABLE}.price_type ;;
  }
  dimension: price_per {
    type: string
    value_format_name: usd
    sql: ${TABLE}.price_per ;;
  }
  dimension: charge_by {
    type: string
    sql: ${TABLE}.charge_by ;;
  }
  dimension: product_cost {
    type: number
    alias: [price]
    value_format_name: usd
    sql: ${TABLE}.price ;;
  }
  dimension: quantity {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.qty ;;
  }
  dimension: quantity_free {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.qty_free ;;
  }
  dimension: amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount ;;
  }
  dimension: tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.tax ;;
  }
  dimension: order_sum_tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_sum_tax ;;
  }
  dimension: discount_value {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.discount_value ;;
  }
  dimension: discount_type_bak {
    type: string
    sql: ${TABLE}.discount_type_bak ;;
  }
  dimension: total_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_amount ;;
  }
  dimension: order_total_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_total_amount ;;
  }
  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }
  dimension: is_charge_by_order {
    type: yesno
    sql: ${TABLE}.is_charge_by_order ;;
  }
  dimension: is_free {
    type: yesno
    sql: ${TABLE}.is_free ;;
  }
  dimension: free_discount {
    type: number
    sql: ${TABLE}.free_discount ;;
  }
  dimension: income {
    type: number
    value_format_name: usd
    sql: ${TABLE}.income ;;
  }
  dimension: discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.discount_amount ;;
  }
  dimension: total_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_discount_amount ;;
  }
  dimension: item_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.item_discount_amount ;;
  }
  dimension: cart_discount_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.cart_discount_amount ;;
  }
  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }
  dimension: count {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.count ;;
  }
  dimension: special_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.special_id ;;
  }
  dimension: special_item_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.special_item_id ;;
  }
  dimension: is_half_eighth {
    type: yesno
    sql: ${TABLE}.is_half_eighth ;;
  }
  dimension: is_returned {
    type: yesno
    sql: ${TABLE}.is_returned ;;
  }
  dimension: returned_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.returned_amount ;;
  }
  dimension: discount_type {
    type: number
    value_format_name: id
    sql: ${TABLE}.discount_type ;;
  }
  dimension: free_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.free_amount ;;
  }
  dimension: paid_amount {
    type: number
    value_format_name:  usd
    sql: ${TABLE}.paid_amount ;;
  }
  dimension: wcii_cart_item {
    type: string
    value_format: ""
    sql: ${TABLE}.wcii_cart_item ;;
  }
  dimension_group: sync_created {
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
  dimension_group: sync_updated {
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
    sql: ${TABLE}.sync_updated_at ;;
  }
  dimension: product_checkin_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.product_checkin_id ;;
  }
  dimension: is_excise {
    type: yesno
    sql: ${TABLE}.is_excise ;;
  }
  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }
  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }
  dimension: product_is_tax_exempt {
    type: yesno
    sql: ${TABLE}.product_is_tax_exempt ;;
  }
  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }
  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }
  dimension: base_amount {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.base_amount ;;
  }
  dimension: discount_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.discount_id ;;
  }
  dimension: delivery_tax {
    type: number
    value_format_name: usd
    sql: ${TABLE}.delivery_tax ;;
  }
  dimension: discount_count {
    type: number
    value_format_name: usd
    sql: ${TABLE}.discount_count ;;
  }
  dimension: is_exchanged {
    type: yesno
    sql: ${TABLE}.is_exchanged ;;
  }
  dimension_group: exchanged {
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
    sql: ${TABLE}.exchanged_at ;;
  }
  dimension: product_brutto_weight {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.product_brutto_weight ;;
  }
  dimension: product_brutto_weight_validation {
    type: yesno
    sql: ${TABLE}.product_brutto_weight_validation ;;
  }
  dimension_group: confirmed {
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
  dimension: brand_name {
    type: string
    value_format: ""
    sql: ${TABLE}.brand_name ;;
  }
  dimension: product_direct_category {
    type: string
    value_format: ""
    sql: ${TABLE}.product_direct_category ;;
  }

  dimension: product_parent_category {
    type: string
    value_format: ""
    sql: ${TABLE}.product_parent_category ;;
  }
  dimension: product_sub_category_1 {
    type: string
    sql: ${TABLE}.product_sub_category_1 ;;
  }
  dimension: product_sub_category_2 {
    type: string
    value_format: ""
    sql: ${TABLE}.product_sub_category_2 ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }
  dimension: cashier_name {
    type: string
    sql: ${TABLE}.cashier_name ;;
  }
  dimension: patient_full_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_full_name ;;
  }
  dimension: patient_groups {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_groups ;;
  }
  dimension: patient_state_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_state_name ;;
  }
  dimension: patient_city_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_city_name ;;
  }
  dimension: patient_dmv {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_dmv ;;
  }
  dimension: patient_zip_name {
    type: string
    value_format: ""
    sql: ${TABLE}.patient_zip_name ;;
  }

#---------------------------------------------------------
# DERIVED DIMENSIONS
#---------------------------------------------------------

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${comp_id}, CONCAT(000, ${id})) ;;
  }
  dimension: unit_price {
    type: number
    sql: CASE ${count} WHEN 0 THEN 0 ELSE ${amount} / ${count} - ${item_discount_amount} END ;;
    value_format_name: usd
  }
  dimension: order_item_quantity {
    type: number
    sql: (${quantity} + ${quantity_free}) * ${count};;
    value_format_name: decimal_0
  }
  dimension: gross_sale {
    type: number
    sql: ${paid_amount} - ${tax} ;;
    value_format_name: usd
  }
  dimension: refund_wo_tax {
    type: number
    sql: CASE WHEN ${paid_amount} IS NOT NULL AND ${paid_amount} <> 0
          THEN ${returned_amount} - (${returned_amount} * ${tax}
          / coalesce(${paid_amount}, NULL))
          ELSE 0 END;;
    value_format_name: usd
  }
  dimension: net_sale {
    type: number
    sql: ${gross_sale} -  ${refund_wo_tax};;
    value_format_name: usd
  }
  dimension: cogs {
    type: number
    sql: ${product_cost} * ${order_item_quantity} ;;
    value_format_name: usd
  }
  dimension: profit {
    type: number
    sql: ${net_sale} - ${cogs};;
    value_format_name: usd
  }


#---------------------------------------------------------
# MEASURES
#---------------------------------------------------------
  measure: count_rows {
    type: count
  }
  measure: price_list {
    type: list
    list_field: amount
    value_format_name: usd
  }
  measure: amount_sum {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }
  measure: quantity_sum {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }
  measure: sum_cogs {
    type: sum
    sql: ${cogs} ;;
    value_format_name: usd
  }
  measure: sum_profit {
    type: sum
    sql: ${profit} ;;
    value_format_name: usd
  }
  measure: avg_unit_price {
    type: number
    sql:CASE WHEN ${quantity_sum} IS NOT NULL AND ${quantity_sum} <> 0
          THEN ${amount_sum} / coalesce(${quantity_sum}, NULL)
          ELSE Null END;;
    value_format_name: usd
  }
  measure: avg_unit_cogs{
    type: number
    sql: CASE WHEN ${quantity_sum} IS NOT NULL AND ${quantity_sum} <> 0
          THEN ${sum_cogs} / coalesce(${quantity_sum}, NULL)
          ELSE Null END;;
    value_format_name: usd
  }
  measure: sum_total_amount {
    type: sum
    value_format_name: usd
    sql: ${total_amount} ;;
  }
  measure: number_of_rows {
    type: count
    value_format_name: decimal_0
  }
  measure: sum_gross_sale {
    type: sum
    sql: ${gross_sale} ;;
    value_format_name: usd
  }
  measure: sum_order_item_quantity {
    type: sum
    sql: ${order_item_quantity} ;;
    value_format_name: decimal_0
  }
  measure: sum_order_item_quantity_returned {
    type: sum
    sql: ${order_item_quantity} ;;
    filters: [is_returned: "yes"]
    value_format_name: decimal_0
  }
  measure: sum_discount_amount {
    type: sum
    sql: ${discount_amount} ;;
    value_format_name: usd
  }
  measure: sum_refund_wo_tax {
    type: sum
    sql: ${refund_wo_tax} ;;
    value_format_name: usd
  }
  measure:  sum_net_sales {
    type: sum
    sql:  ${net_sale};;
    value_format_name: usd
  }
  measure: total_income {
    type: sum
    sql: ${income} ;;
    value_format_name: usd
  }
  measure: total_returned_amount {
    type: sum
    sql: ${returned_amount} ;;
    value_format_name: usd
  }
  measure: total_gross_margin_percent {
    type: number
    sql:CASE WHEN ${sum_profit} IS NOT NULL AND ${sum_profit} <> 0
          THEN ${sum_profit} / coalesce(${sum_net_sales}, NULL)
          ELSE Null END;;
    value_format_name: percent_1
  }


#---------------------------------------------------------
# FIELDS FOR DRILLING
#---------------------------------------------------------

}
