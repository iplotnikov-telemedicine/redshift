view: monthly_orders_group_stat {
  sql_table_name: test.monthly_orders_group_stat ;;

    dimension: report_month {
      description: ""
      type: date
      sql: ${TABLE}.report_month ;;
    }

    dimension: comp_id {
      description: ""
      type: number
      sql: ${TABLE}.comp_id ;;
    }

    dimension: domain_prefix {
      description: ""
      type: string
      sql: ${TABLE}.domain_prefix ;;
    }

    dimension: patient_orders_group {
      description: ""
      type: tier
      tiers: [0, 4, 7, 10, 13]
      style: integer
      sql: ${TABLE}.patient_orders_group ;;
    }

    measure: patients {
      description: ""
      type: sum
      sql: ${TABLE}.patients ;;
    }

    measure: orders {
      description: ""
      type: sum
      sql: ${TABLE}.orders ;;
    }

    measure: unique_products {
      description: ""
      type: average
      sql: ${TABLE}.unique_products ;;
    }

    measure: unique_categories {
      description: ""
      type: average
      sql: ${TABLE}.unique_categories ;;
    }

    measure: unique_brands {
      description: ""
      type: average
      sql: ${TABLE}.unique_brands ;;
    }

    measure: order_items {
      description: ""
      type: sum
      sql: ${TABLE}.order_items ;;
    }

    measure: order_net_sales {
      description: ""
      type: sum
      sql: ${TABLE}.order_net_sales ;;
    }

}
