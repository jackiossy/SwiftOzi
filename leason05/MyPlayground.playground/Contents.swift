import UIKit
import Darwin

var greeting = "Hello, playground"


//逃逸闭包 比较特殊，尽量不要用逃逸闭包
//定义了一个数组变量，数组放的东西是个函数
var completionHandlers: [() -> Void] = []
//定义了一个函数，参数为一个闭包
//参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    //函数实现为将函数添加到函数外定义的数组之中
    completionHandlers.append(completionHandler)
}
//定义了一个函数，参数为一个函数
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    //调用了传入参数的函数
    closure()
}
//定义了一个类
class SomeClass {
    //定义变量x=10
    var x = 10
    //类方法函数，函数内调用类外部参数
    func doSomething() {
        //传输参数为类中的变量x
        someFunctionWithEscapingClosure { self.x = 100 }
        //直接传入x=200
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出“200”

completionHandlers.first?()
print(instance.x)
// 打印出“100”

//自动闭包
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// 打印出“5”

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// 打印出“5”

//只有在调用闭包之后 数组中的数据才会被移除
print("Now serving \(customerProvider())!")
// 打印出“Now serving Chris!”
print(customersInLine.count)
// 打印出“4”

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// 打印出“Now serving Alex!”
print(customersInLine.count)

// customersInLine is ["Ewa", "Barry", "Daniella"]
//@autoclosure 会将参数customerProvider自动转化成一个闭包
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
//所以不需要{} 传入一个闭包， 只需要传入闭包内的执行内容， autoclosure会自动将传入的方法转化成闭包 这就是自动闭包
serve(customer: customersInLine.remove(at: 0))
// 打印“Now serving Ewa!”

//如果需要让闭包逃逸
// customersInLine i= ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    //先回执行下面的语句，然后再执行闭包的remove方法
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// 打印“Collected 2 closures.”
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// 打印“Now serving Barry!”
// 打印“Now serving Daniella!”
