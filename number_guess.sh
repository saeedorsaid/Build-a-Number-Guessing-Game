#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

if [[ -z $GAMES_PLAYED ]]
then 
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
else
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1))

echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

GET_NUMBER() { 
  NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then 
      echo -e "\nIt's lower than that, guess again:"
      GET_NUMBER
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      GET_NUMBER
    else
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    GET_NUMBER
  fi
}

GET_NUMBER



