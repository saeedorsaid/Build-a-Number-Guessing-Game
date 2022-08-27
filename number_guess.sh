#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username:\n"
read USERNAME

GAMES_PLAYED = $($PSQL "SELECT games_played FROM users WHERE username='$USERNAME")
BEST_GAME = $($PSQL "SELECT best_game FROM users WHERE username='$USERNAME")

if [[ -z $GAMES_PLAYED ]]
then 
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
else
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
  