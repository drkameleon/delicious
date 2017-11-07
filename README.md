<!--<span style='font-size:30px;'><img src='logo.png' width='50'/> <h4>Delicious</h4></span>-->
<img align="left" width="100" src="logo.png">

<h1>Delicious.swift</h1>

### All the little things you've been missing in Swift   

----- 

![Language](https://img.shields.io/badge/Language-Swift-orange.svg?style=flat-square) ![Platform](https://img.shields.io/badge/Platform-iOS%20%2F%20macOS-lightgrey.svg?style=flat-square) [![HitCount](http://hits.dwyl.io/drkameleon/delicious.svg)](http://hits.dwyl.io/drkameleon/delicious)

### How to include in your project

#### The easy way

Just drag'n'drop all of the sources in the `DeliciousSwift/DeliciousSwift` folder to your Project tree, withing Xcode. It should work flawlessly

#### As a framework

1. Download/Clone the project
2. Build it
3. Under **Build Phases** > **Link Binary With Libraries**, add the resulting `DeliciousSwift.framework` 
4. Under **Build Phases**, create another **"Copy Files Phase"** and add the framework there too, to be copied under the `Frameworks` folder
5. Under **Build Settings**, go to **Framework Search Paths** and add the location of the `DeliciousSwift.framework` you just compiled
6. `import DeliciousSwift` in any over your Swift files and you're ready to go

#### Via Carthage/CocoaPods

Pending... :)

-----

### Copyright & License (and other boring legal stuff)

Copyright (c) 2017 Ioannis Zafeiropoulos (aka Dr.Kameleon). All rights reserved.

See the file "LICENSE" for information on the history of this software, terms & conditions for usage, and a DISCLAIMER OF ALL WARRANTIES.

All trademarks referenced herein are property of their respective holders.

