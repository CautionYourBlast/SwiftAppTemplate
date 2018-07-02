# CYB Swift App Template

This web app template is using [vapor](https://vapor.codes). Vapor is a Web Framework for Swift that works on macOS and Ubuntu,
 and all of the packages that Vapor offers.

Vapor is the most used web framework for Swift. It provides a beautifully expressive and easy to use foundation for your next website or API.

### How to use this repo
Use this repo to quickly startup a new web Swift project. It will contain all you need to get started including some html templates using [leaf](https://github.com/vapor/leaf), some routes and scss. You can either clone this repo or once vapor is installed, use vapor to generate a project using this repo.

If you would rather generate an API, install the prerequisites excluding libsass. Then run `vapor new <name>`. It will generate a simple mySQL database and some routes.

#### Prerequisites
* **Swift 4.1** 
  * Run `swift --version` to check. Swift 4.1 is bundled with Xcode >v9.3. 
* **Homebrew** - Brew is needed to install Vapor and libsass
  * Run `brew` to check. See [brew.sh](https://brew.sh) on how to install homebrew.
* **Vapor**
  * Run `vapor --help` to check. `Brew install vapor/tap/vapor` to install.
* **libsass** - To compile and watch the styles
  * `brew install libsass`   


#### Setup
* `cd` to the directory you wish to start your new swift web app
* To start your new project using this template: `vapor new <name> --template=CautionYourBlast/SwiftAppTemplate`
* `cd <name>`
* Running the project can be done in two ways, with Xcode or via Command line.
  1. **Xcode** allows you to build, run and stop your server from within Xcode and use the debugger. Run `vapor xcode` to generate the Xcodeproj
  2. **cli** `vapor build`, then `vapor run` to boot up the server. `vapor clean` is handy in case anything breaks.
* The server will start on [localhost:8080](http://localhost:8080).
* To start watching sass files `vapor run sass`. No need to restart the app, just refresh the page.








