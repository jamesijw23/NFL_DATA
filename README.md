# NFL Data Analysis
What makes a NFL team good (winning season or appearance in playoff)?
Two other questions that relate to the main question are:
  * What do the Patriots do be so good?
  * What do the Browns do be so bad?
  
The following data set has the play by play of every NFL game from 2009 to 2015. There are many directions that can be taken to answer these 
questions, however, I will focus on three areas one can assume has to determine if a team will be good or bad: 
  * The offense gets alot of Yards, while defense prohibits yards (passing/rushing)
  * Offense does not produce turn overs, defense causes turn overs
  * Offense scores frequently, defense stops scores
  
These directions are broad so that I explore each direction with multiple techniques to provided more insight.

## Descripition of Variables Types
The purpose of this notebook is to curate a data set that determines the outcome of a game and relevant statistics that I believe will predict the outcome of the game. There are 1791 unique games from 2009 to 2015 that are within the main data set. The following variables were created:
* Average Yard Gained by Passing 
* Average Yard Gained by Rushing 
* Total Yards Allowed by Defense Passing
* TotalYards Allowed by Defense Rushing
* Turnovers by Offense 
* Turnovers caused by Defense
* Scores by Offense 
* Scores by Denfense

A function was created to determine these statistics for each of the games. Though there are many other statistics that could have been created, this is a first attempt to understand the dynamics of a good team.

## Description of Analysis
Before the analysis, more data manipulation was done to ensure all games had an appropriate outcome. Some outcomes had NA because the games 
that went into overtime were treated as a tie within the data set. This fact implied that these games were not included within this 
analysis. This implied that there were 3270 games in the analysis.

The machine learning techniques that were implemented were SVM, Tree, and random forest. Each of the analysis included a cross validation so 
that the error is minimized. The tree method was used to be able to determine what aspects of certain variables impact the likelihood of 
success, whereas, SVM and random forest were used to validate the finding found within the tree method. The data was partitioned into 
training and test data sets to determine how well each of the techniques work.

## Files included
* CurateingtheDataset: Jupyter Notebook of creating dataset
* AnalyzingNFLData: Jupyter Notebook of analysis
* nfl_direction1: csv file of curated data used in analysis
