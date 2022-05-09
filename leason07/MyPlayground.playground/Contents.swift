import UIKit

var greeting = "Hello, playground"

//类和结构体
struct SomeStructure {
    // 在这里定义结构体
}
class SomeClass {
    // 在这里定义类
}

struct Resolution {
    var width = 11
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//结构体和类的实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

//属性访问
print("The width of someResolution is \(someResolution.width)")
// 打印 "The width of someResolution is 0"

//访问子属性
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is 0"

//为属性赋值
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 打印 "The width of someVideoMode is now 1280"

//结构体类型的成员逐一构造器
//结构体会自动生成便利构造器
let vga = Resolution(width: 640, height: 480)
print(vga.height)

//结构体和枚举是值类型
/**
 Swift 中所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型的属性，在代码中传递的时候都会被复制。
 */
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
//cinema 和 hd 是两个不同的实例， cinema是hd的 copy版本

//如果我们修改cinema的width
cinema.width = 2048
//查看cinema是否被修改
print(cinema.width)  // 打印2048
//然后去查看hd的width
print(hd.width)      //打印1920 并没有改变

//枚举也遵循相同的准则
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")
// 打印 "The current direction is north"
// 打印 "The remembered direction is west"


//类是引用类型
//使用的是已存在的实例， 不会被copy
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//将 tenEighty 赋值给一个名为 alsoTenEighty 的新常量，并修改 alsoTenEighty 的帧率
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//使用let来定义实例，依然可以改变实例的属性
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 打印 "The frameRate property of theEighty is now 30.0"

//恒等运算符
/**
 相同（===）
 不相同（!==）
 使用这两个运算符检测两个常量或者变量是否引用了同一个实例
 
 请注意，“相同”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同。“相同”表示两个类类型（class type）的常量或者变量引用同一个类实例。“等于”表示两个实例的值“相等”或“等价”，判定时要遵照设计者定义的评判标准。
 */
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// 打印 "tenEighty and alsoTenEighty refer to the same VideoMode instance."


//属性

//存储属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数 0，1，2
rangeOfThreeItems.firstValue = 6
// 该区间现在表示整数 6，7，8

//常量结构体实例的存储属性
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数 0，1，2，3
/**
 因为 rangeOfFourItems 被声明成了常量（用 let 关键字），所以即使 firstValue 是一个可变属性，也无法再修改它了。
 这种行为是由于结构体属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
 属于引用类型的类则不一样。把一个引用类型的实例赋给一个常量后，依然可以修改该实例的可变属性。
 */
//rangeOfFourItems.firstValue = 6  //会报错 error: cannot assign to property: 'rangeOfFourItems' is a 'let' constant
// 尽管 firstValue 是个可变属性，但这里还是会报错

//延时加载存储属性

//延时加载存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延时加载存储属性。
//必须将延时加载属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。
//而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延时加载。
class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建


print(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了
// 输出“data.txt”
//注意⚠️：如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。

//计算属性
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
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 打印“square.origin is now at (10.0, 10.0)”

//setter和getter 可以简化
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//只读计算属性
//只有 getter 没有 setter 的计算属性叫只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// 打印“the volume of fourByFiveByTwo is 40.0”

//属性观察器

/**
 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。
 你可以在以下位置添加属性观察器：
 自定义的存储属性
 继承的存储属性
 继承的计算属性
 */
class StepCounter {
    var totalSteps: Int = 0 {
        //在新的值被设置之前调用
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        //didSet
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步

//属性包装器
/**
 属性包装器在管理属性如何存储和定义属性的代码之间添加了一个分隔层。
 举例来说，如果你的属性需要线程安全性检查或者需要在数据库中存储它们的基本数据，那么必须给每个属性添加同样的逻辑代码。
 当使用属性包装器时，你只需在定义属性包装器时编写一次管理代码，然后应用到多个属性上来进行复用。
 */

//定义一个属性包装器
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        //这个 setter 确保新值小于 12，而且返回被存储的值。
        set { number = min(newValue, 12) }
    }
}

//创建结构体
struct SmallRectangle {
    //使用属性包装器来包装属性
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

//调用测试
var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
// 打印 "10"

rectangle.height = 24
print(rectangle.height)
// 打印 "12"

/**
 当你把一个包装器应用到一个属性上时，编译器将合成提供包装器存储空间和通过包装器访问属性的代码。（
 属性包装器只负责存储被包装值，所以没有合成这些代码。）
 不利用这个特性语法的情况下，你可以写出使用属性包装器行为的代码。
 
 举例来说，这是先前代码清单中的 SmallRectangle 的另一个版本。
 这个版本将其属性明确地包装在 TwelveOrLess 结构体中，而不是把 @TwelveOrLess 作为特性写下来：
 
 wrapped 中文为“包装” 包裹住的意思
 
 struct SmallRectangle {
     private var _height = TwelveOrLess()
     private var _width = TwelveOrLess()
     var height: Int {
         get { return _height.wrappedValue }
         set { _height.wrappedValue = newValue }
     }
     var width: Int {
         get { return _width.wrappedValue }
         set { _width.wrappedValue = newValue }
     }
 }

 */

//设置被包装属性的初始值
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// 打印 "0 0"


