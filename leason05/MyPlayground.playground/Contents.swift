import UIKit

var greeting = "Hello, playground"

//隐式返回函数
func sayHelloEveryone(for person: String) -> String {
    "Hello world ! " + person + "Hello everyone."
}

print(sayHelloEveryone(for: "jackiossy"))

//函数标签和参数名称

//函数参数名称
func somefunc( firstPara: String, secondPara: String) -> (Void) {
    print(firstPara + secondPara)
}
 somefunc(firstPara: "hello", secondPara: "world")

//指定参数标签
func somefuncWithTag (tagname firstPara: String) {
    print(firstPara)
}

//调用时候 显示tag名称
somefuncWithTag(tagname: "hello everybody.")

// 使用- 可忽略函数标签
func somefuncwithnothingtag(_ firstPara : String) {
    print(firstPara)
}

//如果参数tag设置位“-”的时候 调用函数不显示任何参数的说明
somefuncwithnothingtag("没有tag")

//设置函数参数默认值， 当调用函数的时候可以不传入参数， 不传入参数的时候按照默认值执行
func somefuncdefautPara(firstPara: Int = 12) {
    print(firstPara)
}

somefuncdefautPara(firstPara: 14)

//可变参数 可以传入 不确定数量的多个数值， 可以是1个 可以是多个
//写法 在变量类型名称后面加 ...
//接收参数的类型为一个数组

//写一个传入数字之和相加的函数
func countallInt(_ intArray: Int...) -> (Int) {
    var temp = 0
    for i in intArray {
        temp += i
    }
    return temp
}


let result = countallInt(1,2,3,4)
print(result)





