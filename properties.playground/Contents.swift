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

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

cuboid.volume
// cuboid.volume = 100 -> Throws an error because it is a read-only computed property

/*
 Exercise: Create a struct for a greeting with a computed property.
    - Gender
    - Language
    - Person
 */

enum Gender {
    case male, female
}

enum Language {
    case Spanish, English, French
}

struct Person {
    var name: String
    var language: Language
    var gender: Gender?
    
    
}

struct Greeting {
    var person: Person
    
    var greetingLanguage: String {
        switch person.language {
        case .Spanish:
            return "Hola "
        case .English:
            return "Hello "
        case .French:
            return "Salut "
        }
    }
    
    var greetingGender: String {
        switch person.gender {
        case .male:
            switch person.language {
            case .Spanish:
                return "Sr. "
            case .English:
                return "Mr. "
            case .French:
                return "Monsieur "
            }
        case .female:
            switch person.language {
            case .Spanish:
                return "Sra. "
            case .English:
                return "Mrs. "
            case .French:
                return "Madame "
            }
        default:
            return ""
        }
    }
    
    var greetingText: String {
        return "\(greetingLanguage)\(greetingGender)\(person.name)!"
    }
}

let personList = [
    // Spanish use-cases
    Person(name: "José", language: .Spanish, gender: .male),
    Person(name: "María", language: .Spanish, gender: .female),
    Person(name: "Guadalupe", language: .Spanish),
    
    // English use-cases
    Person(name: "Harry", language: .English, gender: .male),
    Person(name: "Sally", language: .English, gender: .female),
    Person(name: "Gabrielle", language: .English),
    
    // French use-cases
    Person(name: "François", language: .French, gender: .male),
    Person(name: "Celine", language: .French, gender: .female),
    Person(name: "Jules", language: .French)
]

for (index, person) in personList.enumerated() {
    let greetPerson = Greeting(person: person).greetingText
    
    print("Person \(index + 1): \(greetPerson)")
}

