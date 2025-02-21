Submission Reminder Application

Overview

The Submission Reminder Application helps users organize their submission deadlines efficiently. The setup process is simple, and the application creates a structured directory with necessary scripts and configuration files.

Setup Instructions

Follow these steps to set up and run the application:

Step 1: Run the create_environment.sh Script

You can start the setup process using either of the following methods:

Graphical User Interface (GUI): Click on the create_environment.sh file to execute it.

Terminal: Open a terminal, navigate to the directory containing create_environment.sh, and run the appropriate command.

Step 2: Enter Your Name

After executing the script, you will be prompted to enter your name. Type your name and press Enter.

Step 3: Directory and File Creation

Once you enter your name, the script will generate a new folder named submission_reminder_{yourName}, where {yourName} is the name you entered in Step 2. The script also creates the following subfolders and files:

app/ → Contains reminder.sh

modules/ → Contains functions.sh

assets/ → Contains submissions.txt

config/ → Contains config.env

Root directory → Contains startup.sh

Step 4: Navigate to the Created Folder

Locate and open the newly created folder submission_reminder_{yourName}.

Step 5: Run the Application

You can start the application using one of the following methods:

Graphical User Interface (GUI): Click on startup.sh to execute it.

Terminal: Open a terminal, navigate to the submission_reminder_{yourName} folder, and run the appropriate command. The startup.sh script will launch the application.

Notes

Ensure you have the necessary execution permissions for the scripts. If required, grant execution permissions using the appropriate command.

The application is designed to help track submission deadlines efficiently.

For any issues or questions, refer to the project documentation or contact the development team. 
