#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=games -t --no-align -c"

echo "Enter your username:"
read USERNAME

USERNAME_DATABASE=$($PSQL "SELECT username FROM games WHERE username='$USERNAME'")

#check whether already in database
if [[ -z $USERNAME_DATABASE ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  #add user to database
  INSERT_RESULT=$($PSQL "INSERT INTO games(username) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


echo "Guess the secret number between 1 and 1000:"
read GUESSED_NUMBER
#handle situation when the input is not integer
while [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESSED_NUMBER
done

#generate random number
RANDOM_NUMBER=$[ $RANDOM % 1000 + 1 ]
echo $RANDOM_NUMBER
GUESSED_TIMES=1
#compare the guessed number and random number
while [[ $GUESSED_NUMBER != $RANDOM_NUMBER ]]
do
  if [[ $GUESSED_NUMBER > $RANDOM_NUMBER ]]
  then 
    echo "It's lower than that, guess again:"
    ((GUESSED_TIMES++))
  elif [[ $GUESSED_NUMBER < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    ((GUESSED_TIMES++))
  fi
  read GUESSED_NUMBER
done

GAMES_PLAYED=$($PSQL "SELECT games_played FROM games WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM games WHERE username='$USERNAME'")
#if new user, input game_played and best_game
if [[ -z $GAMES_PLAYED ]]
then
  UPDATE_GAME_RESULT=$($PSQL "UPDATE games SET games_played=1 WHERE username='$USERNAME'")  
  UPDATE_GUESS_RESULT=$($PSQL "UPDATE games SET best_game=$GUESSED_TIMES WHERE username='$USERNAME'")
#if old user,update game_played times and best_game times
else
  ((GAMES_PLAYED++))
  UPDATE_GAME_RESULT=$($PSQL "UPDATE games SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  if [[ $BEST_GAME > $GUESSED_TIMES ]]
  then
    UPDATE_GUESS_RESULT=$($PSQL "UPDATE games SET best_game=$GUESSED_TIMES WHERE username='$USERNAME'")
  fi
fi
echo "You guessed it in $GUESSED_TIMES tries. The secret number was $RANDOM_NUMBER. Nice job!"

