#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only  -c"

NUMBER=$(( ( RANDOM % 1000 )  + 1 ))

echo -e "\nEnter your username:"
read USERNAME 

USER_DATA=$($PSQL "select * from games where username='$USERNAME'") 

if [[ -z $USER_DATA ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER_RESULT=$($PSQL "insert into games (username,games_played) values ('$USERNAME',0)")
  else
  echo "$USER_DATA" | while read USER_NAME BAR GAMES_PLAYED BAR BEST_GAME
    do
      echo "Welcome back, $(echo $USER_NAME | sed -E 's/^ *| *$//g')! You have played $(echo $GAMES_PLAYED | sed -E 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -E 's/^ *| *$//g') guesses."
      #echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
fi

CHANGE_DATABASE(){
  UPDATE_GAMES_RESULT=$($PSQL "update games set games_played = games_played +1 where username = '$USERNAME'")
  BEST_GAMES=$($PSQL "select best_game from games where username='$USERNAME' and best_game is not null")
  if [[ -z $BEST_GAMES ]]
  then
    ADD_BEST_GAME_RESULT=$($PSQL "update games set best_game = $NUM_OF_GUESS where username = '$USERNAME'")
  else
    if [[ $NUM_OF_GUESS -lt BEST_GAMES ]]
    then
      ADD_BEST_GAME_RESULT=$($PSQL "update games set best_game = $NUM_OF_GUESS where username = '$USERNAME'")
    fi
  fi
}

GET_GUESS(){
  NUM_OF_GUESS=1
  GUESS "\nGuess the secret number between 1 and 1000:"
  echo -e "\nYou guessed it in $NUM_OF_GUESS tries. The secret number was $NUMBER. Nice job!"
  CHANGE_DATABASE 
}

NUM_OF_GUESS=1
GUESS(){
  echo -e "\n$1"
  read GUESSED_NUMBER
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    GUESS "\nThat is not an integer, guess again:"
  else
    while [[ $GUESSED_NUMBER -ne  $NUMBER ]]
    do
      if [[ $GUESSED_NUMBER -gt $NUMBER ]]
      then
      NUM_OF_GUESS=$((NUM_OF_GUESS+1))
      GUESS "\nIt's lower than that, guess again:"
      else
      NUM_OF_GUESS=$((NUM_OF_GUESS+1))
      GUESS "\nIt's higher than that, guess again:"
      fi
    done
    
  fi
}

GET_GUESS
