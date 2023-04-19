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
implemented delete option in masterview using .onDelete - had to add an observedobject wrapper to the masterview to allow changes to persist between states
implemented add day function to the plus button - learned about onCommit, had to use .onDisappear to reset the textfield as it wasnt doing it inside the onCommit closure

03/04/23

implemented reset/undo button on navbar in displayview utilising a state array to save the previous values using a for loop and map method
disabled the reset/undo button during edit mode to avoid array mismatch when restoring values
added and .onAppear closure to the masterview in order to ensure any edits to the day name in the detailview correctly sort the list in chronological order
implemented the title edit capability during edit mode of the detail view
made DayNameView to format the textfield and text more easily for the if/else conditionals of edit mode
added a viewmodifier to the DayNameView so edits to the dayname are more seamless by keeping the same format settings
added some styling to indicate the dayname is editable
encountered problems trying to align a small icon to the textfield for a better edit association: padding was causing the textfield to misalign and be hard to click for renaming
fixed EditButton() integration in DetailView to correctly track and update the state of the view by attaching .environment(\.editMode, $editMode) to child views
implemented an AddTaskView to facilitate the adding of tasks to the detailview's current day
used an @Environment wrapper with presentation mode and sheets to prompt the user for adding a new task. took this approach due to the task object requiring certain properties/syntax

Video Link Milestone 2: https://youtu.be/5O26V9iSSqo




14/04/23

Started reviewing code and adding comments/building documentation

15/04/23

Added more documentation and comments to code.

19/04/23

Added test cases for data types and multiple functions. Should have been included while building the initial datatypes but was unsure on how to exactly test different aspects of the intialisation, functions etc. Many functions included as part of a class aren't showing in scope for the test file and needed to be manually included'.

Remote repository is not being found and updated correctly due to VM crashing during development and needing to reinstall entire VM and reclone project, some commits went missing. Added a new remote to try and fix but still not detecting. Local commits are working.

20/04/23

Cleaned code in detailview by including more styling in the DayNameView with the intent of making it more apparently the textfield can be edited.

Attempted to dynamically change the size of the textfield border based on the contents using a geometryreader but was unable to get the desired functionality


