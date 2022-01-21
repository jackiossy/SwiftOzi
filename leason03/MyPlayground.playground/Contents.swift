import UIKit

var greeting = "Hello, playground"

//swift数组
//使用有序列表存储同一类型的多个数值
//创建数组
var someArray = [String]()

//创建数数组时 指定初始值和数组元素个数
var someInts = [Int](repeating: 0, count: 3)

var someIntArray =  [10,20,30]
print("数组为：\(someIntArray)")

//通过下标来访问数组
var somevalue = someIntArray[1]
print("下标访问数组的数值为 \(somevalue)")

//修改数组
//向数组添加元素
someIntArray.append(40)
someIntArray += [50]
print("打印整数数组所有元素\(someIntArray)")

//修改第二个元素数据为25
someIntArray[1] = 25
print("打印整数数组所有元素\(someIntArray)")

//遍历数组
for num in someIntArray {
    print(num)
}

//需要索引值的遍历
for (index, num) in someIntArray.enumerated() {
    print("数组中第\(index)数据为\(num)")
}

//数组合并，将2个数组合并起来
var someArrayNum = [60,70,80]
let resultArray = someIntArray + someArrayNum
print("数组合并的结果为\(resultArray)")

//数组的count属性
print("数组的元素个数为\(resultArray.count)")

//推荐使用创建数组方法
var arrayname: [Int] = []

//通过数组的isEmpty属性判断数组是否为空
let boolA =  arrayname.isEmpty
let boolB =  someArrayNum.isEmpty
let boolC =  someIntArray.isEmpty
print(boolA)
print(boolB)
print(boolC)
print(boolC || boolB)

//swift字典 key value
//创建一个字典
var someDict = [String:String]()  //前面是key，后面是value
//创建一个字典 key为Int 数值为String 的一个空字典
var someDict1 =  [Int:String]()

//另外一种创建字典的写法
var someDict2: [Int:String] =  [:]

//创建一个字典实例 字典数组
var someDict3: [Int:String] = [1:"One",2:"Two",3:"Three"]
print(someDict3)

//访问字典数量 count 属性
print("The dictionary of airports contains \(someDict3.count) items.")


//访问字典
var valuestring = someDict3[2]
print("value = \(valuestring ?? "")")

for i in valuestring ?? "" {
    print(i)
}

//修改字典
//通过updatevalue方法修改
someDict3.updateValue("New Two", forKey: 2)
print(someDict3)
//通过字面量修改字典value
someDict3[2] =  "new Two"
print(someDict3)

//移除键值对儿 remove方法
someDict3.removeValue(forKey: 2)
print(someDict3)

//移除键值对，通过字面量方法
someDict3[3] = nil
print(someDict3)

//遍历字典
var someDict4:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
for (key, value) in someDict4 {
    print("字典的key为\(key), 数值为\(value)")
}

//enumerated访问下标
for (key, value) in someDict4.enumerated() {
    print("字典 key \(key) -  字典 (key, value) 对 \(value)")
}


