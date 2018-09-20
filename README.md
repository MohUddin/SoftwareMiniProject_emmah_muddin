# EC 463 - Software Mini Project by Emma Howard (emmabh97) and Mohammed Uddin (muddin1)
Senior Design software miniproject. Practice working in a Agile development environment, and working with cloud databases.

## Home Climate - Getting Started

Home Climate is inspired by EC 463 (senior design course at Boston University) to practice working within a small team setting to develop an application that stores/retrieves data on cloud databases. Following the Agile development cycle, we worked on defining requirements and concurrently working on the backend and UI design in our first sprint. After some preliminary gains, in our second sprint we worked to integrate the frontend to the back end.

The app features include user authentication through a Google sign-in, individualized data from simulated sensors that track humidity and temperature, and a plot of most recently recorded/fetched data. 

![homescreen](https://github.com/MohUddin/SoftwareMiniProject_emmah_muddin/blob/master/Screenshots/Screen%20Shot%202018-09-19%20at%205.48.01%20PM.png)
                                             *homescreen of app*

## Prerequisites
* Skills
    * practice agile SW development techniques
    * practice code management tools (GitHub)
* Development
   * practice cloud services
   * practice basic service APIs (e.g. login)
   * practice Database basic skills
   * simulate service
      * efficiency and productivity
      * system design
* Verification
   * define tests to ensure deliverable meets requirements

#### Application Requirements ####

* app can be iOS, Android or Web
* any cloud service provider
* any database service
* secure login
* plot sampled temperature and humidity from a sensor 
    

## Installing

In order for one to see the source code, this application can be run by downloading the folder "xCode Project", and then opening the xcworkspace file. From there, one can run the application on a simulated or physical Apple device. This prototype was built for iPhone 8 Plus.

This application can also be exported as an ipa file and deployed to the App Store in its final stages.

## Running the App

See "Screenshots" folder for pictures of the application in practice.

For this two week process, we were able to complete two sprints to create our iOS application.Sprint one consisted of building a basic app that displayed data and used Google login functionality, creating a random number generator, and configuring a database in the cloud.

Spring two consisted of integrating the two moving parts, as well as using the data to plot a sampled set.

The app can be run in xCode on a Mac computer either on a simulated or a physical Apple device. This prototype was designed for an iPhone 8 Plus simulator.In order to run, one must download the entire “xCode Project” folder, open the .xcworkspace file in xCode and click the play button in the upper left hand corner of the application. A simulator will then begin to boot up.Using the Google Login SDK, our login process is fairly simple— one’s username and password is the same as their google account. If they are not within our database, though, they will be prompted to register for an account.The Google login returns a unique User ID code, which is stored in Apple’s Keychain, and then used as the User ID within our database as well.

![ui image](https://github.com/MohUddin/SoftwareMiniProject_emmah_muddin/blob/master/Screenshots/HomeClimate_UI.JPG) 
                                         *UI design of HomeClimate*

Cloud Firebase Firestore was used as a service, and is queried within the application to check if the user is registered to our application, as well as if they have a registered house identification.

Later within the application, the chart button is pushed to get data and plot it with the Charts library.

## Built With

* [Python](https://www.python.org/)
* [Swift / iOS](https://developer.apple.com/swift/)
* [Google Firestore](https://firebase.google.com/docs/firestore/)



## Authors

* **Emma Howard** - *Front End + UI + Integration* [profile](https://www.linkedin.com/in/emmabh/)
* **Mohammed Uddin** - *Backend Database* [profile](https://www.linkedin.com/in/mouddin/)

## Licensing

## Acknowledgements

Shout outs to Osama Alshayk and Alan Pisano for being totally tubular. 


