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
read GUESS