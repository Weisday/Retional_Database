#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN(){
  ATOMIC_NUMBER=$1
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  TYPE=$($PSQL "SELECT type FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types ON properties.type_id=types.type_id WHERE atomic_number=$ATOMIC_NUMBER")

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
}

ERROR(){
  echo "I could not find that element in the database."
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

elif [[ $1 =~ ^[0-9]+$ ]]
then
  if [[ $1 -gt 10 ]]
  then
    ERROR
  else
    MAIN $1
  fi
elif [[ ${#1} -lt 3 ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    ERROR
  else
    MAIN $ATOMIC_NUMBER
  fi
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    ERROR
  else
    MAIN $ATOMIC_NUMBER
  fi
fi

