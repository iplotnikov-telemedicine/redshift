view: inventory_current {
  sql_table_name: test.inventory_current ;;

  dimension: primary_key {
    primary_key:  yes
    sql: CONCAT(${comp_id}, CONCAT(${office_id}, ${product_id})) ;;
  }
  dimension: comp_id {
    description: ""
    type: number
  }
  dimension: office_id {
    description: ""
    type: number
  }
  dimension: product_id {
    description: ""
    type: number
  }
  dimension: brand_id {
    description: ""
    type: number
  }
  dimension: account_name {
    description: ""
    type: string
    sql: ${TABLE}.domain_prefix;;
  }
  dimension: office_name {
    description: ""
    suggest_persist_for: "24 hours"
    type: string
  }
  dimension: prod_name {
    alias: [product_name]
    description: ""
    type: string
  }
  dimension: brand_name {
    description: ""
    type: string
  }
  dimension: vendor_name {
    description: ""
    type: string
  }
  dimension: unit {
    description: ""
    type: string
  }
  dimension: prod_cost {
    alias: [product_cost]
    description: ""
    type: number
    value_format_name: usd
  }
  dimension: direct_category {
    description: ""
    type: string
  }
  dimension: parent_category {
    description: ""
    type: string
    sql: coalesce(${TABLE}.parent_category, 'Unknown') ;;
  }
  dimension: sub_category_1 {
    description: ""
    type: string
  }
  dimension: sub_category_2 {
    description: ""
    type: string
  }
  dimension: inventory_current {
    description: ""
    type: number
  }
  measure: count_rows {
    type: count
  }
  measure: sum_inventory_current {
    type: sum
    sql: ${TABLE}.inventory_current ;;
    value_format_name: decimal_2
  }
}
