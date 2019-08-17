view: movies {
  sql_table_name: movielens.movies ;;

  dimension: movie_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.movie_id ;;
  }

  dimension: movie_genres {
    type: string
    sql: ${TABLE}.movie_genres ;;
  }

  dimension: movie_name {
    type: string
    sql: ${TABLE}.movie_name ;;
  }

  measure: count {
    type: count
    drill_fields: [movie_id, movie_name, ratings.count]
  }
}

view: genre {
  dimension: name {
    sql: ${TABLE} ;;
  }
}
