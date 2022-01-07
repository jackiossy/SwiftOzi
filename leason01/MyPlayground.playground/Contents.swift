import SwiftUI

var greeting = "Hello, playground"
print(greeting)
var myString = "Hello, World! what"

print(myString)

// this 注释
/**
 这是多行注释，
 可以进行多行注释的标注
 */

//在同一行写2行代码 需要添加 ；
let a = "dog"; print(a)
//关键字标识符 需要加`
let `class` =  "class string"
print(`class`)

//运算符不能直接跟在变量或常量的后面
/** 错误的例子 🙅
 let a= 1 + 2
 let a = 1+ 2

 */

//print在打印数据的时候会自动换行，如果要在一行内打印内容 例子如下所示，
//只需在print参数 terminator 赋予空字符串即可
for x in 0...10{
    print("\(x) ", terminator: "")
}


//接收用户输入
/*
 print("请输入需要打印的字符串")
 let theInput = readLine()
 let input_string = String(theInput!)
 print("输入内容为：\(input_string)")
 
 报错，没弄明白怎么用
 */

//数据类型

/**
 下表显示了不同变量类型内存的存储空间，及变量类型的最大最小值：
 类型    大小（字节）    区间值
 Int8    1 字节    -128 到 127
 UInt8    1 字节    0 到 255
 Int32    4 字节    -2147483648 到 2147483647
 UInt32    4 字节    0 到 4294967295
 Int64    8 字节    -9223372036854775808 到 9223372036854775807
 UInt64    8 字节    0 到 18446744073709551615
 Float    4 字节    1.2E-38 到 3.4E+38 (~6 digits)
 Double    8 字节    2.3E-308 到 1.7E+308 (~15 digits)
 */

//类型别名 相当于给类型取了一个外号
// typealias newname = type
typealias str = String
var hello: str = ""
hello = "hello world~"
print(hello)

// optionals 可选类型

var h: String? = nil
h = "h"
if h != nil {
    print("\(h!)") // ！强制解析
}else {
    print("数值为nil")
}

// 可选绑定
/**
 可选绑定（optional binding）用来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。
 可选绑定一般配合if语句来对可选类型的值进行判断。返回类型为bool类型
 */
var my11String:String?

my11String = "Hello, Swift!"

if let your1String = my11String {
   print("你的字符串值为 - \(your1String)")
}else{
   print("你的字符串没有值")
}

//let 常量和常量的字面量
let aNumber = 0x11         //整型字面量
let aString = "Hello"   //字符串字面量
let aBool = true        //布尔值字面量
print("常量\\数字为：\(aNumber), 常量字符串为：\(aString),常量布尔值为：\(aBool)")

//常用进制字面量
let binaryInteger = 0b10001       // 17 - 二进制表示
let octalInteger = 0o21           // 17 - 八进制表示
let hexadecimalInteger = 0x11     // 17 - 十六进制表示
//浮点型字面量
let decimalDouble = 12.1875       //十进制浮点型字面量
let exponentDouble = 1.21875e1    //十进制浮点型字面量
let hexadecimalDouble = 0xC.3p0   //十六进制浮点型字面量

//字符串字面量转义字符 输入引号的时候方便转义 避免冲突
/*
 字符串型字面量中不能包含未转义的双引号 （"）、未转义的反斜线（\）、回车符或换行符。
 转义字符    含义
 \0      空字符
 \\      反斜线 \
 \b      退格(BS) ，将当前位置移到前一列
 \f      换页(FF)，将当前位置移到下页开头
 \n      换行符
 \r      回车符
 \t      水平制表符
 \v      垂直制表符
 \'      单引号
 \"      双引号
 \000    1到3位八进制数所代表的任意字符
 \xhh... 1到2位十六进制所代表的任意字符
 */

let stringL = "Hello\tWorld\n\n菜鸟教程官网：\'http://www.runoob.com\'"
print(stringL)

//bool字面量 真假
let if_login = true
let if_try =  false

//算数运算符

/**
 算术运算符
 以下表格列出了 Swift 语言支持的算术运算符，其中变量 A 为 10，变量 B 为 20：
 运算符    描述    实例
 +    加号    A + B 结果为 30
 −    减号    A − B 结果为 -10
 *    乘号    A * B 结果为 200
 /    除号    B / A 结果为 2
 %    求余    B % A 结果为 0
 */

// swift3中取消了 -- ++

let num_a = 100
let num_b = 50
var result_num = num_a + num_b
print("运算结果为\(result_num)")









