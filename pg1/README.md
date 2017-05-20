# PG1-ios

CS344 PG1

[assignment description](http://philos.nmu.edu/cs344-01-16f/PG1.pdf)

Linked Lists in ObjC


---

### Northern Michigan University (Marquette Co, MI)
### CS 344-01-16F: iOS / iPhone Programming
## Program 1
#### Due: Wednesday 7 September 2016 1:00 P.M. EDT
### Library

Create a folder called “PG1” in the top level of your CS344-01-16F folder. Put ONLY your .m
and .h files into this folder. Place a (possibly empty) file or folder called “DONE” into this
folder when you are ready to have your programs graded.

### Write the following program in Objective C:

You are to write a program that adds book titles to a library. The library must be stored in a
linked list with the book titles appearing in alphabetical order within the linked list. There are to
be no loops in your linked list and linked list node classes; these classes must use recursion only.
Loops are allowed in your main. Your main may reference the linked list class, but it may not
reference the linked list node class in any way.

Your program will accept a series of commands for you to process.

`ADD "Book Title"`

> This adds a title to the linked list. The title is allowed to contain spaces. The title will begin and
end with quotes, but the quotes are NOT part of the title. If the book is already present, it will
not be added to the linked list. Titles are case-insensitive. If the list already contains "DOG,"
you should not be allowed to add "dog"

`PRINT`

> Prints out all books in the linked list in alphabetical order, case insensitive. "A" comes before
"b" and "a" comes before "B".

`REMOVE "substring"`

> Removes all books whose title contains the substring. For example, REMOVE "the" removes all
books that have "the" somewhere in the title, beginning, middle, or end, as a whole word or as a
partial word. Again, this is case insensitive. REMOVE "the" removes all titles with
"The","THE","ThE", etc.

`EXIT`

> Ends the program.

The commands themselves are case insensitive. For example, Exit, eXit, exit, etc. should all exit
the program.

Be sure your program is divided into appropriate classes and methods and is commented
appropriately.
