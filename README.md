# TournamentResults
Overview
--------
This project includes the database schema for storing data required for making swiss pairings in a tournament and a module to add 
players, count their matches and wins.

Requirements
------------
To use this code you must have Python and Postgresql installed on your computer.

Setting up and Testing the Database Schema
------------------------------------------
1. Download the files on your computer. Open terminal and get into the directory where you have stored these files
  and enter the commands respectively as shown below in the terminal.

        psql
  This command will take you into psql command line.
  
        create database tournament;
  This will create database tournament.
  
        \c tournament
  This will connect to the tournament database.
  
        \i tournament.sql
  This command will execute the commands from the file tournament.sql and will set up the database structure.

2. Quit the psql command line. 
  This is done by
  
        \q

3. There is python module called tournament_test which perform tests on the tournament database to make sure everything is
  working properly. After quitting the psql command line, type the following command to run the test module:
  
        python tournament_test.py
  
  If everything is set up correctly than you will see a success message.
  

