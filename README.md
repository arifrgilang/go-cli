# Go-CLI app - COMPFEST
This is second stage final assignment for COMPFEST - Software Engineering Academy

Description of the task : https://drive.google.com/file/d/1BC_tfgekX2pHJ7nWGbXguhTS8-NUlEQH/view



# Go-CLI app ver 1.2
Change log: 
- [1.2] 21 June 2018 - (18:18)
  - Adding new behaviour to the app
    - **Before** - After order was confirmed, user move to the destination, and driver who took the order come back to his/her last Coordinate
    - **After** - After order was confirmed, user move to the destination, and **_the driver who took the order will roam randomly into new Coordinate_**
    
- [1.1] 21 June 2018 - (06:36)
  -I made the functional program of this, but the code is still a mess and didn't use SOLID principles, so I will revise it later





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


2. **Order Go-Ride** -
When user chooses this action, app will ask the specified coordinate.
User should input the coordinate that he/she wants to go to.
After that, the app will allocate the nearest driver to user and display the name of the driver, the route to destination, as well as the price estimate.
User must confirm the Order with [y,n]

3. **View History** -
When user chooses this action, app will show the history of the user.
If user hasn't made any order, it will return nothing

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
     - **@name** - Driver's name (taken from 24 random name)
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
   - 4 Method
     - **projection** - To handle the printout of the map onto the screen
     - **addUser(user)** - To insert user into the map, User Obj as parameter
     - **addDrivers(drivers)** - To insert Drivers into the map, Array of Drivers Obj as parameter
     - **removeUser(user)** - To remove user from the map, User Obj as parameter

8. **MapGenerator** -
`map_generator.rb`
   - The object for creating the Go-CLI machine handling
   - Arguments (0 arg)
   - 3 Class Variable
     - **@map** - To store the Map Obj of current session app
     - **@drivers** - To store the Array of Drivers of current session app
     - **@user** - To store the current user of current session app
   - 5 Method
     - **drawRandomUser(mapsize)** - Return a User Obj with random Coordinate the mapsize as the param for limit 
     - **drawRandomDrivers(n, mapsize)** - Return an Array of Drivers with n total of driver
     - **generate(args)** - Handling the args (ARGV) given when user first run the apps
     - **gmap(mapsize)** - Assigning driver and user to the Map obj in @map
     - **getNearestDriver** - Will return a Driver Obj that is near from user coordinate

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
    - 2 Class Variable
      - **@get** - The route that has been made after creating, contain Array of strings
      - **@distance** - The distance of the route
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
The recommended size of the map is the range between 3 to 80

Driver *should not* have the same coordinate as the other Drivers, but Driver *could* have the same coordinate as User

Driver *should not* have a same Initial Name because the map will show Driver's Initial.

There is a total 24 Name randomly taken for the Driver. So the maximum driver must be 24. Other than that will crash the app

If Driver have the same coordinate as the other Driver, only one driver will be shown on map

If Driver have the same coordinate as the User, only User will be shown on map

Map will show the User with **#** and driver with their Initial Name

App will find the nearest Driver for the user

If there are more than 1 nearest driver, only the first one will be chosen

The x axis is the horizontal line, increment from left to right

The y axis is the vertical line, increment from bottom to top

User's Destination *should not* exceed the map size, or lower than 1, otherwise app will quit

When the program starts, it **reset** the history

Once the user confirmed the order, History of the order will be put into the history.txt

The history contains user coordinate, destination coordinate, map size, Driver's name, distance traveled, total price, and route

After quitting the app, history is still there. When the program is started again after that, history of the last session will be gone.

Once the user confirmed the order, the user Coordinate will be at the destination coordinate

The destination inputted must be at the range of the map size

The destination inputted format must be the same as what the app asks

If the user input any other key instead the available option, the app will close

