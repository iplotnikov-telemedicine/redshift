# If necessary, uncomment the line below to include explore_source.
# include: "redshift.model.lkml"

view: patient_metrics {
  derived_table: {
    explore_source: patients {
      column: comp_id { field: order_items_with_details.comp_id }
      column: patient_id { field: order_items_with_details.patient_id }
      column: avg_items_per_order { field: order_items_with_details.avg_items_per_order }
      bind_all_filters: yes
    }
  }
  dimension: comp_id {
    description: ""
    type: number
  }
  dimension: patient_id {
    description: ""
    type: number
  }
  dimension: avg_items_per_order {
    description: ""
    type: number

  }
}
