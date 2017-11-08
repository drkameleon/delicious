<!--<span style='font-size:30px;'><img src='logo.png' width='50'/> <h4>Delicious</h4></span>-->
<img align="left" width="100" src="logo.png">

<h1>Delicious.swift</h1>

### All the little things you've been missing in Swift   

----- 

![Language](https://img.shields.io/badge/Language-Swift-orange.svg?style=flat-square) ![Platform](https://img.shields.io/badge/Platform-iOS%20%2F%20macOS-lightgrey.svg?style=flat-square) ![License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square) ![Build Status](https://img.shields.io/travis/drkameleon/delicious.svg?style=flat-square) [![HitCount](http://hits.dwyl.io/drkameleon/delicious.svg)](http://hits.dwyl.io/drkameleon/delicious)

### How to include it in your project

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

### Reference

#### Arrays.swift
Method | Description | Definition
-------|-------------|------------
**removeDuplicates**|Removes duplicates from array|`() -> [Element]`
**removeByValue**|Removes element from array by value|`(_ v: Element) -> [Element]`
**shuffle**|Shuffles array|`() -> [Element]`
**randomElement**|Return random element from array|`() -> Element`
**findValue**|Search for value in array and returns array of indexes|`(_ v: Element) -> [Int]`

#### Colors.swift
Method | Description | Definition
-------|-------------|------------
**init**|Creates an NSColor instance from a hex value|`(hex: Int)`

#### Dialogs.swift
Method | Description | Definition
-------|-------------|------------
**alertDialog**|Displays alert dialog/sheet|`(_ message: String, info: String, handler: @escaping ()->Void, style: NSAlert.Style = .informational, sheet: Bool = true)`
**confirmationDialog**|Displays confirmation dialog/sheet|`(_ message: String, info: String, handler: @escaping (Bool)->Void, first: String = "OK", second: String = "Cancel", style: NSAlert.Style = .informational, sheet: Bool = true)`
**openDialog**|Displays Open dialog/sheet|`(handler: @escaping ([String])->Void, otherwise: @escaping ()->Void = }, files: Bool = true, filetypes: [String] = [], directories: Bool = false, multiple: Bool = true, hidden: Bool = true, sheet: Bool = true)`
**saveDialog**|Displays Save dialog/sheet|`(handler: @escaping (String)->Void, otherwise: @escaping ()->Void = }, filetypes: [String] = [], sheet: Bool = true)`

#### Files.swift
Method | Description | Definition
-------|-------------|------------
**fileExists**|Checks if file in path exists|`() -> Bool`
**isFolder**|Check if path is folder|`() -> Bool`
**copyFileTo**|Copies file at path to given path|`(_ path: String) -> Void`
**moveFileTo**|Moves file at path to given path|`(_ path: String) -> Void`
**renameFileAs**|Renames file at path as new path|`(_ path: String) -> Void`
**deleteFile**|Deletes file at path|`() -> Void`
**createAsFolder**|Creates folder from path|`() -> Void`
**pathExtension**|Extracts extension from path|`() -> String`
**pathFilename**|Extracts filename from path|`() -> String`
**pathFolder**|Extracts folder from path|`() -> String`
**pathContents**|Gets folder contents from path|`() -> [String]?`

#### Log.swift
Method | Description | Definition
-------|-------------|------------
**printLog**|Prints message to log|`(_ obj: Any? = nil, error: Bool = false, _ file : String = #file, _ line : Int = #line, _ function : String = #function)`

#### Strings.swift
Method | Description | Definition
-------|-------------|------------
**writeToFile**|Writes string to given path|`(_ path: String, encoding: String.Encoding = .utf8) -> Void`
**beginsWith**|Checks if string begins with given string|`(_ s: String) -> Bool`
**endsWith**|Checks if string ends with given string|`(_ s: String) -> Bool`
**replace**|Replaces substring in string with given string|`(_ what: String, with: String) -> String`
**replaceRegex**|Replaces regular expression in string with given string|`(_ what: String, with: String) -> String`
**containsRegex**|Checks if string contains regular expression|`(_ r: String) -> Bool`
**trim**|Trims characters in string|`(_ chars: String) -> String`
**trimWhitespace**|Trims all whitespace in string|`() -> String`
**split**|Splits string using given separator string|`(_ separator: String) -> [String]`
**splitWords**|Splits words in string|`() -> [String]`

#### Tasks.swift
Method | Description | Definition
-------|-------------|------------
**executeTerminal**|Executes terminal command (a)synchronously|`(_ command: String, args: [String] = [], handler: @escaping (String, String)->Void, async: Bool = true)`

-----

### Copyright & License (and other boring legal stuff)

Copyright (c) 2017 Ioannis Zafeiropoulos (aka Dr.Kameleon). All rights reserved.

See the file "LICENSE" for information on the history of this software, terms & conditions for usage, and a DISCLAIMER OF ALL WARRANTIES.

All trademarks referenced herein are property of their respective holders.

