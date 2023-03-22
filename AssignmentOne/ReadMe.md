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

while working on the detail view I spent a long time figuring out how to use the ontapgesture method which resulted in using the .firstindex(where:) method to identify the tapped task and the .map method to transform the correct task array and toggle the checkmark. they both seem like useful methods but correctly using the $0 in the arguments took awhile to get my head around.

Explored some formatting options for the task list.

extracted a HStack to create a listview but encountered problems with the @State tasks declaration placement as it is passed from the masterview but used in the HStack and the ForEach list generator

Started researching observableobjects, environmentobjects and using the @published wrapper to try and save the state of a toggled task



Video Link Milestone 1:



