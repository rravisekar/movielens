view: ratings {
  sql_table_name: movielens.ratings ;;



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

  measure: average_ratings {
    type: average
    drill_fields: [movie_id, ratings.avg]
  }
}
