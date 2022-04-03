import UIKit

var greeting = "Hello, playground"

//实例方法
class Counter {
    var count = 0
    func increment(){
        self.count += 1
    }
    func increment(by amount:Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 10)
print(counter.count)
counter.reset()
print(counter.count)

//self. 可以区分参数和属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// 打印“This point is to the right of the line where x == 1.0”
