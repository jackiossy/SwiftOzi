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
let fullName = "First Larst"
print("value is \(fullName[fullName.startIndex])")

//components 以特定字符分割字符串 返回一个数组
let fullNameArr = fullName.components(separatedBy: "r")

print(fullNameArr[0])
print(fullNameArr[1])

//字符串的遍历 for in的字符串后面 加上 reaversed 方法，变为逆序遍历
var i = 0
for char in fullName.reversed() {
    print("\(i):\(char)")
    i += 1
}

let str = "HHKB YYDS !"

print("---- 基于索引的正序遍历 ----")
for i in 0..<str.count {
    let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
    print("\(i): \(ch)")
}

print("---- 基于索引的逆序遍历 ----")
//for i in stride(from: str.count - 1, to: -1, by: -1) {
for i in stride(from: str.count - 1, through: 0, by: -1) {
    let ch: Character = str[str.index(str.startIndex, offsetBy: i)]
    print("\(i): \(ch)")
}

print("---- 基于EnumeratedSequence的遍历 ----")
for (i, ch) in str.enumerated() {
    print("\(i): \(ch)")
}

//Character 字符类型
// 只能存储一个字符，如果存储更多的字符会报错
let char1: Character = "A"
let char2: Character = "B"

print("char1 的值为 \(char1)")
print("char2 的值为 \(char2)")

// Error， 下面的写法会报错， 字符不可以为空 中间有空格也不行 🙅‍♂️
//let char1: Character = " "

//字符串遍历
for ch in "Runoob" {
    print(ch)
}

//字符串拼接，除了+ 还有 append方法
var strA = "swift"
var strB = " YYDS"

strA.append(strB)
print (strA)

var charC = "!"
strA.append(contentsOf: charC)
print(strA)

strA.append(contentsOf: "HHKB YYDS")
print(strA)

//数组 相同类型的多个值

