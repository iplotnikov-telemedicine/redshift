view: products_with_details {
  sql_table_name: test.int_products_with_details ;;

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: direct_category {
    type: string
    sql: ${TABLE}.direct_category ;;
  }

  dimension: net_weight {
    type: number
    sql: ${TABLE}.net_weight ;;
  }

  dimension: parent_category {
    type: string
    sql: coalesce(${TABLE}.parent_category, 'Unknown') ;;
  }

  dimension: prod_cost {
    type: number
    sql: ${TABLE}.prod_cost ;;
    value_format_name: usd
  }

  measure: total_prod_cost {
    type: sum
    sql: ${prod_cost} ;;
    value_format_name: usd
  }

  measure: average_prod_cost {
    type: average
    sql: ${prod_cost} ;;
    value_format_name: usd
  }

  dimension: prod_id {
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: prod_sku {
    type: string
    sql: ${TABLE}.prod_sku ;;
  }

  dimension: strain_type {
    type: string
    sql: ${TABLE}.strain_type ;;
  }

  dimension: strain_name {
    type: string
    sql: ${TABLE}.strain_name ;;
  }

  dimension: sub_category_1 {
    type: string
    sql: ${TABLE}.sub_category_1 ;;
  }

  dimension: sub_category_2 {
    type: string
    sql: ${TABLE}.sub_category_2 ;;
  }

  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }

  dimension: vendor_id {
    type: number
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }

  measure: count {
    type: count
    drill_fields: [vendor_name, brand_name, prod_name]
  }
}
