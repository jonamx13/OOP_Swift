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
}

let somePoint = Point(x: 4,y: 5)
somePoint.isToTheRight(of: 1)
somePoint.isToTheRight(of: 54)
