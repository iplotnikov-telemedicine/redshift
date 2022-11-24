view: inventory_current {
  derived_table: {
    explore_source: inventory_daily {
      column: comp_id {}
      column: account_name {}
      column: office_id {}
      column: office_name {}
      column: product_id {}
      column: prod_name {}
      column: brand_id {}
      column: brand_name {}
      column: direct_category {}
      column: parent_category {}
      column: sub_category_1 {}
      column: sub_category_2 {}
      column: inventory_turnover {}
    }
  }

  dimension: primary_key {
    primary_key:  yes
    sql: CONCAT(${comp_id}, CONCAT(${office_id}, ${product_id})) ;;
  }

  dimension: comp_id {
    description: ""
    type: number
  }

  dimension: account_name {
    description: ""
    type: string
  }

  dimension: office_id {
    description: ""
    type: number
  }

  dimension: office_name {
    description: ""
    suggest_persist_for: "24 hours"
    type: string
  }

  dimension: product_id {
    description: ""
    type: number
  }

  dimension: prod_name {
    alias: [product_name]
    description: ""
    type: string
  }

  dimension: brand_id {
    description: ""
    type: number
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

  measure: inventory_turnover {
    description: ""
    type: sum
  }
}
