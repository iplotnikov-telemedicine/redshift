view: inventory_weekly_by_category {
   derived_table: {
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*10)/(60*60*24));;
    # Replace the "10" with the hour of day you would like the regeneration to occur
    distribution_style: even
    sortkeys:["report_at_week"]
    explore_source: inventory_daily_wo_access_filter {

      column: comp_id {field: inventory_daily.comp_id}
      column: account_name {field: inventory_daily.account_name}
      column: office_id {field: inventory_daily.office_id}
      column: office_name {field: inventory_daily.office_name}
      column: parent_category {field: inventory_daily.parent_category}
      column: report_at_week {field: inventory_daily.report_at_week}
      column: inventory_turnover {field: inventory_daily.inventory_turnover}
      column: sum_order_item_quantity {field: order_items_with_details.sum_order_item_quantity}
      column: sum_net_sales {field: order_items_with_details.sum_net_sales}
      column: sum_cogs {field: order_items_with_details.sum_cogs}
      column: avg_unit_price {field: order_items_with_details.avg_unit_price}
      column: avg_unit_cogs {field: order_items_with_details.avg_unit_cogs}

      derived_column: inventory {
        sql: SUM(inventory_turnover) OVER (PARTITION BY office_id, parent_category
            ORDER BY report_at_week  ROWS UNBOUNDED PRECEDING) ;;
      }
      derived_column: max_date {
        sql: max(report_at_week) OVER (PARTITION BY office_id, parent_category);;
      }
    }
  }

  dimension: comp_id {
    type: number
  }
  dimension: account_name {
    type: string
  }
  dimension: office_id {
    type: number
    value_format_name: id
  }
  dimension: office_name {
    type: string
  }
  dimension: parent_category {
    type: string
  }
  dimension: report_at_week {
    convert_tz: no
    type: date
  }
  dimension: time_period {
    type: string
    sql: CASE ${report_at_week}
          WHEN cast(date_trunc('week', CURRENT_DATE-1) as date) THEN 'Current Week'
          WHEN cast(date_trunc('week', CURRENT_DATE-8) as date) THEN '1 week Ago'
          WHEN cast(date_trunc('week', CURRENT_DATE-29) as date) THEN '4 Week Ago'
          WHEN cast(date_trunc('week', CURRENT_DATE-85) as date) THEN '12 Week Ago'
          ELSE 'Other' END ;;
  }
  dimension: is_latest_date {
    type: yesno
    sql:  ${TABLE}.max_date = ${TABLE}.report_at_week;;
  }
  dimension: inventory {
    type: number
    value_format_name: decimal_0
  }
  measure: sum_inventory {
    type: sum
    value_format_name: decimal_0
    sql: ${TABLE}.inventory  ;;
  }
  measure: sum_order_item_quantity {
    type: sum
    value_format_name: decimal_0
  }
  measure: sum_net_sales {
    type: sum
    value_format_name: usd
  }
  measure: sum_cogs {
    type: sum
    value_format_name: usd
  }
  measure: avg_unit_price {
    type: average
    value_format_name: usd
  }
  measure: avg_unit_cogs {
    type: average
    value_format_name: usd
  }
}
