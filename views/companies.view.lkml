view: companies {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: test.stg_io__companies ;;

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.domain_prefix ;;
  }

  dimension: locations_count {
    type: number
    sql: ${TABLE}.locations_count ;;
  }

  dimension: is_chain {
    type: yesno
    sql: ${locations_count} > 1 ;;
  }
}
