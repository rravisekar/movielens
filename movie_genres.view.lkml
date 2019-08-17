view: movie_genres {
  sql_table_name: movielens.movie_genres ;;

  dimension: movie_genres {
    type: string
    sql: ${TABLE}.movie_genres ;;
  }

  dimension: movie_id {
    type: number
    sql: ${TABLE}.movie_id ;;
  }

  dimension: movie_name {
    type: string
    sql: ${TABLE}.movie_name ;;
  }

  measure: count {
    type: count
    drill_fields: [movie_name]
  }
}
