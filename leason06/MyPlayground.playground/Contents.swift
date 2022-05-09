import UIKit

var greeting = "Hello, playground"

//枚举
//枚举语法
enum SomeEnumeration {
    //定义枚举
}

//用枚举表示指南针的四个方向
/*
与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。
在上面的 CompassPoint 例子中，north，south，east 和 west 不会被隐式地赋值为 0，1，2 和 3。
相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型。
 */
enum CompassPoint {
    case north
    case south
    case east
    case west
}

//多个成员值可以写在同一行
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
//被类型推断后，可以省略CompassPoint类别
directionToHead = .east

//使用swift语句匹配枚举值
directionToHead = .south
switch directionToHead {
    //强制穷举 必须case出CompassPoint中的所有类型
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// 打印“Watch out for penguins”

//如果关闭强制穷举，需要在case当中写default
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 打印“Mostly harmless”

//枚举成员的遍历
/**
 令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合。下面是一个例子
 */
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print(numberOfChoices)

//通过for in 遍历枚举中的所有case
for beverage in Beverage.allCases {
    print(beverage)
}

//关联值

//定义两种条码的枚举。枚举后面()内为关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//创建条形码变量
var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”

//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// 打印“QR code: ABCDEFGHIJKLMNOP.”


//原始值

//一个枚举当中，原始值的类型必须相同
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//原始值的隐式赋值
enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet_v = Planet1.venus.rawValue

switch planet_v {
case 2:
    print("venus")
default:
    print("nothing")
}

enum CompassPoint1: String {
    case north, south, east, west
}

let earthsOrder = Planet1.earth.rawValue
// earthsOrder 值为 3

let sunsetDirection = CompassPoint1.west.rawValue
// sunsetDirection 值为 "west"




//递归枚举
/**
 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// 打印“18”
