# Go-CLI app - COMPFEST
This is second stage final assignment for COMPFEST - Software Engineering Academy

Description of the task : https://drive.google.com/file/d/1BC_tfgekX2pHJ7nWGbXguhTS8-NUlEQH/view



# Go-CLI app ver 1.3
Change log: 
- [1.3] 21st June 2018 - (19:21)
  - Adding new feature to the app
    - **Before** - Before confirming the order, theres no route showed
    - **After** - Before confirming the order, **a map of route will be shown** with "o". 
  - Adding new method **addRoute(order)** to `map.rb` . Check description below
  - Adding new method **generateMapRoute(order)** to `map_generator.rb` . Check description below
  - Adding new Class Variable **@routeArray** to `route.rb` . Check description below
  
- [1.2] 21st June 2018 - (18:18)
  - Adding new behaviour to the app
    - **Before** - After order was confirmed, user move to the destination, and driver who took the order come back to his/her last Coordinate
    - **After** - After order was confirmed, user move to the destination, and **_the driver who took the order will roam randomly into new Coordinate_**
  - Adding new method **clearMap** into `map.rb`. Check description below
  - Adding new method **randomizeDriverFrom(order)** into `map_generator.rb`. Check description below
    
- [1.1] 21st June 2018 - (06:36)
  - I made the First version of the app, but the code is still a mess and maybe didn't all use SOLID principles, so I will revise it later





## Running the app
The main files is *go-cli.rb* and you have 3 way to access it
*(I test this on windows 10)*


### 1. Running it without parameter

```
ruby go_cli.rb
```

This will generate :

- 20 * 20 size map
- User with random coordinate
- 5 Driver with random coordinate




### 2. Running it with file text as a parameter

```
ruby go_cli format.txt
```

***Note* *the file format MUST be like this! Otherwise the program can't translate it***

```
mapsize 20
user_coordinate 10,10
drivers Agus-11,15 Bima-2,7 Gilang-4,17 Zikra-13,7
```
 `mapsize value`

`user_coordinate x,y`

`drivers name1-x,y name2-x,y name3-x,y #etc`

This will generate :

- Customized map size
- User with coordinate specified
- Custom number of drivers with custom coordinate specified




### 3. Running it with 3 integer as parameter

```
ruby go_cli 10 5 5
```
`ruby go_cli mapsize userXcoordinate userYcoordinate`

**The map size argument _must higher than 2_, otherwise it will cause program error**

**The User coordinate _must lower than the mapsize_, otherwise it will print a very bad map (error)**

This will generate :

- Custom mapsize from first argument
- User with coordinate specified from second and third argument
- 5 drivers with random coordinate



### 4. Once the app is running
1. **Show map** -
   When user chooses this action, your app will display the map and
   show where the user is and where the drivers are.

   This is an example of 20 * 20 map

   _User is shown by **"#"**_

   _Driver is shown by their initial name_
   ```
   y
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . # . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . Y .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . B . . . W . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | Z . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . . . . . . . . . . . . .
   | . . . . . . . . E . . . . . . . . . . .
   0-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-x
   ```



2. **Order Go-Ride** -
   When user chooses this action, app will ask the specified coordinate.
   User should input the coordinate that he/she wants to go to.
   After that, the app will allocate the nearest driver to user and display the name of the driver, the route to destination, as well as    the price estimate.
   User must confirm the Order with [y,n]

   *User inputting the destination*
   ```
   |Put destination (ex: 1,1) : 10,10 
   ```

   .

   *The Display before confirming order, it will generate the route map*
   ```
   |Driver found   : Zikra
   |Travel from    : [4, 17] to [10, 10]      
   |Price estimate : 3900                     
   |Route displayed as following with "o"     
   y                                          
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . # o o o o o o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . . .  
   | . . . . . . . . . o . . . . . . . . Y .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . B . . . W . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | Z . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . . . . . . . . . . . . .  
   | . . . . . . . . E . . . . . . . . . . .  
   0-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-x                                           
   |Confirm order [y,n] ?
   ```

   .

   *The Display after confirming the order*
   ```
   =====================================      
   |You traveled to [10, 10]                  
   |Trip Completed!                           
   |Trip history has been saved
   ```
   
   
   3. **View History** -
   When user chooses this action, app will show the history of the user.
   If user hasn't made any order, it will return nothing
   *history is shown below in the description*
   
   
