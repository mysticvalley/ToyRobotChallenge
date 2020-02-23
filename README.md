# ToyRobotChallenge

Toy Robot Coding Challenge. The detail of challenge is given below:

https://github.com/myxplor/toy-robot-ios

# Requirements to run this project

1. Xcode 11.3.x and iOS version 13.0 onwards.
2. Uses Swift 5.
3. No third party dependencies are used
4. Covers Unit test using XCTestCase
5. Uses MVC design pattern

# How to build the project

Clone this repository using git or download the source as zip. Open the folder project. Double click on `ToyRobotChallenge.xcodeproj` to open project in Xcode IDE. 

# How to use the App to move Toy

1. Use PLACE command using give X, Y text fields and a segmented control to choose any direction at beginning.

2. Then use `LEFT`, `RIGHT`, `MOVE` buttons to enter commands for toy movement. Please note, I have used command Characters as follows: 
    a. MOVE -> M
    b. LEFT -> L
    c. RIGHT -> R
    
    For example a command for MOVE, MOVE, LEFT, MOVE, RIGHT, MOVE would be `MMLMRM`.

3. Click on `Report` button to display an output toy position after processing given commands.

4. Use `Reset` button to clear all fields and start fresh. 


# Some of the sample test data and its respective outputs

a) PLACE [0 0 NORTH] Command: M, REPORT Output: [0 1 NORTH]

b) PLACE [0 0 NORTH] Command: L, REPORT Output: [0 0 WEST]

c) PLACE [1 2 EAST] Command: MMLM, REPORT Output: [3 3 NORTH]

d) PLACE [2 1 EAST] Command: MMRMMRMRRM, REPORT Output:[4 0 EAST]

# Running unit tests

To run unit tests please press `CMD`+ `U` key from keyboard or Got to `Product Menu > Test`.