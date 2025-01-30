import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)

rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, lenght: 4)

// rangeOfFourItems.firstValue = 5 -> this throws an error, because it is declared as constant, even when the property is var
