#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

INPUT="$1"

RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM p.atomic_mass::TEXT)), p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number JOIN types t ON p.type_id = t.type_id WHERE e.atomic_number::text = '$INPUT' OR e.symbol = INITCAP('$INPUT') OR e.name = INITCAP('$INPUT')")

if [[ -z $RESULT ]]; then
  echo "I could not find that element in the database."
  exit
fi

IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
