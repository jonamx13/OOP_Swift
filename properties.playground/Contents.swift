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

// willSet // didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("The number of steps will increase up to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("The number of steps has increased by: \(totalSteps - oldValue)")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 10000
stepCounter.totalSteps += 15000
stepCounter.totalSteps


// Exercise: Define a class with a property for the user HP, this will have to be in the range 0...100
    // if the value goes upper than 100, limit it
    // if the value goes to zero, print the message "Game over"

class PlayerHP {
    var hpPoints: Int = 100 {
        willSet(newHP) {
            print("Your current HP are \(hpPoints)")
        }
        didSet {
            if hpPoints > 100 {
                hpPoints = 100
                print("Max HP Reached -> Current HP: \(hpPoints)")
            } else {
                print("Your new HP are: \(hpPoints)")
            }
        }
    }
}

let newPlayer = PlayerHP()

newPlayer.hpPoints = 50
newPlayer.hpPoints += 40
newPlayer.hpPoints += 52


struct SomeStruct {
    var counter = 0
    static let storedTypeProperty = "SOME VALUE"
    static var computedTypeProperty : Int {
        return 1
    }
}

var instanceStr = SomeStruct()

var otherInstanceStr = SomeStruct()

SomeStruct.computedTypeProperty

enum SomeEnum {
    static let storedTypeProperty = "SomeValue"
    static var computedTypeProperty : Int {
        return 5
    }
}

SomeEnum.storedTypeProperty

class SomeClass {
    static let storedTypeProperty = "Some value"
    static var computedTypeProperty : Int {
        return -9
    }
    
    class var overrideableComputedTypeProperty : Int {
        return 108
    }
}


// Exercise -> create a class where budget is an static variable that every member has access to it
    // Implement draw, deposit and consult total budget

actor FamilyBudget {
    static var totalBudget: Double = 0
    // private var movements: [String]
    
    static func GetTotalBudget() {
        print("Your total budget is: \(totalBudget)")
    }
    
    static func Draw(_ amount: Double) {
            totalBudget -= amount
            print("You have drawn \(amount), your new budget is \(totalBudget)")
    }
    
    static func Deposit(_ amount: Double) {
            totalBudget += amount
            print("Your have done a deposit of \(amount), your new budget is \(totalBudget)")
        }
    
}

enum TransactionType {
    case deposit
    case draw
    case consult
}

class FamilyMember {
    let name : String
    
    func MakeTrasactions(transactionType : TransactionType, _ amount: Double? = nil) {
        let account = FamilyBudget()
        
        switch(transactionType) {
        case .deposit:
            if let amount = amount, amount > 0 {
                print(name)
                FamilyBudget.Deposit(amount)
            } else {
                print(name)
                print("Error: Please enter a valid amount")
            }
        case .draw:
            if let amount = amount {
                if amount <= FamilyBudget.totalBudget {
                    print(name)
                    FamilyBudget.Draw(amount)
                } else {
                    print(name)
                    print("Error: Insufficient funds for this draw")
                }
            } else {
                print(name)
                print("Error: please enter a valid amount for the draw")
            }
            
        case .consult:
            FamilyBudget.GetTotalBudget()
        }
    }
    
    init(name: String) {
        self.name = name
    }
}

let jonathan = FamilyMember(name: "Jonathan")
let edward = FamilyMember(name: "Edward")

FamilyBudget.GetTotalBudget()
FamilyBudget.totalBudget = 1000
FamilyBudget.GetTotalBudget()

jonathan.MakeTrasactions(transactionType: .deposit, 100)
jonathan.MakeTrasactions(transactionType: .draw, 50)
jonathan.MakeTrasactions(transactionType: .consult)

edward.MakeTrasactions(transactionType: .deposit, 0)
edward.MakeTrasactions(transactionType: .deposit, nil)
edward.MakeTrasactions(transactionType: .draw, 1500)
edward.MakeTrasactions(transactionType: .draw, nil)

edward.MakeTrasactions(transactionType: .draw, 570)

FamilyBudget.totalBudget
