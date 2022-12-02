include: "/models/headset_reports.model.lkml"

test: sales_details_id_is_unique {
  explore_source: sales_details {
    column: primary_key {}
    column: count_rows {}
    sorts: [order_items_with_details.count_rows: desc]
    limit: 1
  }
  assert: order_item_id_is_unique {
    expression: ${order_items_with_details.count_rows} = 1 ;;
  }
}

test: daily_inventory_id_is_unique {
  explore_source: daily_inventory {
    column: primary_key {}
    column: count_rows {}
    sorts: [daily_inventory.count_rows: desc]
    limit: 1
  }
  assert: daily_inventory_id_is_unique {
    expression: ${daily_inventory.count_rows} = 1 ;;
  }
}

# test: inventory_current_id_is_unique {
#   explore_source: inventory_current {
#     column: primary_key {}
#     column: count_rows {}
#     sorts: [inventory_current.count_rows: desc]
#     limit: 1
#   }
#   assert: inventory_current_id_is_unique {
#     expression: ${inventory_current.count_rows} = 1 ;;
#   }
# }