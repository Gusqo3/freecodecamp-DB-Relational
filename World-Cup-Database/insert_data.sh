#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Quitamos la primer linea
  if [[ $YEAR != "year" ]]
  then
    #AGREGAR EQUIPOS
    #Verificamos que tanto el equipo ganador y oponente esten dentro de la lista
    EXISTE=$($PSQL "SELECT COUNT(*) FROM teams WHERE name = '$WINNER'")
    if [[ $EXISTE -eq 0 ]]
    then
      #Si no hay conteo, se agrega equipo ganador
      INSERT_TO_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi

    EXISTE_OPP=$($PSQL "SELECT COUNT(*) FROM teams WHERE name = '$OPPONENT'")
    if [[ $EXISTE_OPP -eq 0 ]]
    then
      #Si no hay conteo, se agrega equipo ganador
      INSERT_TO_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
  fi
done

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #Quitamos la primer linea
  if [[ $YEAR != "year" ]]
  then
    #Obtenemos id de los equipos
    GET_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    GET_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    #Insercion de datos
    INSERT_TO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $GET_ID_WINNER, $GET_ID_OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done