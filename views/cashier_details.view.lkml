# If necessary, uncomment the line below to include explore_source.
# include: "redshift.model.lkml"

view: cashier_details {
  derived_table: {
    explore_source: order_items_with_details {
      column: office_name {}
      column: cashier_name {}
      column: sum_net_sales {}
      column: sum_order_item_quantity {}
      column: orders_count {}
      column: avg_ticket {}
      filters: {
        field: order_items_with_details.confirmed_date
        value: "7 days"
      }
      filters: {
        field: order_items_with_details.account_name
        value: "kushagram"
      }
      filters: {
        field: order_items_with_details.product_category_picker
        value: "Concentrates"
      }
      filters: {
        field: order_items_with_details.office_name
        value: "Articuno 2.0 (SC),Arcanine 2 OD (LB),CHARMANDER 2 OD (SC),Cerulean City (Pizza #2) (SC)"
      }
    }
  }
  dimension: office_name {
    description: ""
  }
  dimension: cashier_name {
    description: ""
    html: {{ cashier_name._rendered_value }} ;;
  }
  dimension: sum_net_sales {
    description: ""
    value_format: "$#,##0.00"
    type: number
  }
  dimension: sum_order_item_quantity {
    description: ""
    value_format: "#,##0"
    type: number
  }
  dimension: orders_count {
    description: ""
    type: number
  }
  dimension: avg_ticket {
    description: ""
    type: number
    value_format_name: usd
    html: Average Basket: {{ avg_ticket._rendered_value }} ;;

  }
  measure: total_units_new {
    description: ""
    type: sum
    sql: ${sum_order_item_quantity} ;;
    html:
    <br>
    Total units: {{ rendered_value }} <br>
    Basket Count: {{ orders_count._rendered_value }}
    ;;
  }
}
