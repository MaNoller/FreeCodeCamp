#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #get infos
    ELEMENT_INFO=$($PSQL "select * from elements left join properties using(atomic_number) left join types using(type_id) where atomic_number = $1")
    echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
      do #print
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
      done
  else #find both versions if available
    ENTRY_AS_SYMBOL=$($PSQL "select * from elements left join properties using(atomic_number) where symbol = '$1'")
    ENTRY_AS_NAME=$($PSQL "select * from elements left join properties using(atomic_number)  where name = '$1'")
    if [[ ! -z $ENTRY_AS_SYMBOL ]]  || [[ ! -z $ENTRY_AS_NAME ]]
    then
      if [[ -z $ENTRY_AS_SYMBOL ]]
      then
        ELEMENT_INFO=$($PSQL "select * from elements left join properties using(atomic_number) left join types using(type_id) where name = '$1'")
      else
        ELEMENT_INFO=$($PSQL "select * from elements left join properties using(atomic_number) left join types using(type_id) where symbol = '$1'")
      fi
      echo "$ELEMENT_INFO" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
        do
         echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
        done
    else
      echo -e "I could not find that element in the database."
    fi
  fi
fi

