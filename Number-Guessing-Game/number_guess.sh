
#!/bin/bash
# number_guess.sh - FreeCodeCamp Number Guessing Game
# Ce script permet à l'utilisateur de deviner un nombre secret entre 1 et 1000.
# Il enregistre les statistiques de jeu dans une base PostgreSQL.
# Test manuel : ./number_guess.sh

# Number Guessing Game Script
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Vérifier la longueur du nom d'utilisateur
if [[ ${#USERNAME} -gt 22 ]]; then
	echo "Username must be 22 characters or less."
	exit 1
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs)

if [[ -z $USER_ID ]]; then
	$PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
	echo "Welcome, $USERNAME! It looks like this is your first time here."
	USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'" | xargs)
else
	GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID" | xargs)
	BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID" | xargs)
	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0
while true; do
	read GUESS
	(( NUMBER_OF_GUESSES++ ))
	if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
		echo "That is not an integer, guess again:"
		continue
	fi
	if (( GUESS < SECRET_NUMBER )); then
		echo "It's higher than that, guess again:"
	elif (( GUESS > SECRET_NUMBER )); then
		echo "It's lower than that, guess again:"
	else
		printf "You guessed it in %d tries. The secret number was %d. Nice job!\n" "$NUMBER_OF_GUESSES" "$SECRET_NUMBER"
		$PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)"
		break
	fi
done
