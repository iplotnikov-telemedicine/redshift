view: patients {
  sql_table_name: staging.patients;;

  dimension: primary_key {
    primary_key: yes
    type: number
    sql: concat(${TABLE}.comp_id, ${TABLE}.pat_id) ;;
  }

  dimension: comp_id {
    type: number
    sql: ${TABLE}.comp_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.pat_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.pat_first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.pat_last_name ;;
  }

  dimension: full_name {
    type: string
    sql: concat(${TABLE}.pat_first_name, ${TABLE}.pat_last_name) ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.pat_phone ;;
  }

  dimension: has_phone_consent {
    type: yesno
    sql: ${TABLE}.phone_consent_given_at IS NOT NULL ;;
  }

}
