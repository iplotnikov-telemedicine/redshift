view: brands {
  sql_table_name: staging.brands ;;

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

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name  ;;
    bypass_suggest_restrictions: no
    full_suggestions: yes
    # suggest_persist_for: "1 second"
  }

  dimension: brand_name_refined {
    type: string
    sql: UPPER(CASE WHEN ${brand_name} IS NULL THEN
      CASE WHEN ${products.prod_name} like'%Jeeter%' THEN 'Jeeter'
                WHEN ${products.prod_name} like'%Stiiizy%' THEN 'Stiiizy'
                WHEN ${products.prod_name} like'%The Cure%' THEN 'THE CURE COMPANY'
                WHEN ${products.prod_name} like'%Bear Labs%' THEN 'BEAR LABS'
                WHEN ${products.prod_name} like'Buddies Brand%' THEN 'BADDIES BRAND'
                WHEN ${products.prod_name} like'Select%' THEN 'SELECT'
                WHEN ${products.prod_name} like'Almora Farm%' THEN 'ALMORA FARM'
                WHEN ${products.prod_name} like'%Clone' THEN 'CLONE'
                WHEN ${products.prod_name} like'Ball Family%' THEN 'BALL FAMILY FARMS'
                WHEN ${products.prod_name} like'Bear Labs%' THEN 'BEAR LABS'
                WHEN ${products.prod_name} like'Alien Labs%' THEN 'ALIEN LABS'
                WHEN ${products.prod_name} like'Artisan%' THEN 'ARTISAN'
                WHEN ${products.prod_name} like'Astronauts%' THEN 'Astronauts'
                WHEN ${products.prod_name} like'Backpack Boyz%' THEN 'Backpack Boyz'
                WHEN ${products.prod_name} like'Badfish%' THEN 'Badfish'
                WHEN ${products.prod_name} like'Bakers%' THEN 'Bakers'
                WHEN ${products.prod_name} like'Balanced%' THEN 'Balanced'
                WHEN ${products.prod_name} like'Beezle%' THEN 'Beezle'
                WHEN ${products.prod_name} like'Balanced%' THEN 'Balanced'
                WHEN ${products.prod_name} like'Big Chief%' THEN 'Big Chief'
                WHEN ${products.prod_name} like'Big Petes%' THEN 'Big Petes'
                WHEN ${products.prod_name} like'Bangers%' THEN 'Bangers'
                WHEN ${products.prod_name} like'%ELYON' THEN 'ELYON'
                WHEN ${products.prod_name} like'%EIGHTH BROTHER' THEN 'EIGHTH BROTHER'
                WHEN ${products.prod_name} like'%KUSHAGRAM' THEN 'KUSHAGRAM'
                WHEN ${products.prod_name} like'%MOHAVE' THEN 'MOHAVE'
                WHEN ${products.prod_name} like'%OLD PAL' THEN 'OLD PAL'
                WHEN ${products.prod_name} like'%EIGHTH BROTHER' THEN 'EIGHTH BROTHER'
                WHEN ${products.prod_name} like'%ALMORA FARMS' THEN 'ALMORA FARMS'
                WHEN ${products.prod_name} like'Kushagram%' THEN 'KUSHAGRAM'
                WHEN ${products.prod_name} like'%Flight Red Eye%' THEN 'Flight Red Eye '
                WHEN ${products.prod_name} like'%PAPAS HERB%' THEN 'PAPAS HERB'
                WHEN ${products.prod_name} like'%Americanna%' THEN 'Americanna'
                WHEN ${products.prod_name} like'%CARTE%' THEN 'CARTE'
                WHEN ${products.prod_name} like'%FEELZ%' THEN 'FEELZ'
                WHEN ${products.prod_name} like'%The Marathon Cultivation%' THEN 'The Marathon Cultivation'
                WHEN ${products.prod_name} like'%GREENLINE%' THEN 'GREENLINE'
                WHEN ${products.prod_name} like'%PLUGplay%' THEN 'PLUGplay'
                WHEN ${products.prod_name} like'%FROOT%' THEN 'FROOT'
                WHEN ${products.prod_name} like'%HEADY%' THEN 'HEADY'
                WHEN ${products.prod_name} like'%CANNABIOTIX%' THEN 'CANNABIOTIX'
                WHEN ${products.prod_name} like'ZE.%' THEN 'ZEN'
                WHEN ${products.prod_name} like'8th Cure Company%' THEN '8th Cure Company'
                WHEN ${products.prod_name} like'%Old Pal%' THEN 'Old Pal'
                WHEN ${products.prod_name} like'%CUREsmalls%' THEN 'CUREsmalls'
                WHEN ${products.prod_name} like'%Green Buddy%' THEN 'Green Buddy'
                WHEN ${products.prod_name} like'%Valley Pure%' THEN 'Valley Pure'
                WHEN ${products.prod_name} like'%PANACEA%' THEN 'PANACEA'
                WHEN ${products.prod_name} like'%WeCana%' THEN 'WeCana'
                WHEN ${products.prod_name} like'%Sofa King%' THEN 'Sofa King'
                WHEN ${products.prod_name} like'%CRU Cannabis%' THEN 'CRU Cannabis'
                WHEN ${products.prod_name} like'%GRIZZLY PEAK FARMS%' THEN 'GRIZZLY PEAK FARMS'
                WHEN ${products.prod_name} like'%Grizzly Peak%' THEN 'GRIZZLY PEAK FARMS'
                WHEN ${products.prod_name} like'%RAW GARDEN%' THEN 'RAW GARDEN'
                WHEN ${products.prod_name} like'%CLONE GUY%' THEN 'CLONE GUY'
                WHEN ${products.prod_name} like'%ROVE%' THEN 'ROVE'
                WHEN ${products.prod_name} like'%YADA YADA%' THEN 'YADA YADA'
                WHEN ${products.prod_name} like'%CREAM OF THE CROP%' THEN 'CREAM OF THE CROP'
                WHEN ${products.prod_name} like'%SUPERMAJOR%' THEN 'SUPERMAJOR'
                WHEN ${products.prod_name} like'%JACK HERER%' THEN 'JACK HERER'
                WHEN ${products.prod_name} like'%PAPA''S HERB%' THEN 'PAPAS HERB'
                WHEN ${products.prod_name} like'%TYSON 2.0%' THEN 'TYSON 2.0'
                WHEN ${products.prod_name} like'%Platinum Basics%' THEN 'Platinum Basics'
                WHEN ${products.prod_name} like'%MIDS FACTORY%' THEN 'MIDS FACTORY'
                WHEN ${products.prod_name} like'%EUREKA%' THEN 'EUREKA'
                WHEN ${products.prod_name} like'%Lil Kicks%' THEN 'Lil Kicks'
                WHEN ${products.prod_name} like '%BLEEZIE%' THEN 'BLEEZIE'
                WHEN ${products.prod_name} like '%FIELDS%' THEN 'FIELDS'
                WHEN ${products.prod_name} like '%GANJA GOLD%' THEN 'GANJA GOLD'
                WHEN ${products.prod_name} like '%NFUZED%' THEN 'NFUZED'
                WHEN ${products.prod_name} like '%BBRAND BUDDIES%' THEN 'BBRAND BUDDIES'
                WHEN ${products.prod_name} like '%KNBIS%' THEN 'KNBIS'
                WHEN ${products.prod_name} like '%FLAV%' THEN 'FLAV'
                WHEN ${products.prod_name} like '%BLOOM%' THEN 'BLOOM'
                WHEN ${products.prod_name} like '%ALIVE WELL%' THEN 'ALIVE WELL'
                WHEN ${products.prod_name} like '%HIGH GARDEN%' THEN 'HIGH GARDEN'
                WHEN ${products.prod_name} like '%STRAWBERRY%' THEN 'STRAWBERRY'
                WHEN ${products.prod_name} like '%JETPACKS%' THEN 'JETPACKS'
                WHEN ${products.prod_name} like '%OASIS%' THEN 'OASIS'
                WHEN ${products.prod_name} like '%EIGHTH BROTHER%' THEN 'EIGHTH BROTHER'
                WHEN ${products.prod_name} like '%GBEXTRACTS%' THEN 'GBEXTRACTS'
                WHEN ${products.prod_name} like '%BLAZED UTOPIA%' THEN 'BLAZED UTOPIA'
                WHEN ${products.prod_name} like '%WEST COAST TRADING%' THEN 'WEST COAST TRADING COMPANY'
                WHEN ${products.prod_name} like '%TRINITY FLOWER%' THEN 'TRINITY FLOWER'
                WHEN ${products.prod_name} like '%Gorilla Glue%' THEN 'Gorilla Glue'
                WHEN ${products.prod_name} like 'Originals%' THEN 'Originals'
                WHEN ${products.prod_name} like 'Gold Drop%' THEN 'Gold Drop'
                WHEN ${products.prod_name} like '%Fire Department%' THEN 'Fire Department'
                ELSE 'UNKNOWN BRAND'
           END
    ELSE ${brand_name} END) ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_internal {
    type: yesno
    sql: ${TABLE}.is_internal ;;
  }

  measure: number_of_brands {
    type: count
    drill_fields: [brand_id, brand_name, products.count]
  }

  # dimension_group: sync_created {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.sync_created_at ;;
  # }

  # dimension_group: sync_updated {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.sync_updated_at ;;
  # }

  # dimension: wm_id {
  #   type: number
  #   sql: ${TABLE}.wm_id ;;
  # }

}
