# DCS-Maze_Generator-Unity

## Release Execution (on Windows)
 - Download the latest release from [releases](https://github.com/DeMaCS-UNICAL/DCS-Maze_Generator-Unity/releases)
 - Extract the folder
 - Run the executable file


## Getting Started for Developers (Installation and Usage)
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing
Clone repository
 ```
 git clone https://github.com/DeMaCS-UNICAL/DCS-Maze_Generator-Unity.git
 ```

### Running
Import project in VisualStudio:
 - Click on `File` menu item 
 - Click on `Open Project/Solution`
 - Select the `.csproj` file located in the folder where you cloned the repository

Build the Unity Asset:

 - Right click on the solution name and click on `Build Solution`

Import in Unity Project:

- Create a new Unity empty project
- Change .Net target to the 4.6 (from `Unity project --> Edit -> Project Setting -> Player -> Scripting Runtime Version -> Experimental 4.6`)
- Create a `plugins` folder into the Unity Assets folder of your project
- Copy and paste the previously builded `dll` into the Unity `Assets/plugins` folder of your project
- Reload the project


## Credits
 - Francesco Calimeri
 - Stefano Germano
 - Giovambattista Ianni
 - Francesco Pacenza
 - Armando Pezzimenti
 - Andrea Tucci

From the [Department of Mathematics and Computer Science](https://www.mat.unical.it) of the [University of Calabria](http://unical.it)


## License
  This project is licensed under the [MIT License](LICENSE)
