view: ratings {
  sql_table_name: movielens.ratings ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${TABLE}.user_id as string), cast (${TABLE}.movie_id as string)) ;;
  }


  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: movie_id {
    type: number
    sql: ${TABLE}.movie_id ;;
  }

  dimension: ratings {
    type: number
    sql: ${TABLE}.ratings ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }



  measure: count {
    type: count
    drill_fields: [user_id, ratings.count]
  }

  measure: average {
    type: average
    sql: ${TABLE}.ratings ;;
    drill_fields: [user_id, ratings]
  }
}