4. **Quit Program** -
   It will quit the program and say "Thanks for using Go-CLI!"





## Classes Used
1. **go_cli (main program)** -
`go_cli.rb` 
   - The main program to handle the UI and the menu

2. **Coordinate** - 
`coordinate.rb` 
   - The object for creating Coordinate
   - Arguments (1 to 2 args)
     - **1 arg (mapsize)** - Will generate random coordinate with the mapsize as the limit
     - **2 arg (x,y)** - Will generate x,y coordinate given
   - 3 Class Variable
     - **@x** - Value of coordinate x
     - **@y** - Value of coordinate y
     - **@get** - Array of element **x** and **y**
   - 0 Method

3. **User** -
`user.rb`
   - The object for creating User
   - Arguments (1 arg)
     - **1 arg (Coordinate obj)** - Will be stored in the class Variable
   - 3 Class Variable
     - **@coordinate** - Contains Coordinate Obj 
     - **@x** - The x value of user coordinate
     - **@y** - The y value of user coordinate
   - 0 Method

4. **Driver** -
`driver.rb`
   - The object for creating Driver
   - Arguments (1 arg)
     - **1 arg (Coordinate obj)** - Will be stored in the class Variable
   - 4 Class Variable
     - **@coordinate** - Contains Coordinate Obj 
     - **@x** - The x value of user coordinate
     - **@y** - The y value of user coordinate
     - **@name** - Driver's name (taken from 26 random name)
   - 0 Method

5. **Format** -
`format.rb`
   - The object for Translate a text file format
   - Arguments (1 arg)
     - **1 arg (filename.txt in string)** - Will be passed to be translating
   - 3 Class Variable
     - **@mapsize** - Returning the translated version of mapsize
     - **@user** - Returning the translated version of User Obj
     - **@drivers** - Returning the translated version of Array of Driver Obj
   - 1 Method
     - **translate(filename, what)** - To handle the translate Algorithm with filename and 'command' what to translate as parameter

6. **History** -
`history.rb`
   - The object for Reading and Writing history to `history.txt`
   - Arguments (1 arg)
     - **1 arg (MapGenerator Obj)** - To get all the required variables from Map Generator Obj
   - 4 Class Variable
     - **@total** - The total of curently history that has been written in `history.txt`
     - **@order** - The Order Obj that will be assigned to history
     - **@destination** - The Coordinate Obj for destination that will be assigned to history
     - **@gocli** - The MapGenerator Obj from the arguments given 
   - 3 Method
     - **put** - To put the current Order into `history.txt`
     - **readHistory** - To read all the history in `history.txt`
     - **clearHistory** - To clear all history in `history.txt`

7. **Map** -
`map.rb`
   - The object for creating a Map to be displayed
   - Arguments (1 arg)
     - **1 arg (mapsize in integer)** - To set the map size 
   - 3 Class Variable
     - **@height** - The height of the map
     - **@width** - The width of the map
     - **@projection** - 2 Dimensional Array to store the map data
   - 6 Method
     - **projection** - To handle the printout of the map onto the screen
     - **addUser(user)** - To insert user into the map, User Obj as parameter
     - **addDrivers(drivers)** - To insert Drivers into the map, Array of Drivers Obj as parameter
     - **removeUser(user)** - To remove user from the map, User Obj as parameter
     - **clearMap** - Remove all object from map / Clearing map display
     - **addRoute(order)** - Adding route into the map, with Order Obj as a parameter

