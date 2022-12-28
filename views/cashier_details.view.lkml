# # If necessary, uncomment the line below to include explore_source.
# include: "redshift.model.lkml"

# If necessary, uncomment the line below to include explore_source.
# include: "starter_pack.model.lkml"

view: cashier_details {
  derived_table: {
    explore_source: order_items_with_details {
      column: account_name {}
      column: office_name {}
      column: cashier_name {}
      column: sum_net_sales {}
      column: sum_order_item_quantity {}
      column: avg_ticket {}
      bind_filters: {
        from_field: cashier_details.confirmed_date
        to_field: order_items_with_details.confirmed_date
      }
      bind_filters: {
        from_field: cashier_details.brand_name
        to_field: order_items_with_details.brand_name
      }
      bind_filters: {
        from_field: cashier_details.product_name
        to_field: order_items_with_details.product_name
      }
      bind_filters: {
        from_field: cashier_details.account_name
        to_field: order_items_with_details.account_name
      }
      bind_filters: {
        from_field: cashier_details.office_name
        to_field: order_items_with_details.office_name
      }
    }
  }
  filter: confirmed_date {
    type: date
    description: ""
  }
  filter: brand_name {
    type: string
    description: ""
  }
  filter: product_name {
    type: string
    description: ""
  }
  dimension: account_name {
    description: ""
  }
  dimension: office_name {
    description: ""
  }
  dimension: cashier_name {
    description: ""
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
  dimension: avg_ticket {
    label: "Average Ticket"
    description: ""
    value_format_name: usd
    type: number
  }
  # measure: total_net_sales {
  #   description: ""
  #   type: sum
  #   sql: ${sum_net_sales} ;;
  # }
  # measure: total_units {
  #   description: ""
  #   type: sum
  #   sql: ${sum_order_item_quantity} ;;
  # }

}


# view: cashier_details {
#   derived_table: {
#     explore_source: order_items_with_details {
#       column: confirmed_date {}
#       column: account_name {}
#       column: office_name {}
#       column: cashier_name {}
#       column: sum_net_sales {}
#       column: sum_order_item_quantity {}
#       column: orders_count {}
#       derived_column: avg_ticket {
#         sql:  sum_net_sales / sum_order_item_quantity ;;
#       }
#       bind_filters: {
#         to_field: order_items_with_details.account_name
#         from_field: cashier_details.account_name
#       }
#       bind_filters: {
#         to_field: order_items_with_details.office_name
#         from_field: cashier_details.office_name
#       }
#       # bind_filters: {
#       #   to_field: order_items_with_details.date_time_filter
#       #   from_field: cashier_details.date_time_filter

#     }
#   }
#   dimension: confirmed_date {
#     description: ""
#     type: date
#   }
#   dimension: account_name {
#     description: ""
#   }
#   dimension: office_name {
#     description: ""
#   }
#   dimension: cashier_name {
#     description: ""
#     html: {{ cashier_name._rendered_value }} ;;
#   }
#   dimension: sum_net_sales {
#     description: ""
#     value_format: "$#,##0.00"
#     type: number
#   }
#   dimension: sum_order_item_quantity {
#     description: ""
#     value_format: "#,##0"
#     type: number
#   }
#   dimension: orders_count {
#     description: ""
#     type: number
#   }
#   dimension: avg_ticket {
#     description: ""
#     type: number
#     value_format_name: usd
#     html: Average Basket: {{ avg_ticket._rendered_value }} ;;
#   }
#   measure: total_net_sales {
#     description: ""
#     type: sum
#     sql: ${sum_net_sales} ;;
#   }
#   measure: total_units {
#     description: ""
#     type: sum
#     sql: ${sum_order_item_quantity} ;;
#     html:
#     <br>
#     Total units: {{ rendered_value }} <br>
#     Basket Count: {{ orders_count._rendered_value }}
#     ;;
#   }
#   # measure: avg_ticket {
#   #   description: ""
#   #   type: number
#   #   sql:  ${sum_net_sales} / ${sum_order_item_quantity} ;;
#   #   html: Average Basket: {{ avg_ticket._rendered_value }} ;;
#   # }
# }
