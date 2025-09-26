#!/bin/bash


# Number Guessing Game Script

# Set up PSQL variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt for username
echo "Enter your username:"
read USERNAME


# Limit username to 22 characterses
USERNAME=${USERNAME:0:22}

# Check if user exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
if [[ -z $USER_ID ]]; then
	# New user
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	$PSQL "INSERT INTO users(username) VALUES('$USERNAME');" > /dev/null
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
else
	# Returning user
	GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
	BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")

		echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
	fi

	# Start the guessing game
	echo "Guess the secret number between 1 and 1000:"
	NUMBER_OF_GUESSES=0
	while true; do
		read GUESS
		((NUMBER_OF_GUESSES++))
		# Check if input is an integer
		if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
			echo "That is not an integer, guess again:"
			continue
		fi
		if (( GUESS < SECRET_NUMBER )); then
			echo "It's higher than that, guess again:"
		elif (( GUESS > SECRET_NUMBER )); then
			echo "It's lower than that, guess again:"
		else
			break
		fi
	done

	# Store game results
	$PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);" > /dev/null

	# Congratulate user
	echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
