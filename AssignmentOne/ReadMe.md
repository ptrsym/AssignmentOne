# Assignment 1
## First milestone


21/3/23

Familiarised with source control settings.

Made text display for list view.

22/3/23

Defined data to be used for the task list:
task struct, days of the week and generated some tasks.

Experimented with masterview and contentview to try and gain better understanding of the options available

23/3/23

implemented master view
implemented detail view

while working on the detail view I spent a long time figuring out how to use the ontapgesture method which resulted in using the .firstindex(where:) method to identify the tapped task 

Explored some formatting options for the task list.

extracted a HStack to create a listview but encountered problems with the @State tasks declaration placement as it is passed from the masterview but used in the HStack and the ForEach list generator

added a dictionary sorter to ensure days of the week are displayed in the correct order utilising the .firstindex method

Started researching observableobjects, environmentobjects and using the @published wrapper to try and save the state of a toggled task

Added some styling to the MasterView and DetailView


24/03/23

Reviewed some data flow concepts to fix some errors in my code related to variabled being passed into different views and what to declare with the intention of using Observed objects instead of states

changed some class definitions and made some new definitions to be able to track the [Task] array as an observable object

fixed errors and had to add an objectwillchange to the ongesture tap closure as the state of the button was not being updated correctly for some reason due to how the task data may be being passed or accessed


Video Link Milestone 1: https://youtu.be/tCg1-Y0L65M



28/03/23

Created day and daylist classes necessary for adding edit functionality to the checklist
Started changing views to use the new DayList class instead of a dictionary
built a sort function in the daylist class to ensure when making changes to the checklist the days are in chronological order
added an append day function for the daylist
updated masterview code to use the DayList class instead of the previous dictionary

29/03/23

updated daylist function sortdays() to ignore case if the user's entry isnt an exact match of the daysoftheweek array

30/03/23

created listrowview for styling masterview layout
rebuilt timesort function for taskstore class to understand chronological ordering of am/pm time using a DateFormatter().

02/04/23

lots of research on delete options, swipe options etc.
implemented a .swipeActions closure to delete days from masterview but not updating the view perfectly
