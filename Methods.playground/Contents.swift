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
