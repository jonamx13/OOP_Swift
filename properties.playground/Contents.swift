import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)

rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, lenght: 4)

// rangeOfFourItems.firstValue = 5 -> this throws an error, because it is declared as constant, even when the property is var

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("More data")
// Importer is not initialized here,
manager
// Importer is created right here, because it is not created until it is called
manager.importer.fileName
// Here we can see it already initialized
manager


struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))

print(square.center)

let initialSquareCenter = square.center
square.center = Point(x: 20, y: 20)
