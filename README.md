# plexon-to-mvdm
Shared code to convert Plexon pl2 to mvdm structs

READ ME: 

Mike Hasse’s Final Project for Dartmouth neuraldata-w16

There are three sets of code:

Pl2tomvdmspike:

 This is a function that uses a cell called filelist which is created ahead of time and contains the path for files of current interest. 

It uses the Plexon loading functions to extract relevant data from .pl2 files and organizes them in a ts-style structure according to mvdm organization principles.

Pl2tomvdmevents:

This function also uses filelist and is designed to be paired with Pl2tomvdmspike. It creates a ts-style data structure that contains event time stamps: the timing of LED pulses, the start of a trial, and the end of a trial. 

Pl2tomvdmPSTH:

This program calls the previous two functions and plots an LED pulse PSTH for each unit of interest.


(Pl2tomvdm is Wilder’s code, we’re sharing a repository since he’s interested in sharing code. He was appreciative of the feedback from last time though!)
