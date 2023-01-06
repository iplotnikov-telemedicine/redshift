# The name of this view in Looker is "Stg Io Discounts"
view: discounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: test.stg_io__discounts ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: primary_key {
    primary_key: yes
    type: string
    sql: CONCAT(${comp_id}, ${id}) ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Apply Type" in Explore.

  dimension: apply_type {
    type: string
    sql: ${TABLE}.apply_type ;;
  }

  dimension: bogo_buy {
    type: number
    sql: ${TABLE}.bogo_buy ;;
  }

  dimension: bogo_get {
    type: number
    sql: ${TABLE}.bogo_get ;;
  }

  dimension: bogo_multiple {
    type: yesno
    sql: ${TABLE}.bogo_multiple ;;
  }


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: display_priority {
    type: number
    sql: ${TABLE}.display_priority ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: COALESCE(${TABLE}.end_date, CASE WHEN ${TABLE}.start_date IS NOT NULL THEN CURRENT_DATE END) ;;
  }

  # dimension: is_ongoing {
  #   type: yesno
  #   sql: ${TABLE}.start_date IS NOT NULL AND ${TABLE}.end_date IS NULL ;;

  # }

  dimension: is_promotion_period {
    type: yesno
    sql:
      {% if name._is_filtered %}
        ${order_items_with_details.confirmed_date} >= ${discounts.start_date} AND ${order_items_with_details.confirmed_date} <= ${discounts.end_date}
      {% else %}
        'No'
      {% endif %} ;;
  }

  dimension: promotion_days {
    type: number
    sql: datediff(day, ${start_date}, ${end_date}) + 1 ;;
  }

  dimension: is_observation_period {
    type: yesno
    sql:
      {% if name._is_filtered %}
        ${order_items_with_details.confirmed_date} between dateadd(day, -${promotion_days}, ${start_date}) and dateadd(day, ${promotion_days}, ${end_date})
      {% else %}
        'Yes'
      {% endif %} ;;
  }

  dimension: is_lookback_period {
    type: yesno
    sql: ${order_items_with_details.confirmed_date} >= dateadd(day, -${promotion_days}, ${start_date})
          and ${order_items_with_details.confirmed_date} < ${start_date}
       ;;
  }

  dimension: is_lookforward_period {
    type: yesno
    sql:
      {% if name._is_filtered %}
        ${order_items_with_details.confirmed_date} <= dateadd(day, ${promotion_days}, ${end_date})
          and ${order_items_with_details.confirmed_date} > ${end_date}
      {% else %}
        'No'
      {% endif %} ;;
  }

  dimension: is_this_discount_applied {
    type: yesno
    sql: ${order_items_with_details.discount_id} = ${id} ;;
  }

  dimension: happy_weekdays {
    type: string
    sql: ${TABLE}.happy_weekdays ;;
  }

  dimension: hide_banner {
    type: yesno
    sql: ${TABLE}.hide_banner ;;
  }

  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
  }

  dimension: is_exclude_items_on_special {
    type: yesno
    sql: ${TABLE}.is_exclude_items_on_special ;;
  }

  dimension: is_first_time_patient {
    type: yesno
    sql: ${TABLE}.is_first_time_patient ;;
  }

  dimension: is_individual_use_only {
    type: yesno
    sql: ${TABLE}.is_individual_use_only ;;
  }

  dimension: is_once_per_patient {
    type: yesno
    sql: ${TABLE}.is_once_per_patient ;;
  }

  dimension: is_ongoing {
    type: yesno
    sql: ${TABLE}.is_ongoing ;;
  }

  dimension: is_pos {
    type: yesno
    sql: ${TABLE}.is_pos ;;
  }

  dimension: is_potify {
    type: yesno
    sql: ${TABLE}.is_potify ;;
  }

  dimension: is_show_name_on_collection_tile {
    type: yesno
    sql: ${TABLE}.is_show_name_on_collection_tile ;;
  }

  dimension: is_show_promo_code_on_potify {
    type: yesno
    sql: ${TABLE}.is_show_promo_code_on_potify ;;
  }

  dimension: max_subtotal_price {
    type: number
    sql: ${TABLE}.max_subtotal_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_max_subtotal_price {
    type: sum
    sql: ${max_subtotal_price} ;;
  }

  measure: average_max_subtotal_price {
    type: average
    sql: ${max_subtotal_price} ;;
  }

  dimension: min_subtotal_price {
    type: number
    sql: ${TABLE}.min_subtotal_price ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_filter_id {
    type: number
    sql: ${TABLE}.product_filter_id ;;
  }

  dimension: promo_code {
    type: string
    sql: ${TABLE}.promo_code ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: sync_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_created_at ;;
  }

  dimension_group: sync_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sync_updated_at ;;
  }

  dimension: tv_image {
    type: string
    sql: ${TABLE}.tv_image ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: use_type {
    type: string
    sql: ${TABLE}.use_type ;;
  }

  dimension: uses_count {
    type: number
    sql: ${TABLE}.uses_count ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, display_name]
  }
}
