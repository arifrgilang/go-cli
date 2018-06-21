# Go-CLI app - COMPFEST
This is second stage final assignment for COMPFEST - Software Engineering Academy

Description of the task : https://drive.google.com/file/d/1BC_tfgekX2pHJ7nWGbXguhTS8-NUlEQH/view


# Go-CLI app ver 1.1
Change log: 
- [1.1] 21 June 2018 - (06:36)
I made the functional program if this, but the code is still a mess and didn't use SOLID principles, so I will revise it later

## Running the app
The main files is *go-cli.rb* and you could have 3 way to access it
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



## Assumption and Design App Details
The recommended size of the map is the range between 3 to 80

Driver *will not* have the same coordinate as the other drivers, but driver *could* have the same coordinate as 

-- Under Construction --
