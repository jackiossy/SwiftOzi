import UIKit

var greeting = "Hello, playground"

func min(a: Int, b: Int) -> Int {
    return a < b ? a : b
}

let result = min(10, 20)
print(result)

let ifyouloveme = false

print(ifyouloveme)

enum 付款方式 {
    case 现金
    case 刷卡(卡号: String)
    case 电子钱包
    case 礼券
}

func 付款(_ 方式: 付款方式) {
    switch 方式 {
    case .现金:
        print("使用现金付款")
    case .刷卡(let 卡号):
        print("使用刷卡付款\(卡号)")
    case .电子钱包:
        print("使用电子钱包付款")
    case .礼券:
        print("使用礼券付款")
    }
}

付款(.刷卡(卡号: "xxxx"))


// associated value

//Hashable

//Raw Representable


