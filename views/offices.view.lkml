view: offices {
  sql_table_name: test.stg_io__offices ;;

  dimension: office_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.office_id ;;
  }
  dimension: office_comp_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.office_comp_id ;;
  }
  dimension: office_name {
    type: string
    suggest_persist_for: "24 hours"
    sql: ${TABLE}.office_name ;;
  }
  dimension: office_descr {
    type: string
    sql: ${TABLE}.office_descr ;;
  }
  dimension: office_state {
    type: string
    sql: ${TABLE}.office_state ;;
  }
  dimension: office_city {
    type: string
    sql: ${TABLE}.office_city ;;
  }
  dimension: office_zip {
    type: number
    value_format_name: id
    sql: ${TABLE}.office_zip ;;
  }
  dimension: office_address {
    type: string
    sql: ${TABLE}.office_address ;;
  }
  dimension: office_phone {
    type: string
    sql: ${TABLE}.office_phone ;;
  }
  dimension: office_fax {
    type: string
    sql: ${TABLE}.office_fax ;;
  }
  dimension: office_access_ip {
    type: string
    sql: ${TABLE}.office_access_ip ;;
  }
  dimension: office_is_active {
    type: yesno
    sql: ${TABLE}.office_is_active ;;
  }
  dimension: office_password {
    type: string
    sql: ${TABLE}.office_password ;;
  }
  dimension: office_friend_new_price {
    type: number
    sql: ${TABLE}.office_friend_new_price ;;
  }
  dimension: office_friend_renewal_price {
    type: number
    sql: ${TABLE}.office_friend_renewal_price ;;
  }
  dimension: office_lastactivity {
    type: string
    sql: ${TABLE}.office_lastactivity ;;
  }
  dimension: office_is_approved {
    type: yesno
    sql: ${TABLE}.office_is_approved ;;
  }
  dimension: office_gmaps_lng {
    type: number
    sql: ${TABLE}.office_gmaps_lng ;;
  }
  dimension: office_gmaps_lat {
    type: number
    sql: ${TABLE}.office_gmaps_lat ;;
  }
  dimension: office_verification_phone {
    type: string
    sql: ${TABLE}.office_verification_phone ;;
  }
  dimension: office_verification_site {
    type: string
    sql: ${TABLE}.office_verification_site ;;
  }
  dimension: office_appointments_enabled {
    type: string
    sql: ${TABLE}.office_appointments_enabled ;;
  }
  dimension: office_appointments_message {
    type: string
    sql: ${TABLE}.office_appointments_message ;;
  }
  dimension: is_deleted {
    type: string
    sql: ${TABLE}.is_deleted ;;
  }
  dimension: deleted_at {
    type: string
    sql: ${TABLE}.deleted_at ;;
  }
  dimension: bussiness_name {
    type: string
    sql: ${TABLE}.bussiness_name ;;
  }
  dimension: bussiness_slogan {
    type: string
    sql: ${TABLE}.bussiness_slogan ;;
  }
  dimension: office_email {
    type: string
    sql: ${TABLE}.office_email ;;
  }
  dimension: appointments_key {
    type: string
    sql: ${TABLE}.appointments_key ;;
  }
  dimension: shop_logo {
    type: string
    sql: ${TABLE}.shop_logo ;;
  }
  dimension: state_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.state_id ;;
  }
  dimension: photo1 {
    type: string
    sql: ${TABLE}.photo1 ;;
  }
  dimension: photo2 {
    type: string
    sql: ${TABLE}.photo2 ;;
  }
  dimension: photo3 {
    type: string
    sql: ${TABLE}.photo3 ;;
  }
  dimension: photo4 {
    type: string
    sql: ${TABLE}.photo4 ;;
  }
  dimension: office_state_name {
    type: string
    sql: ${TABLE}.office_state_name ;;
  }
  dimension: office_county_name {
    type: string
    sql: ${TABLE}.office_county_name ;;
  }
  dimension: office_city_name {
    type: string
    sql: ${TABLE}.office_city_name ;;
  }
  dimension: office_zip_name {
    type: string
    sql: ${TABLE}.office_zip_name ;;
  }
  dimension: location_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.location_id ;;
  }
  dimension: county_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.county_id ;;
  }
  dimension: city_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.city_id ;;
  }
  dimension: zip_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.zip_id ;;
  }
  dimension: is_zenmd {
    type: yesno
    sql: ${TABLE}.is_zenmd ;;
  }
  dimension: zenmd_regular_price {
    type: number
    sql: ${TABLE}.zenmd_regular_price ;;
  }
  dimension: zenmd_cultivation_price {
    type: number
    sql: ${TABLE}.zenmd_cultivation_price ;;
  }
  dimension: zenmd_replacement_price {
    type: number
    sql: ${TABLE}.zenmd_replacement_price ;;
  }
  dimension: zenmd_print_id_price {
    type: number
    sql: ${TABLE}.zenmd_print_id_price ;;
  }
  dimension: zenmd_pocketsize_price {
    type: number
    sql: ${TABLE}.zenmd_pocketsize_price ;;
  }
  dimension: office_is_wheelchair_accessible {
    type: yesno
    sql: ${TABLE}.office_is_wheelchair_accessible ;;
  }
  dimension: office_is_veterans_discount {
    type: yesno
    sql: ${TABLE}.office_is_veterans_discount ;;
  }
  dimension: office_is_all_day_verification {
    type: yesno
    sql: ${TABLE}.office_is_all_day_verification ;;
  }
  dimension: office_is_walk_ins {
    type: yesno
    sql: ${TABLE}.office_is_walk_ins ;;
  }
  dimension: office_is_accepts_credit_cards {
    type: yesno
    sql: ${TABLE}.office_is_accepts_credit_cards ;;
  }
  dimension: office_is_offers_physical_cards {
    type: yesno
    sql: ${TABLE}.office_is_offers_physical_cards ;;
  }
  dimension: office_is_multiple_locations {
    type: yesno
    sql: ${TABLE}.office_is_multiple_locations ;;
  }
  dimension: office_is_wallet_sized_authorizations {
    type: yesno
    sql: ${TABLE}.office_is_wallet_sized_authorizations ;;
  }
  dimension: approved_business_name {
    type: string
    sql: ${TABLE}.approved_business_name ;;
  }
  dimension: approved_description {
    type: string
    sql: ${TABLE}.approved_description ;;
  }
  dimension: is_potify {
    type: yesno
    sql: ${TABLE}.is_potify ;;
  }
  dimension: office_is_disability_discount {
    type: yesno
    sql: ${TABLE}.office_is_disability_discount ;;
  }
  dimension: office_is_accepts_debit_cards {
    type: yesno
    sql: ${TABLE}.office_is_accepts_debit_cards ;;
  }
  dimension: office_is_handicap_access {
    type: yesno
    sql: ${TABLE}.office_is_handicap_access ;;
  }
  dimension: office_is_security_guard {
    type: yesno
    sql: ${TABLE}.office_is_security_guard ;;
  }
  dimension: office_is_lounge {
    type: yesno
    sql: ${TABLE}.office_is_lounge ;;
  }
  dimension: office_is_atm {
    type: yesno
    sql: ${TABLE}.office_is_atm ;;
  }
  dimension: office_is_lab_tested {
    type: yesno
    sql: ${TABLE}.office_is_lab_tested ;;
  }
  dimension: office_is_eighteen_plus {
    type: yesno
    sql: ${TABLE}.office_is_eighteen_plus ;;
  }
  dimension: sync_created_at {
    type: date
    sql: ${TABLE}.sync_created_at ;;
  }
  dimension: sync_updated_at {
    type: date
    sql: ${TABLE}.sync_updated_at ;;
  }
  dimension: type {
    type: number
    value_format_name: id
    sql: ${TABLE}.type ;;
  }
  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }
  dimension: facebook {
    type: string
    sql: ${TABLE}.facebook ;;
  }
  dimension: twitter {
    type: string
    sql: ${TABLE}.twitter ;;
  }
  dimension: instagram {
    type: string
    sql: ${TABLE}.instagram ;;
  }
  dimension: video {
    type: string
    sql: ${TABLE}.video ;;
  }
  dimension: logo {
    type: string
    sql: ${TABLE}.logo ;;
  }
  dimension: is_medical {
    type: yesno
    sql: ${TABLE}.is_medical ;;
  }
  dimension: is_recreational {
    type: yesno
    sql: ${TABLE}.is_recreational ;;
  }
  dimension: office_is_twenty_one_plus {
    type: yesno
    sql: ${TABLE}.office_is_twenty_one_plus ;;
  }
  dimension: potify_logo {
    type: string
    sql: ${TABLE}.potify_logo ;;
  }
  dimension: potify_cover {
    type: string
    sql: ${TABLE}.potify_cover ;;
  }
  dimension: wcii_apikey {
    type: string
    sql: ${TABLE}.wcii_apikey ;;
  }
  dimension: is_featured_in_potify {
    type: yesno
    sql: ${TABLE}.is_featured_in_potify ;;
  }
  dimension: verification_site_for_rec {
    type: string
    sql: ${TABLE}.verification_site_for_rec ;;
  }
  dimension: potify_enable_loyalty_program {
    type: yesno
    sql: ${TABLE}.potify_enable_loyalty_program ;;
  }
  dimension: potify_cashback {
    type: string
    sql: ${TABLE}.potify_cashback ;;
  }
  dimension: zenmd_renewal_regular_price {
    type: string
    sql: ${TABLE}.zenmd_renewal_regular_price ;;
  }
  dimension: zenmd_renewal_cultivation_price {
    type: string
    sql: ${TABLE}.zenmd_renewal_cultivation_price ;;
  }
  dimension: yelp {
    type: string
    sql: ${TABLE}.yelp ;;
  }
  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }
  dimension: potify_enable_loyalty_program_request {
    type: yesno
    sql: ${TABLE}.potify_enable_loyalty_program_request ;;
  }
  dimension: potify_cashback_request {
    type: string
    sql: ${TABLE}.potify_cashback_request ;;
  }
  dimension: potify_loyalty_request {
    type: yesno
    sql: ${TABLE}.potify_loyalty_request ;;
  }
  dimension: potify_phone {
    type: string
    sql: ${TABLE}.potify_phone ;;
  }
  dimension: is_potify_phone_sms_notification {
    type: yesno
    sql: ${TABLE}.is_potify_phone_sms_notification ;;
  }
  dimension: alt_potify_phone {
    type: string
    sql: ${TABLE}.alt_potify_phone ;;
  }
  dimension: is_alt_potify_phone_sms_notification {
    type: yesno
    sql: ${TABLE}.is_alt_potify_phone_sms_notification ;;
  }
  dimension: timezone_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.timezone_id ;;
  }
  dimension: potify_is_accept_order {
    type: yesno
    sql: ${TABLE}.potify_is_accept_order ;;
  }
  dimension: potify_is_allow_delivery {
    type: yesno
    sql: ${TABLE}.potify_is_allow_delivery ;;
  }
  dimension: potify_is_allow_pickup {
    type: yesno
    sql: ${TABLE}.potify_is_allow_pickup ;;
  }
  dimension: potify_payment_cash {
    type: yesno
    sql: ${TABLE}.potify_payment_cash ;;
  }
  dimension: potify_payment_credit {
    type: yesno
    sql: ${TABLE}.potify_payment_credit ;;
  }
  dimension: potify_payment_debit {
    type: yesno
    sql: ${TABLE}.potify_payment_debit ;;
  }
  dimension: potify_featured_products {
    type: string
    sql: ${TABLE}.potify_featured_products ;;
  }
  dimension: potify_is_allow_online_order {
    type: yesno
    sql: ${TABLE}.potify_is_allow_online_order ;;
  }
  dimension: is_storage {
    type: yesno
    sql: ${TABLE}.is_storage ;;
  }
  dimension: potify_support_phone {
    type: string
    sql: ${TABLE}.potify_support_phone ;;
  }
  dimension: medical_state_license_number {
    type: string
    sql: ${TABLE}.medical_state_license_number ;;
  }
  dimension: adult_use_state_license_number {
    type: string
    sql: ${TABLE}.adult_use_state_license_number ;;
  }
  dimension: potify_is_allow_mail_delivery {
    type: yesno
    sql: ${TABLE}.potify_is_allow_mail_delivery ;;
  }
  dimension: potify_enable_loyalty_program_at {
    type: string
    sql: ${TABLE}.potify_enable_loyalty_program_at ;;
  }
  dimension: potify_is_last_request_declined {
    type: yesno
    sql: ${TABLE}.potify_is_last_request_declined ;;
  }
  dimension: selling_type {
    type: string
    sql: ${TABLE}.selling_type ;;
  }
  dimension: change_decline_action_behaviour {
    type: yesno
    sql: ${TABLE}.change_decline_action_behaviour ;;
  }
  dimension: average_delivery_time {
    type: string
    sql: ${TABLE}.average_delivery_time ;;
  }
  dimension: potify_is_phone_calls_enabled {
    type: yesno
    sql: ${TABLE}.potify_is_phone_calls_enabled ;;
  }
  dimension: collection_group_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.collection_group_id ;;
  }
}
