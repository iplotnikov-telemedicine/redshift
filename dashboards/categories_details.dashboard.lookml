- dashboard: categories_details
  title: Categories Details
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: XvG3IggOHdHqkJ71BnuiJh
  elements:
  - title: "% of Total Net Sales / Units"
    name: "% of Total Net Sales / Units"
    model: starter_pack
    explore: sales_details
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [category_revenue, order_items_with_details.sum_net_sales, order_items_with_details.sum_order_item_quantity,
      category_units]
    filters: {}
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${category_revenue}\
          \ / ${order_items_with_details.sum_net_sales}", label: "% Net Sales", value_format: !!null '',
        value_format_name: percent_1, _kind_hint: measure, table_calculation: net_sales,
        _type_hint: number, id: 61qIQYtD39}, {category: table_calculation, expression: "${category_units}\
          \ / ${order_items_with_details.sum_order_item_quantity}", label: "% Units",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: units, _type_hint: number, id: dXKKidxyYN}, {category: measure,
        expression: !!null '', label: Category Revenue, value_format: !!null '', value_format_name: !!null '',
        based_on: order_items_with_details.sum_net_sales, _kind_hint: measure, measure: category_revenue,
        type: sum, _type_hint: number, filters: {order_items_with_details.is_product_category_selected: 'yes'},
        id: KGhCet8Zw9}, {category: measure, expression: !!null '', label: Category
          Units, value_format: !!null '', value_format_name: !!null '', based_on: order_items_with_details.sum_order_item_quantity,
        _kind_hint: measure, measure: category_units, type: sum, _type_hint: number,
        filters: {order_items_with_details.is_product_category_selected: 'yes'}, id: nKB4LlXI60}]
    query_timezone: America/Los_Angeles
    hidden_fields: [category_revenue, order_items_with_details.sum_order_item_quantity,
      category_units, order_items_with_details.sum_net_sales]
    hidden_points_if_no: []
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
    show_view_names: false
    font_size_main: '17'
    orientation: auto
    title_placement_net_sales: below
    style_units: "#000000"
    show_title_units: true
    title_placement_units: below
    value_format_units: ''
    show_comparison_units: false
    style_revenue: "#000000"
    show_title_revenue: true
    title_placement_revenue: below
    value_format_revenue: ''
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items_with_details.sum_total_amount,
            id: order_items_with_details.sum_total_amount, name: Total Revenue}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: left, series: [
          {axisId: order_items_with_details.avg_unit_price, id: order_items_with_details.avg_unit_price,
            name: Avg Unit Price}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: order_items_with_details.sum_order_item_quantity, id: order_items_with_details.sum_order_item_quantity,
            name: Total Units}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: ''
    series_types: {}
    series_colors:
      order_items_with_details.sum_total_amount: "#348fff"
      order_items_with_details.sum_order_item_quantity: "#65cbc9"
      order_items_with_details.avg_unit_price: "#5e5e8c"
    defaults_version: 0
    title_hidden: true
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
      Date: order_items_with_details.confirmed_date
    row: 0
    col: 10
    width: 14
    height: 4
  - title: Percent of Net Sales
    name: Percent of Net Sales
    model: starter_pack
    explore: sales_details
    type: looker_column
    fields: [order_items_with_details.dimension_by_selector, order_items_with_details.sum_net_sales]
    filters: {}
    sorts: [order_items_with_details.sum_net_sales desc 0]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Running total of Percent
          of Net Sales, value_format: !!null '', value_format_name: percent_1, calculation_type: running_total,
        table_calculation: running_total_of_percent_of_net_sales, args: [percent_of_net_sales],
        _kind_hint: measure, _type_hint: number, id: osNVU4M2dR}, {category: table_calculation,
        label: Percent of Net Sales, value_format: !!null '', value_format_name: percent_1,
        calculation_type: percent_of_column_sum, table_calculation: percent_of_net_sales,
        args: [order_items_with_details.sum_net_sales], _kind_hint: measure, _type_hint: number,
        id: Ltop2Cxef4}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: percent_of_net_sales,
            id: percent_of_net_sales, name: Percent of Net Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: running_total_of_percent_of_net_sales,
            id: running_total_of_percent_of_net_sales, name: Running Sum}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: ''
    size_by_field: ''
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '80'
    series_types:
      running_total_of_order_items_with_details_sum_total_amount: area
      running_total_of_percent_of_order_items_with_details_sum_total_amount: area
      running_total_of_percent_of_net_sales: area
    series_colors:
      percent_of_order_items_with_details_sum_total_amount: "#05054e"
      running_total_of_order_items_with_details_sum_total_amount: "#58a7ff"
      running_total_of_percent_of_order_items_with_details_sum_total_amount: "#58a7ff"
      running_total_of_percent_of_net_sales: "#5eaafe"
      percent_of_net_sales: "#05054e"
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
      running_total_of_order_items_with_details_sum_total_amount: Running Sum
      running_total_of_percent_of_net_sales: Running Sum
    series_point_styles:
      running_total_of_order_items_with_details_sum_total_amount: auto
    label_color: []
    defaults_version: 1
    hidden_fields: [order_items_with_details.sum_net_sales]
    show_null_points: true
    interpolation: linear
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
      Date: order_items_with_details.confirmed_date
    row: 4
    col: 0
    width: 12
    height: 9
  - title: Monthly Sales
    name: Monthly Sales
    model: starter_pack
    explore: sales_details
    type: looker_column
    fields: [confirmed_month_number, order_items_with_details.sum_net_sales, order_items_with_details.confirmed_year]
    pivots: [order_items_with_details.confirmed_year]
    fill_fields: [order_items_with_details.confirmed_year]
    filters:
      order_items_with_details.confirmed_month: 24 months
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_year desc, confirmed_month_number]
    limit: 500
    dynamic_fields: [{category: dimension, expression: 'extract_months(${order_items_with_details.confirmed_raw})',
        label: Confirmed Month Number, value_format: !!null '', value_format_name: decimal_0,
        dimension: confirmed_month_number, _kind_hint: dimension, _type_hint: number,
        id: CzdmQnQhLb}, {category: table_calculation, expression: 'pivot_index(${order_items_with_details.sum_net_sales},
          1) / pivot_index(${order_items_with_details.sum_net_sales}, 2) - 1', label: YoY
          Growth, value_format: !!null '', value_format_name: percent_1, _kind_hint: supermeasure,
        table_calculation: yoy_growth, _type_hint: number, id: QEIhIniJei}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Net Sales, orientation: left, series: [{axisId: order_items_with_details.sum_net_sales,
            id: order_items_with_details.sum_net_sales, name: Sum Net Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: yoy_growth, id: yoy_growth,
            name: YoY Growth}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, type: linear}]
    x_axis_label: Month Number
    size_by_field: ''
    label_value_format: "[>1000000]$0.0,,\\M;[>1000]$0.0,\\K;"
    series_types:
      order_items_with_details.avg_unit_price: scatter
      yoy_growth: line
    series_colors:
      order_items_with_details.sum_total_amount: "#348fff"
      order_items_with_details.sum_order_item_quantity: "#65cbc9"
      order_items_with_details.avg_unit_price: "#5e5e8c"
      2022 - order_items_with_details.sum_net_sales: "#65cbc9"
      2021 - order_items_with_details.sum_net_sales: "#3590ff"
      yoy_growth: "#000000"
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      2022 - order_items_with_details.sum_net_sales: This Year
      2021 - order_items_with_details.sum_net_sales: Previous Year
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 4
    col: 12
    width: 12
    height: 9
  - title: Net Sales Ranking
    name: Net Sales Ranking
    model: starter_pack
    explore: sales_details
    type: looker_grid
    fields: [order_items_with_details.sum_net_sales, order_items_with_details.brand_name,
      order_items_with_details.confirmed_month]
    pivots: [order_items_with_details.confirmed_month]
    filters:
      order_items_with_details.is_benchmark_month: 'Yes'
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_month desc, order_items_with_details.sum_net_sales
        desc 0]
    limit: 500
    dynamic_fields: [{category: dimension, expression: 'extract_months(${order_items_with_details.confirmed_raw})',
        label: Confirmed Month Number, value_format: !!null '', value_format_name: decimal_0,
        dimension: confirmed_month_number, _kind_hint: dimension, _type_hint: number,
        id: CzdmQnQhLb}, {category: table_calculation, expression: 'pivot_index(${order_items_with_details.sum_net_sales},
          1) / pivot_index(${order_items_with_details.sum_net_sales}, 2) - 1', label: YoY
          Growth, value_format: !!null '', value_format_name: percent_1, _kind_hint: supermeasure,
        table_calculation: yoy_growth, _type_hint: number, id: QEIhIniJei, is_disabled: true},
      {category: table_calculation, label: Rank, value_format: !!null '', value_format_name: !!null '',
        calculation_type: rank_of_column, table_calculation: rank, args: [order_items_with_details.sum_net_sales],
        _kind_hint: measure, _type_hint: number, id: XqPbZ7D3ra}, {category: table_calculation,
        expression: 'pivot_index(${rank}, 2) - pivot_index(${rank}, 1)', label: Movement
          (Month), value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: movement_month, _type_hint: number, id: vdcJJ7mpNc}, {
        category: table_calculation, expression: 'pivot_index(${rank}, 3) - pivot_index(${rank},
          1)', label: Movement (Year), value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: movement_year, _type_hint: number,
        id: s17MSMkvAm}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items_with_details.sum_net_sales,
            id: 2022 - order_items_with_details.sum_net_sales, name: 2022 - Order
              Items with Details Sum Net Sales}, {axisId: order_items_with_details.sum_net_sales,
            id: 2021 - order_items_with_details.sum_net_sales, name: 2021 - Order
              Items with Details Sum Net Sales}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: yoy_growth, id: yoy_growth, name: YoY Growth}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: ''
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    label_value_format: "[>1000000]$0.0,,\\M;[>1000]$0.0,\\K;"
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items_with_details.sum_total_amount: "#348fff"
      order_items_with_details.sum_order_item_quantity: "#65cbc9"
      order_items_with_details.avg_unit_price: "#5e5e8c"
      2022 - order_items_with_details.sum_net_sales: "#65cbc9"
      2021 - order_items_with_details.sum_net_sales: "#3590ff"
      yoy_growth: "#000000"
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      2022 - order_items_with_details.sum_net_sales: This Year
      2021 - order_items_with_details.sum_net_sales: Previous Year
      rank_of_order_items_with_details_sum_net_sales: Rank
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      movement_month: 154
      movement_year: 137
    series_cell_visualizations:
      order_items_with_details.sum_net_sales:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#81BE56",
        font_color: !!null '', color_application: {collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d,
          palette_id: 6dda4f8b-4e73-4e50-8760-eb378041ce07, options: {steps: 5, reverse: true,
            constraints: {mid: {type: average}}}}, bold: false, italic: false, strikethrough: false,
        fields: [rank]}]
    series_value_format:
      movement_month: '[>0]"▲"#;[<0]"▼"-#;-'
      movement_year: '[>0]"▲"#;[<0]"▼"-#;-'
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 13
    col: 0
    width: 14
    height: 18
  - title: Net Sales YTD
    name: Net Sales YTD
    model: starter_pack
    explore: sales_details
    type: single_value
    fields: [order_items_with_details.sum_net_sales, order_items_with_details.confirmed_year]
    pivots: [order_items_with_details.confirmed_year]
    fill_fields: [order_items_with_details.confirmed_year]
    filters:
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_year desc]
    column_limit: 2
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${order_items_with_details.sum_net_sales},
          2)', label: Last Year, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: last_year, _type_hint: number,
        id: TKn1eHAasu, is_disabled: true}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    single_value_title: Net Sales YTD
    value_format: "[<1000]$0.00;[<1000000]$0.0,\\K;$0.0,,\\M"
    comparison_label: Last Year
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: Concentrates
              - order_items_with_details.sum_total_amount, id: Concentrates - order_items_with_details.sum_total_amount,
            name: Concentrates}, {axisId: Cultivation - order_items_with_details.sum_total_amount,
            id: Cultivation - order_items_with_details.sum_total_amount, name: Cultivation},
          {axisId: Edibles - order_items_with_details.sum_total_amount, id: Edibles
              - order_items_with_details.sum_total_amount, name: Edibles}, {axisId: Flower
              - order_items_with_details.sum_total_amount, id: Flower - order_items_with_details.sum_total_amount,
            name: Flower}, {axisId: Gear - order_items_with_details.sum_total_amount,
            id: Gear - order_items_with_details.sum_total_amount, name: Gear}, {axisId: Other
              - order_items_with_details.sum_total_amount, id: Other - order_items_with_details.sum_total_amount,
            name: Other}, {axisId: Topicals - order_items_with_details.sum_total_amount,
            id: Topicals - order_items_with_details.sum_total_amount, name: Topicals},
          {axisId: Vape Pens - order_items_with_details.sum_total_amount, id: Vape
              Pens - order_items_with_details.sum_total_amount, name: Vape Pens},
          {axisId: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            id: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            name: No category}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    size_by_field: ''
    series_types: {}
    series_colors: {}
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 13
    col: 14
    width: 5
    height: 5
  - title: Net Sales MTD
    name: Net Sales MTD
    model: starter_pack
    explore: sales_details
    type: single_value
    fields: [order_items_with_details.sum_net_sales, order_items_with_details.confirmed_month]
    pivots: [order_items_with_details.confirmed_month]
    fill_fields: [order_items_with_details.confirmed_month]
    filters:
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_month desc]
    column_limit: 2
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    single_value_title: Net Sales MTD
    value_format: "[<1000]$0.00;[<1000000]$0.0,\\K;$0.0,,\\M"
    comparison_label: Last Month
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: Concentrates
              - order_items_with_details.sum_total_amount, id: Concentrates - order_items_with_details.sum_total_amount,
            name: Concentrates}, {axisId: Cultivation - order_items_with_details.sum_total_amount,
            id: Cultivation - order_items_with_details.sum_total_amount, name: Cultivation},
          {axisId: Edibles - order_items_with_details.sum_total_amount, id: Edibles
              - order_items_with_details.sum_total_amount, name: Edibles}, {axisId: Flower
              - order_items_with_details.sum_total_amount, id: Flower - order_items_with_details.sum_total_amount,
            name: Flower}, {axisId: Gear - order_items_with_details.sum_total_amount,
            id: Gear - order_items_with_details.sum_total_amount, name: Gear}, {axisId: Other
              - order_items_with_details.sum_total_amount, id: Other - order_items_with_details.sum_total_amount,
            name: Other}, {axisId: Topicals - order_items_with_details.sum_total_amount,
            id: Topicals - order_items_with_details.sum_total_amount, name: Topicals},
          {axisId: Vape Pens - order_items_with_details.sum_total_amount, id: Vape
              Pens - order_items_with_details.sum_total_amount, name: Vape Pens},
          {axisId: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            id: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            name: No category}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    size_by_field: ''
    series_types: {}
    series_colors: {}
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 18
    col: 14
    width: 5
    height: 5
  - title: Units YTD
    name: Units YTD
    model: starter_pack
    explore: sales_details
    type: single_value
    fields: [order_items_with_details.confirmed_year, order_items_with_details.sum_order_item_quantity]
    pivots: [order_items_with_details.confirmed_year]
    fill_fields: [order_items_with_details.confirmed_year]
    filters:
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_year desc]
    column_limit: 2
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    single_value_title: Units YTD
    comparison_label: Last Year
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: Concentrates
              - order_items_with_details.sum_total_amount, id: Concentrates - order_items_with_details.sum_total_amount,
            name: Concentrates}, {axisId: Cultivation - order_items_with_details.sum_total_amount,
            id: Cultivation - order_items_with_details.sum_total_amount, name: Cultivation},
          {axisId: Edibles - order_items_with_details.sum_total_amount, id: Edibles
              - order_items_with_details.sum_total_amount, name: Edibles}, {axisId: Flower
              - order_items_with_details.sum_total_amount, id: Flower - order_items_with_details.sum_total_amount,
            name: Flower}, {axisId: Gear - order_items_with_details.sum_total_amount,
            id: Gear - order_items_with_details.sum_total_amount, name: Gear}, {axisId: Other
              - order_items_with_details.sum_total_amount, id: Other - order_items_with_details.sum_total_amount,
            name: Other}, {axisId: Topicals - order_items_with_details.sum_total_amount,
            id: Topicals - order_items_with_details.sum_total_amount, name: Topicals},
          {axisId: Vape Pens - order_items_with_details.sum_total_amount, id: Vape
              Pens - order_items_with_details.sum_total_amount, name: Vape Pens},
          {axisId: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            id: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            name: No category}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    size_by_field: ''
    series_types: {}
    series_colors: {}
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 13
    col: 19
    width: 5
    height: 5
  - title: Units MTD
    name: Units MTD
    model: starter_pack
    explore: sales_details
    type: single_value
    fields: [order_items_with_details.confirmed_month, order_items_with_details.sum_order_item_quantity]
    pivots: [order_items_with_details.confirmed_month]
    fill_fields: [order_items_with_details.confirmed_month]
    filters:
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.confirmed_month desc]
    column_limit: 2
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    single_value_title: Units MTD
    comparison_label: Last Month
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: Concentrates
              - order_items_with_details.sum_total_amount, id: Concentrates - order_items_with_details.sum_total_amount,
            name: Concentrates}, {axisId: Cultivation - order_items_with_details.sum_total_amount,
            id: Cultivation - order_items_with_details.sum_total_amount, name: Cultivation},
          {axisId: Edibles - order_items_with_details.sum_total_amount, id: Edibles
              - order_items_with_details.sum_total_amount, name: Edibles}, {axisId: Flower
              - order_items_with_details.sum_total_amount, id: Flower - order_items_with_details.sum_total_amount,
            name: Flower}, {axisId: Gear - order_items_with_details.sum_total_amount,
            id: Gear - order_items_with_details.sum_total_amount, name: Gear}, {axisId: Other
              - order_items_with_details.sum_total_amount, id: Other - order_items_with_details.sum_total_amount,
            name: Other}, {axisId: Topicals - order_items_with_details.sum_total_amount,
            id: Topicals - order_items_with_details.sum_total_amount, name: Topicals},
          {axisId: Vape Pens - order_items_with_details.sum_total_amount, id: Vape
              Pens - order_items_with_details.sum_total_amount, name: Vape Pens},
          {axisId: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            id: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            name: No category}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    size_by_field: ''
    series_types: {}
    series_colors: {}
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 18
    col: 19
    width: 5
    height: 5
  - title: Packages Sizes
    name: Packages Sizes
    model: starter_pack
    explore: sales_details
    type: looker_column
    fields: [total_quantity_groups, order_items_with_details.sum_net_sales, order_items_with_details.sum_profit,
      order_items_with_details.sum_order_item_quantity]
    filters:
      order_items_with_details.price_type: weight
      order_items_with_details.item_type: prepack,gram
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.sum_order_item_quantity desc 0]
    column_limit: 2
    dynamic_fields: [{category: dimension, expression: "if(${order_items_with_details.quantity}\
          \ = 0,\n  ${order_items_with_details.quantity_free}, ${order_items_with_details.quantity})",
        label: Total Quantity, value_format: !!null '', value_format_name: !!null '',
        dimension: total_quantity, _kind_hint: dimension, _type_hint: number, id: IJBqJHtamT},
      {category: dimension, description: '', label: Total Quantity Groups, value_format: !!null '',
        value_format_name: !!null '', calculation_type: group_by, dimension: total_quantity_groups,
        args: [total_quantity, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 7g, filter: '7'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 3.5g, filter: '3.5'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 28g, filter: '28'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 21g, filter: '21'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 14g, filter: '14'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 1g, filter: '1'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 5g, filter: '5'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 2g, filter: '2'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 3g, filter: '3'}], Other], _kind_hint: dimension, _type_hint: string,
        id: e9DtXaWz7R}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: order_items_with_details.sum_net_sales,
            id: order_items_with_details.sum_net_sales, name: Total Revenue}, {axisId: order_items_with_details.sum_profit,
            id: order_items_with_details.sum_profit, name: Total Gross Margin}], showLabels: false,
        showValues: true, valueFormat: "[<1000]$0.00;[<1000000]$0.0,\\K;$0.0,,\\M",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: order_items_with_details.sum_order_item_quantity,
            id: order_items_with_details.sum_order_item_quantity, name: Total Units}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Unit
    size_by_field: ''
    series_types: {}
    series_colors:
      order_items_with_details.sum_net_sales: "#3590ff"
      order_items_with_details.sum_profit: "#05054e"
      order_items_with_details.sum_order_item_quantity: "#65cbc9"
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
      order_items_with_details.sum_net_sales: Net Sales
      order_items_with_details.sum_profit: Total Gross Margin
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Units YTD
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Year
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 23
    col: 14
    width: 10
    height: 8
  - title: TOP Products
    name: TOP Products
    model: starter_pack
    explore: sales_details
    type: looker_grid
    fields: [order_items_with_details.brand_name, order_items_with_details.product_name,
      order_items_with_details.product_parent_category, order_items_with_details.vendor_name,
      order_items_with_details.sum_net_sales, order_items_with_details.sum_order_item_quantity,
      order_items_with_details.sum_profit, order_items_with_details.gross_margin_percent,
      order_items_with_details.avg_unit_price, order_items_with_details.avg_cost_per_unit]
    filters:
      order_items_with_details.is_product_category_selected: 'Yes'
    sorts: [order_items_with_details.sum_net_sales desc]
    limit: 20
    dynamic_fields: [{category: dimension, expression: 'extract_months(${order_items_with_details.confirmed_raw})',
        label: Confirmed Month Number, value_format: !!null '', value_format_name: decimal_0,
        dimension: confirmed_month_number, _kind_hint: dimension, _type_hint: number,
        id: CzdmQnQhLb}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", order_items_with_details.product_name, order_items_with_details.product_parent_category,
      order_items_with_details.vendor_name, order_items_with_details.brand_name, order_items_with_details.sum_net_sales,
      order_items_with_details.sum_order_item_quantity, order_items_with_details.sum_profit,
      order_items_with_details.gross_margin_percent, order_items_with_details.avg_unit_price,
      order_items_with_details.avg_cost_per_unit, order_items_with_details.sum_quantity]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      2022 - order_items_with_details.sum_net_sales: This Year
      2021 - order_items_with_details.sum_net_sales: Previous Year
      rank_of_order_items_with_details_sum_net_sales: Rank
      order_items_with_details.brand_name: Brand
      order_items_with_details.product_name: Product Name
      order_items_with_details.product_parent_category: Category
      order_items_with_details.vendor_name: Vendor
      order_items_with_details.sum_quantity: Total Weight
      order_items_with_details.sum_net_sales: Net Sales
      order_items_with_details.sum_profit: Total Gross Margin
      order_items_with_details.gross_margin_percent: Total Gross Margin Percent
      order_items_with_details.avg_unit_price: Average Item Price
      order_items_with_details.avg_cost_per_unit: Average Cost per Unit
    series_column_widths:
      movement_month: 154
      movement_year: 137
      order_items_with_details.product_name: 273
    series_cell_visualizations:
      order_items_with_details.sum_net_sales:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#81BE56",
        font_color: !!null '', color_application: {collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d,
          palette_id: 6dda4f8b-4e73-4e50-8760-eb378041ce07, options: {steps: 5, reverse: true,
            constraints: {mid: {type: average}}}}, bold: false, italic: false, strikethrough: false,
        fields: []}]
    series_value_format:
      movement_month: '[>0]"▲"#;[<0]"▼"-#;-'
      movement_year: '[>0]"▲"#;[<0]"▼"-#;-'
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items_with_details.sum_net_sales,
            id: 2022 - order_items_with_details.sum_net_sales, name: 2022 - Order
              Items with Details Sum Net Sales}, {axisId: order_items_with_details.sum_net_sales,
            id: 2021 - order_items_with_details.sum_net_sales, name: 2021 - Order
              Items with Details Sum Net Sales}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, type: linear}, {label: '', orientation: right,
        series: [{axisId: yoy_growth, id: yoy_growth, name: YoY Growth}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: ''
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    label_value_format: "[>1000000]$0.0,,\\M;[>1000]$0.0,\\K;"
    series_types: {}
    point_style: circle_outline
    series_colors:
      order_items_with_details.sum_total_amount: "#348fff"
      order_items_with_details.sum_order_item_quantity: "#65cbc9"
      order_items_with_details.avg_unit_price: "#5e5e8c"
      2022 - order_items_with_details.sum_net_sales: "#65cbc9"
      2021 - order_items_with_details.sum_net_sales: "#3590ff"
      yoy_growth: "#000000"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Store: order_items_with_details.office_name
      Category: order_items_with_details.product_category_picker
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
    row: 31
    col: 0
    width: 24
    height: 9
  - title: New Tile
    name: New Tile
    model: starter_pack
    explore: sales_details
    type: single_value
    fields: [order_items_with_details.selected_category]
    filters: {}
    sorts: [order_items_with_details.selected_category]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    single_value_title: Selected Category
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Total Revenue, orientation: left, series: [{axisId: Concentrates
              - order_items_with_details.sum_total_amount, id: Concentrates - order_items_with_details.sum_total_amount,
            name: Concentrates}, {axisId: Cultivation - order_items_with_details.sum_total_amount,
            id: Cultivation - order_items_with_details.sum_total_amount, name: Cultivation},
          {axisId: Edibles - order_items_with_details.sum_total_amount, id: Edibles
              - order_items_with_details.sum_total_amount, name: Edibles}, {axisId: Flower
              - order_items_with_details.sum_total_amount, id: Flower - order_items_with_details.sum_total_amount,
            name: Flower}, {axisId: Gear - order_items_with_details.sum_total_amount,
            id: Gear - order_items_with_details.sum_total_amount, name: Gear}, {axisId: Other
              - order_items_with_details.sum_total_amount, id: Other - order_items_with_details.sum_total_amount,
            name: Other}, {axisId: Topicals - order_items_with_details.sum_total_amount,
            id: Topicals - order_items_with_details.sum_total_amount, name: Topicals},
          {axisId: Vape Pens - order_items_with_details.sum_total_amount, id: Vape
              Pens - order_items_with_details.sum_total_amount, name: Vape Pens},
          {axisId: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            id: order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount,
            name: No category}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    size_by_field: ''
    series_types: {}
    series_colors: {}
    series_labels:
      order_items_with_details.sum_total_amount: Total Revenue
      order_items_with_details.sum_order_item_quantity: Total Units
      order_items_with_details.product_parent_category___null - order_items_with_details.sum_total_amount: No
        category
    defaults_version: 1
    listen:
      Category: order_items_with_details.product_category_picker
      Store: order_items_with_details.office_name
      Summarize by: order_items_with_details.dimension_picker
      Account Name: order_items_with_details.account_name
      Date: order_items_with_details.confirmed_date
    row: 0
    col: 0
    width: 10
    height: 4
  filters:
  - name: Account Name
    title: Account Name
    type: field_filter
    default_value: kushagram
    allow_multiple_values: true
    required: true
    ui_config:
      type: tag_list
      display: popover
    model: starter_pack
    explore: sales_details
    listens_to_filters: []
    field: order_items_with_details.account_name
  - name: Date
    title: Date
    type: field_filter
    default_value: this month
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: starter_pack
    explore: sales_details
    listens_to_filters: []
    field: order_items_with_details.confirmed_date
  - name: Store
    title: Store
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: starter_pack
    explore: sales_details
    listens_to_filters: [Account Name]
    field: order_items_with_details.office_name
  - name: Category
    title: Category
    type: field_filter
    default_value: Concentrates
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: popover
    model: starter_pack
    explore: sales_details
    listens_to_filters: [Account Name]
    field: order_items_with_details.product_category_picker
  - name: Summarize by
    title: Summarize by
    type: field_filter
    default_value: Brand
    allow_multiple_values: true
    required: true
    ui_config:
      type: button_toggles
      display: inline
      options:
      - Brand
      - Vendor
    model: starter_pack
    explore: sales_details
    listens_to_filters: []
    field: order_items_with_details.dimension_picker
