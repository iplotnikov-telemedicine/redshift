view: daily_inventory {
  sql_table_name: test.daily_inventory ;;

  dimension: number_of_days_filtered {
    type: number
    sql: datediff(days, {% date_start report_date_date %},{% date_end report_date_date %}) ;;
  }

  filter: date_time_filter {
    convert_tz: no
    type: date_time
    datatype: datetime
  }

  dimension: is_filtered_range {
    type: yesno
    sql: ${TABLE}.report_date  between {% date_start date_time_filter %} and DATEADD(day,-1,{% date_end date_time_filter %}) ;;
  }

  dimension: primary_key {
    primary_key:  yes
    sql: CONCAT(${TABLE}.report_date, CONCAT(${TABLE}.comp_id, CONCAT(${TABLE}.office_id, ${TABLE}.product_id))) ;;
  }

  dimension_group: report_date {
    datatype: date
    timeframes: [date, week, month, year]
    description: ""
    type: time
    sql: ${TABLE}.report_date ;;
  }

  dimension: comp_id {
    description: ""
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: account_name {
    description: ""
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: office_id {
    description: ""
    type: number
    sql: ${TABLE}.office_id ;;
  }

  dimension: office_name {
    description: ""
    suggest_persist_for: "24 hours"
    type: string
    sql: ${TABLE}.office_name;;
  }

  dimension: product_id {
    description: ""
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: prod_name {
    description: ""
    type: string
    sql: ${TABLE}.prod_name;;
  }

  dimension: brand_id {
    description: ""
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    description: ""
    type: string
    sql: ${TABLE}.brand_name;;
  }

  dimension: direct_category {
    description: ""
    type: string
    sql: ${TABLE}.direct_category;;
  }

  dimension: parent_category {
    description: ""
    type: string
    sql: ${TABLE}.parent_category;;
  }

  dimension: sub_category_1 {
    description: ""
    type: string
    sql: ${TABLE}.sub_category_1;;
  }

  dimension: sub_category_2 {
    description: ""
    type: string
    sql: ${TABLE}.sub_category_2;;
  }

  measure: check_in {
    description: ""
    type: sum
    sql: ${TABLE}.check_in ;;
  }

  measure: transfer_in {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_in ;;
  }

  measure: transfer_out {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_out ;;
  }

  measure: transfer_in_another_product {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_in_another_product ;;
  }

  measure: transfer_out_another_product {
    description: ""
    type: sum
    sql: ${TABLE}.transfer_out_another_product ;;
  }

  measure: adjusted_increase {
    description: ""
    type: sum
    sql: ${TABLE}.adjusted_increase ;;
  }

  measure: adjusted_decrease {
    description: ""
    type: sum
    sql: ${TABLE}.adjusted_decrease ;;
  }

  measure: sell {
    description: ""
    type: sum
    sql: ${TABLE}.sell ;;
  }

  measure: return {
    description: ""
    type: sum
    sql: ${TABLE}.return ;;
  }

  measure: inventory_turnover {
    description: ""
    type: sum
    sql: ${TABLE}.inventory_turnover ;;
  }

  measure: end_of_day_inventory {
    description: ""
    type: sum
    sql: ${TABLE}.end_of_day_inventory ;;
  }
}
