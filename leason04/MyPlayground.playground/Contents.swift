 import UIKit

var greeting = "Hello, playground"

//swift函数

func printstring(str:String) -> String {
    return str
}

print(printstring(str: "HHKB YYDS"))

//定义一个问候姓名的函数 参数string 返回string
func sayHello(person:String) -> String {
    let greeting = "Hello," + person + "!"
    return greeting
}
//调用函数，定义一个常量来接收返回的String
let result = sayHello(person: "Alice")
print(result)

//无参数的函数
func sayHelloWorld() -> String {
    return "Hello world !"
}
print(sayHelloWorld())

//多参数函数
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "You already say hello."
    }else {
        return sayHello(person: person)
    }
}

print(greet(person: "Alice", alreadyGreeted: false))

//无返回值函数
func sayHelloEveryOne(person:String) {
    print("hello every one.")
}
sayHelloEveryOne(person: "") //调用函数的时候可以忽略返回值

//多重返回值函数
//在数组当中找到最大值和最小值函数
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax =  array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let int_array = [1,2,3,1000,0,4,5,6,100]

let mixTuple = minMax(array: int_array)
print("最大值为\(mixTuple.max), 最小值为\(mixTuple.min)")

//元祖类型，和数组类似，可以存放不同类型

//可选元祖返回类型
/**
 如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的 元组返回类型反映整个元组可以是 nil 的事实。你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组，例如 (Int, Int)? 或 (String, Int, Bool)?
 
 注意
 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的。可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
 
 是在元组的外面的括号外写问号
 */

func minMaxOption(array: [Int]) -> (mix: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//可选绑定 来判断返回的元组是否为nil ,如果返回元组为nil 则不会打印
if let bounds = minMaxOption(array: [8,-5,2,109,3,71]) {
    print(bounds)
}

//可变参数函数
func addAllInt (intaray intArray: Int...) -> Int {
    var result = 0
    for i in intArray {
        result += i
    }
    return result
}
print(addAllInt(intaray:1,2,3,100))

//输入输出函数, 改变外部变量
//交换a和b
//函数参数 inout 可修改外部变量
var a = 7
var b = 13
print("a=\(a),b=\(b)")

func exchangeAB (a: inout Int, b: inout Int) {
    var temp = 0
    temp = a
    a = b
    b = temp
}

exchangeAB(a: &a, b: &b)
print("a=\(a),b=\(b)")

//函数类型
/**
 这两个函数的类型是 (Int, Int) -> Int，可以解读为:
 “这个函数类型有两个 Int 型的参数并返回一个 Int 型的值”。
 
 这个函数的类型是：() -> Void，或者叫“没有参数，并返回 Void 类型的函数”。

 */


func addTwoInts (a: Int,b: Int) -> Int {
    return a + b
}

//如何使用函数类型

var mathFunction: (Int, Int) -> Int = addTwoInts

print(mathFunction(1,1))

//swift 自动函数类型推断 , 可以不写函数的类型
var mathFunction01 = addTwoInts //mathFunction01 被推断为 (Int, Int) -> Int类型
print(mathFunction01(10,20))

//函数类型作为参数类型
func printMathResult(_ mathFunction:(Int ,Int) -> Int, _ a: Int, _ b: Int) {
    print("result : \(mathFunction(a,b))")
}

printMathResult(mathFunction01, 30, 30)
