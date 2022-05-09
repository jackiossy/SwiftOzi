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


//在实例方法中修改值类型
struct Point1 {
    var x = 0.0, y = 0.0
    //mutating 关键字 允许修改属性
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
/**
 注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，
 因为其属性不能被改变，即使属性是变量属性
 */
var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint1.x),\(somePoint1.y))")

//在可变方法中给self赋值
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaX)
    }
}

/**
 新版的可变方法 moveBy(x:y:) 创建了一个新的结构体实例，它的 x 和 y 的值都被设定为目标值。
 调用这个版本的方法和调用上个版本的最终结果是一样的。
 */

//枚举的可变方法可以把 self 设置为同一枚举类型中不同的成员：
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
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

//上面的例子中定义了一个三态切换的枚举。每次调用 next() 方法时，开关在不同的电源状态（off, low, high）之间循环切换。

var ovenLight = TriStateSwitch.low

ovenLight.next() //等于.high

ovenLight.next() //等于.off

//类型方法

class SomeClass {
    //类型方法
    class func someTypeMethod() {
        //类型方法的实现
        print("我是个类型方法")
        //方法体中，self 指类本身， 而不是实例本身
    }
}

SomeClass.someTypeMethod()

//监测玩家的游戏发展情况
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// 打印“highest unlocked level is now 2”

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// 打印“level 6 has not yet been unlocked”