8. **MapGenerator** -
`map_generator.rb`
   - The object for creating the Go-CLI machine handling
   - Arguments (0 arg)
   - 3 Class Variable
     - **@map** - To store the Map Obj of current session app
     - **@drivers** - To store the Array of Drivers of current session app
     - **@user** - To store the current user of current session app
   - 7 Method
     - **drawRandomUser(mapsize)** - Return a User Obj with random Coordinate the mapsize as the param for limit 
     - **drawRandomDrivers(n, mapsize)** - Return an Array of Drivers with n total of driver
     - **generate(args)** - Handling the args (ARGV) given when user first run the apps
     - **gmap(mapsize)** - Assigning driver and user to the Map obj in @map
     - **getNearestDriver** - Will return a Driver Obj that is near from user coordinate
     - **randomizeDriverFrom(order)** - Randomize the driver coordinate after the driver took order from user
     - **generateMapRoute(order)** - Will return a map with a route added in it

9. **Order** -
`order.rb`
   - The object for handling order that will be assigned to History Obj
   - Arguments (4 args)
     - **4 args(driver, user, price, route)** - Detail of Driver, User, Route, and price for the Order
   - 4 Class Variable
     - **@driver** - To store the Driver Obj that in order
     - **@user** - To store the User Obj that order the Go-ride
     - **@price** - To store the Order price given in the constructor arg
     - **@route** - To store the Route Obj detail
   - 1 Method
     - **totalPriceTo(destination)** - Destination Coordinate Obj as the param, to get the est price

10. **Route** -
`route.rb`
    - The object for creating a route 
    - Arguments (2 args)
      - **2 args(user, destination)** - User Obj, and the Coordinate Obj of destination
    - 3 Class Variable
      - **@get** - The route that has been made after creating, contain Array of strings
      - **@distance** - The distance of the route
      - **@addRoute** - Array of route Coordinate
    - 1 Method
      - **generateDistance(user, destination)** - To generate the distance in the route

11. **History Text files** - 
`history.txt`  
    - To store the user history
    - The format is as following
    - ```
      <|1|
      |From-[8, 15]-to-[1, 1]
      |Map-size=20*20
      |Driver's-Name=Joni
      |Distance-Traveled=21-unit
      |Total-Price=6300
      |Route=
      - Start at [8, 15]
      - Go to [7, 15]
      - Turn left
      - Finist at [7, 15]
      >
      <|2|
      |From #etc
      ```
      
12. **Format Text files** - 
`format.txt`
    - To store the format for arguments in Go-CLI
    - The format is as following
    - ```
      mapsize 20
      user_coordinate 10,10
      drivers Agus-11,15 Bima-2,7 Gilang-4,17 Zikra-13,7
      ```
    - `mapsize value`
    - `user_coordinate x,y`
    - `drivers name1-x,y name2-x,y name3-x,y #etc`
    




## Notable Assumption and Design App Details

- App design
  - The app is designed to work well if the map range between 3 to 80 
  - When the program starts, it **reset** the history
  - After program quit, the history will stay still
  - The map x axis is the horizontal line, increment from left to right
  - The map y axis is the vertical line, increment from bottom to top
  - Distance is based on horizontal and vertical move
  - Nearest calculation is based on horizontal and vertical line, not diagonal
  - If there are more than 1 nearest driver, only the first one will be chosen
  - After confirmed order, user will move to the destination coordinate
  - After took an order, driver will roam randomly on the map

- Driver
  - Driver will shown in map by their Initial
  - Driver will not have a same coordinate as the other drivers
  - Driver could have a same coordinate as the user
  - If drivers coordinate is the same as user coordinate, only user will be shown on map
  - Driver's name taken randomly from 26 name with different initial from [A to Z]
  - Driver format given as a textfile parameter should not have a same coordinate among drivers
  - Total driver in driver format given as a textfile should not exceed map size

- User
  - User will be shown by **#** on map
