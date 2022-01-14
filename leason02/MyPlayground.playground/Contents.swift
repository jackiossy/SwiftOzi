import UIKit

var greeting = "Hello, playground"

// 字符串

// 使用字符串字面量
var stringA = "Hello, World!"
print( stringA )

// String 实例化
var stringB = String("Hello, World!")
print( stringB )

//判断字符串是否为空
if stringA.isEmpty {
    print("字符串为空")
}else {
    print("字符串不为空")
}
//字符串插值
var varA   = 20
let constA = 100
var varC:Float = 20.0

var result = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
print( result )

/**
 字符串连接
 字符串可以通过 + 号来连接，实例如下：
 */

let constA1 = "你"
let constB1 = "喜欢我吗"
let resultstring = constA1 + constB1
print( resultstring )

//计算字符串的长度
let string_count = resultstring.count
print(string_count)

//字符串比较
if constA1 == constB1 {
    print("字符串相当")
}else {
    print("字符串不相等")
}

// unicode字符串
var unicodeString   = "菜鸟教程"

print("UTF-8 编码: ")
for code in unicodeString.utf8 {
   print("\(code) ")
}

print("\n")

print("UTF-16 编码: ")
for code in unicodeString.utf16 {
   print("\(code) ")
}

//判断字符串是否包含前缀和后缀
//判断前缀是否包含
if resultstring.hasPrefix("你喜欢") {
    print("包含")
}else {
    print("不包含")
}
//判断后缀是否包含
if resultstring.hasSuffix("吗") {
    print("包含")
}else {
    print("不包含")
}

//将字符串数字转换成为整形
let intstring = "100"
let int100:Int? =  Int(intstring)
print("int100的值为\(int100 ?? 0)")

//字符串分割数组
let fullname = "First Last"
print("value is \(fullname[fullname.startIndex])")





