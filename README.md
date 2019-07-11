# Project showing Mapbox offline and online do not work together

### Description of the bug

This project has example code in the ViewController.swift.
It shows how downloading a single small bounding box in San Francisco at 14 zoom which should be about 1 - 2 mb
Instead the offline pack downloads 96 mb of resources. See the image below of me measuring the sqllite database
<br/>
![Sqllite](https://github.com/kev71187/MapboxOfflineIssue/blob/master/screenshots/size_of_sqllite.png?raw=true)

The 96 mb in and of itself is annoying but not a show stopper. The problem is that the cache shares a database with the offline packs and that cache has a 50 mb limit and then it stops working completely.
Well a single small area download takes you over that threshold and once the database is over the threshold the online functionaly performance takes a massive hit and becomse basically unusable 
The image below is the error returned when pannign around once the database is over 50mb.
<br/>
![Error message](https://github.com/kev71187/MapboxOfflineIssue/blob/master/screenshots/error_message.png?raw=true)


### To run this project
`
  pod install
`
Replace the mapbox key with a valid key in the plist
<br/>
![Mapbox key](https://github.com/kev71187/MapboxOfflineIssue/blob/master/screenshots/key.png?raw=true)

