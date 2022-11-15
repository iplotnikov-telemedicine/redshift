include: "/models/redshift.model.lkml"

test: order_item_id_is_unique {
  explore_source: order_items_with_details {
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
  explore_source: order_items_with_details {
    column: primary_key {}
    column: count_rows {}
    sorts: [order_items_with_details.count_rows: desc]
    limit: 1
  }
  assert: order_item_id_is_unique {
    expression: ${order_items_with_details.count_rows} = 1 ;;
  }
}
