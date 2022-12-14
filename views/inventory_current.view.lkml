view: inventory_current {
  derived_table: {
    sql:
      select
          comp_id,
          office_id,
          product_id,
          max(brand_id) as brand_id,
          max(domain_prefix) as account_name,
          max(office_name) as office_name,
          max(prod_name) as prod_name,
          max(brand_name) as brand_name,
          max(direct_category) as direct_category,
          max(parent_category) as parent_category,
          max(sub_category_1) as sub_category_1,
          max(sub_category_2) as sub_category_2,
          sum(inventory_turnover) as inventory_turnover
      from test.daily_inventory
      group by 1,2,3
    ;;
  }

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
  dimension: direct_category {
    description: ""
    type: string
  }
  dimension: parent_category {
    description: ""
    type: string
  }
  dimension: sub_category_1 {
    description: ""
    type: string
  }
  dimension: sub_category_2 {
    description: ""
    type: string
  }
  measure: count_rows {
    type: count
  }
  measure: inventory_turnover {
    description: ""
    type: sum
  }
}
