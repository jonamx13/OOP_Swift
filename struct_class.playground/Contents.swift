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

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
print("\(cinema.width) x \(cinema.height)")
cinema.width = 2048
print("\(cinema.width) x \(cinema.height)")
print("\(hd.width) x \(hd.height)")

enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.north
let oldDirection = currentDirection

currentDirection = .south

print(currentDirection)
print(oldDirection)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30.0
tenEighty.frameRate

if tenEighty === alsoTenEighty { // !== inequality
    print("These objects are the same")
} else {
    print("These are different objects")
}
