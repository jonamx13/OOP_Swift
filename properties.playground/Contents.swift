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
