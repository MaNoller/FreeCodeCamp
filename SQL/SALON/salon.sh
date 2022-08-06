#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  else
  #welcome
  echo -e "Welcome to My Salon, how can I help you?\n"
  fi
  
  #get services
  SERVICES=$($PSQL "select * FROM services order by service_id")
  echo "$SERVICES"  | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done
  #check order
  read SERVICE_ID_SELECTED
  #check if input is valid
  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
  then
    # send to main menu
    SERVICE_MENU "I could not find that service. What would you like today?"
  else
    GET_CUSTOMER_DATA
  fi
}

GET_CUSTOMER_DATA(){
  #get phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  #check if phone is already registered to customer
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert customer
    INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers (name,phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  fi
  echo -e "What time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  #get customer id
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  #insert into appointments
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments (customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  #get service name
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  #cumminucate
  echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
}

SERVICE_MENU
