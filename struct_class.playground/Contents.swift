import UIKit

//Struct vs Class

struct SomeStruct {
    // structure definition
}

class SomeClass {
    // class definition
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)

// someResolution.width = 1280 -> not possible because it was declared as a constant and structs cannot change over time

// It can change because the constant is the memory reference, but the properties are declared as var inside the class
someVideoMode.frameRate = 30.0
print(someVideoMode.frameRate)
