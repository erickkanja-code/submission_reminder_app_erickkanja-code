#!/bin/bash

#Prompts theuser for their name and creates a directory with it
echo "Enter your name"
read name
mkdir submission_reminder_$name
cd submission_reminder_$name

#Creates the app/ directory with the reminder.sh file
mkdir app
cd app
cat <<EOF > reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ../config/config.env
source ../modules/functions.sh

# Path to the submissions file
submissions_file="../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF
#Makes reminder.sh executable and then moves one directory back
chmod u+x reminder.sh
cd ..

#Creates modules/ directory and the functions.sh file within it
mkdir modules
cd modules
cat <<EOF > functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF
#Makes functions.sh executable then moves back one directory
chmod u+x functions.sh
cd ..

#Makes the assets/ directory and the submissions.txt file within it
mkdir assets
cd assets
cat <<EOF > submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Angie, Shell Navigation, not submitted
Erick, Shell Navigation, not submitted
Muchiri, Shell Basics, submitted
Chiagoziem, Git, submitted
Muchiri, Git, not submitted
EOF
#Moves one directory backwards
cd ..

# Creates the config/ directory and the config.env file within it
mkdir config
cd config
cat <<EOF > config.env
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
cd ..

#Creates startup.sh file in root directory and includes within it logic that starts up the reminder app when executed.
cat <<EOF > startup.sh
#!/bin/bash
cd app
./reminder.sh
EOF

#Makes startup.sh executable
chmod u+x startup.sh









