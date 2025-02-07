import UIKit

class Counter {
    var count = 0
    
    func incremet() {
        self.count += 1
    }
    
    func increment(by amount: Int){
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.incremet()
counter.increment(by: 5)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRight(of x:Double) -> Bool {
        return self.x > x
    }
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX
        // self.y += deltaY
        self = Point(x: self.x + deltaX, y: self.y + deltaY)
    }
}

var somePoint = Point(x: 4,y: 5)
somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)

somePoint.moveBy(x: 2, y: -3)
print(somePoint)

enum DifferentStateSwitch {
    case off, low, high
    
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var controllerStatus = DifferentStateSwitch.off

controllerStatus.next()
controllerStatus.next()
controllerStatus.next()

class SomeClass {
    class func someMethod() {
        print("Hello")
    }
}

SomeClass.someMethod()

@MainActor
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

@MainActor
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completeLevel(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        self.playerName = name
    }
}

var player = Player(name: "Alice")

player.completeLevel(level: 1)
player

player.completeLevel(level: 7)


if player.tracker.advance(to: 7) {
    print("We can go to level 7")
} else {
    print("Level 7 is still llocked")
}
