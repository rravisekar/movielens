
view: genre1 {
  derived_table: {
    sql:
      Select
row_number() over (order by movie_id) id
,movie_id
,movie_name
,genre

from movies
LEFT JOIN UNNEST(SPLIT(movies.movie_genres,'|')) as genre ;;
  }
  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: movie_id {
    type: number
    sql: ${TABLE}.movie_id ;;
  }
  dimension: movie_name {
    type: string
    sql: ${TABLE}.movie_name ;;
  }
  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }
  measure: count {
    type: count
  }
}
