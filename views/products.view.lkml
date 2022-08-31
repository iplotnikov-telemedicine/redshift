# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: staging.products ;;

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.comp_id, ${TABLE}.prod_id) ;;
    hidden: yes
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
    # hidden: yes
  }

  dimension: prod_backend_product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.prod_backend_product_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brand ID" in Explore.

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_product_strain_name {
    type: string
    sql: ${TABLE}.brand_product_strain_name ;;
  }

  dimension: brutto_weight {
    type: number
    sql: ${TABLE}.brutto_weight ;;
  }

  dimension: brutto_weight_validation {
    type: yesno
    sql: ${TABLE}.brutto_weight_validation ;;
  }

  dimension: custom_cost {
    type: number
    sql: ${TABLE}.custom_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_custom_cost {
    type: sum
    sql: ${custom_cost} ;;
  }

  measure: average_custom_cost {
    type: average
    sql: ${custom_cost} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: directions {
    type: string
    sql: ${TABLE}.directions ;;
  }

  dimension: ingredients {
    type: string
    sql: ${TABLE}.ingredients ;;
  }

  dimension: is_city_local_tax_exempt {
    type: yesno
    sql: ${TABLE}.is_city_local_tax_exempt ;;
  }

  dimension: is_marijuana_product {
    type: yesno
    sql: ${TABLE}.is_marijuana_product ;;
  }

  dimension: is_metrc {
    type: yesno
    sql: ${TABLE}.is_metrc ;;
  }

  dimension: is_metrc_compliant {
    type: yesno
    sql: ${TABLE}.is_metrc_compliant ;;
  }

  dimension: is_only_each {
    type: yesno
    sql: ${TABLE}.is_only_each ;;
  }

  dimension: is_preroll {
    type: yesno
    sql: ${TABLE}.is_preroll ;;
  }

  dimension: is_tax_exempt {
    type: yesno
    sql: ${TABLE}.is_tax_exempt ;;
  }

  dimension: is_under_package_control {
    type: yesno
    sql: ${TABLE}.is_under_package_control ;;
  }

  dimension: lab_result_id {
    type: number
    sql: ${TABLE}.lab_result_id ;;
  }

  dimension: marijuana_product_type {
    type: yesno
    sql: ${TABLE}.marijuana_product_type ;;
  }

  dimension: net_weight {
    type: number
    sql: ${TABLE}.net_weight ;;
  }

  dimension: net_weight_measure {
    type: yesno
    sql: ${TABLE}.net_weight_measure ;;
  }

  dimension: potify_brand_product_id {
    type: number
    sql: ${TABLE}.potify_brand_product_id ;;
  }

  dimension: potify_id {
    type: number
    sql: ${TABLE}.potify_id ;;
  }

  dimension: preroll_weight {
    type: number
    sql: ${TABLE}.preroll_weight ;;
  }

  dimension: prod_balance {
    type: number
    sql: ${TABLE}.prod_balance ;;
  }

  dimension: prod_category_id {
    type: number
    sql: ${TABLE}.prod_category_id ;;
  }

  dimension: prod_descr {
    type: string
    sql: ${TABLE}.prod_descr ;;
  }

  dimension: prod_eighth_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_eighth_prepack_qty_o ;;
  }

  dimension: prod_eighth_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_eighth_prepack_qty_w ;;
  }

  dimension: prod_gram_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_gram_prepack_qty_o ;;
  }

  dimension: prod_gram_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_gram_prepack_qty_w ;;
  }

  dimension: prod_half_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_half_prepack_qty_o ;;
  }

  dimension: prod_half_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_half_prepack_qty_w ;;
  }

  dimension: prod_id {
    type: number
    sql: ${TABLE}.prod_id ;;
  }

  dimension: prod_is_custom_price {
    type: yesno
    sql: ${TABLE}.prod_is_custom_price ;;
  }

  dimension: prod_is_excise {
    type: yesno
    sql: ${TABLE}.prod_is_excise ;;
  }

  dimension: prod_is_free_shipping {
    type: yesno
    sql: ${TABLE}.prod_is_free_shipping ;;
  }

  dimension: prod_is_hidden {
    type: yesno
    sql: ${TABLE}.prod_is_hidden ;;
  }

  dimension: prod_is_on_shop {
    type: yesno
    sql: ${TABLE}.prod_is_on_shop ;;
  }

  dimension: prod_is_on_weedmaps {
    type: yesno
    sql: ${TABLE}.prod_is_on_weedmaps ;;
  }

  dimension: prod_is_print_label {
    type: yesno
    sql: ${TABLE}.prod_is_print_label ;;
  }

  dimension: prod_is_tax_included {
    type: yesno
    sql: ${TABLE}.prod_is_tax_included ;;
  }

  dimension: prod_is_taxable {
    type: yesno
    sql: ${TABLE}.prod_is_taxable ;;
  }

  dimension: prod_joint_cost {
    type: number
    sql: ${TABLE}.prod_joint_cost ;;
  }

  dimension: prod_joints_qty_o {
    type: number
    sql: ${TABLE}.prod_joints_qty_o ;;
  }

  dimension: prod_joints_qty_w {
    type: number
    sql: ${TABLE}.prod_joints_qty_w ;;
  }

  dimension: prod_lab_type {
    type: string
    sql: ${TABLE}.prod_lab_type ;;
  }

  dimension: prod_name {
    type: string
    sql: ${TABLE}.prod_name ;;
  }

  dimension: last_extract_from_name {
    type: string
    sql: SUBSTRING_INDEX(${products.prod_name}, '- ', -1) ;;
  }

  dimension: first_extract_from_name {
    type: string
    sql: SUBSTRING_INDEX(${products.prod_name}, '- ', 1) ;;
  }

  dimension: test_regexp {
    type: string
    sql: ${last_extract_from_name} REGEXP BINARY '[A-Z]' ;;
  }

  dimension: prod_ounce_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_ounce_prepack_qty_o ;;
  }

  dimension: prod_ounce_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_ounce_prepack_qty_w ;;
  }

  dimension: prod_photo {
    type: string
    sql: ${TABLE}.prod_photo ;;
  }

  dimension: prod_price {
    type: number
    sql: ${TABLE}.prod_price ;;
    value_format_name: usd
  }

  dimension: prod_price_preset_id {
    type: number
    sql: ${TABLE}.prod_price_preset_id ;;
  }

  dimension: prod_price_type {
    type: string
    sql: ${TABLE}.prod_price_type ;;
  }

  dimension: prod_qty_o {
    type: number
    sql: ${TABLE}.prod_qty_o ;;
  }

  dimension: prod_qty_w {
    type: number
    sql: ${TABLE}.prod_qty_w ;;
  }

  dimension: prod_quarter_prepack_qty_o {
    type: number
    sql: ${TABLE}.prod_quarter_prepack_qty_o ;;
  }

  dimension: prod_quarter_prepack_qty_w {
    type: number
    sql: ${TABLE}.prod_quarter_prepack_qty_w ;;
  }

  dimension: prod_sku {
    type: string
    sql: ${TABLE}.prod_sku ;;
  }

  dimension: prod_symbol {
    type: string
    sql: ${TABLE}.prod_symbol ;;
  }

  dimension: prod_tax_id_bak {
    type: number
    value_format_name: id
    sql: ${TABLE}.prod_tax_id_bak ;;
  }

  dimension: prod_tax_profile_id {
    type: number
    sql: ${TABLE}.prod_tax_profile_id ;;
  }

  dimension: prod_tax_tier_version_id {
    type: number
    sql: ${TABLE}.prod_tax_tier_version_id ;;
  }

  dimension: prod_tv_photo {
    type: string
    sql: ${TABLE}.prod_tv_photo ;;
  }

  dimension: prod_upc {
    type: string
    sql: ${TABLE}.prod_upc ;;
  }

  dimension: prod_vendor_id {
    type: number
    sql: ${TABLE}.prod_vendor_id ;;
  }

  dimension: product_class {
    type: string
    sql: ${TABLE}.product_class ;;
  }

  dimension: product_type_id {
    type: number
    sql: ${TABLE}.product_type_id ;;
  }

  dimension: show_on_leafly {
    type: yesno
    sql: ${TABLE}.show_on_leafly ;;
  }

  dimension: strain {
    type: yesno
    sql: ${TABLE}.strain ;;
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

  dimension: twcc {
    type: number
    sql: ${TABLE}.twcc ;;
  }

  dimension: wm_product_id {
    type: number
    sql: ${TABLE}.wm_product_id ;;
  }

  measure: count {
    type: count
    # drill_fields: [prod_backend_product_id, brand_product_strain_name, prod_name]
  }
}
