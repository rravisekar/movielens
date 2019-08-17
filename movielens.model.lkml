connection: "bigquery_database"

# include all the views
include: "*.view"

datagroup: movielens_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: movielens_default_datagroup

explore: movies {}

explore: ratings {
  join: users {
    type: left_outer
    sql_on: ${ratings.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }

  join: movies {
    type: left_outer
    sql_on: ${ratings.movie_id} = ${movies.movie_id} ;;
    relationship: many_to_one

  }
  join: genre {
    sql:  LEFT JOIN UNNEST(SPLIT(${movies.movie_genres}},'|')) as genre ;;
    relationship: one_to_many
  }
  }

explore: users {}

explore: movie_genres {}
