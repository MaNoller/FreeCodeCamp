#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games RESTART IDENTITY")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    TEAM_ID=$($PSQL "select team_id from teams where name= '$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_RESULT = $($PSQL "insert into teams (name) values('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into Teams, $WINNER
      fi
    fi
    OPPONENT_ID=$($PSQL "select team_id from teams where name= '$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT = $($PSQL "insert into teams (name) values('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into Teams, $OPPONENT
      fi
    fi  
  TEAM_ID=$($PSQL "select team_id from teams where name= '$WINNER'")
  OPPONENT_ID=$($PSQL "select team_id from teams where name= '$OPPONENT'")
  echo $($PSQL "insert into games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$TEAM_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  fi
done
