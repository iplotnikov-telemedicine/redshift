view: product_categories {
  sql_table_name: staging.product_categories ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.comp_id, ${TABLE}.id) ;;
    hidden: yes
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
    # hidden: yes
  }

  dimension: activation_time {
    type: string
    sql: ${TABLE}.activation_time ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: icon_color {
    type: string
    sql: ${TABLE}.icon_color ;;
  }

  dimension: icon_name {
    type: string
    sql: ${TABLE}.icon_name ;;
  }

  dimension: is_system {
    type: yesno
    sql: ${TABLE}.is_system ;;
  }

  dimension: label_template_internal_id {
    type: number
    sql: ${TABLE}.label_template_internal_id ;;
  }

  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }

  dimension: lft {
    type: number
    sql: ${TABLE}.lft ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: photo {
    type: string
    sql: ${TABLE}.photo ;;
  }

  dimension: rgt {
    type: number
    sql: ${TABLE}.rgt ;;
  }

  dimension_group: created {
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

  dimension_group: updated {
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

  dimension: system_id {
    type: string
    sql: ${TABLE}.system_id ;;
  }

  measure: number_of_product_categories {
    type: count
    drill_fields: [id, name, icon_name]
  }
}
