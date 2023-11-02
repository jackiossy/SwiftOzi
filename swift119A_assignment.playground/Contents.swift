// 【ChaoCode】 Swift 基礎篇 19A：Closure 實作作業
//
// ⚠️ 請在不使用 Loop 語法的情況完成這次的每一項作業。
//
// 1. 請把箱子由大到小堆疊，從最下面開始，先放最寬的箱子，如果遇到寬度一樣箱子則先放較厚的箱子。
// ＊Box 是一個有寬度（width）和高（height）的 Tuple。
// 👇 請把這疊箱子改成從大到小排序。（也就是要放在下面的應在 Array 前面。）
let boxes: [Box] = [(2, 1), (1, 1), (4, 1), (6, 1), (4, 3)]

let result = boxes.sorted { a, b in

    if a.width == b.width {
        return a.height > b.height
    } else {
        return a.width > b.width
    }
    
    
}

print(result)


print("排序後的箱子順序是 \(result)")


// 你可以使用下面這個 function 印看看箱子疊起來的樣子。
drawBoxes(result)


// 👇 上面的 box 排序成功後，請呼叫「箱子疊疊樂」function，這個 function 會用你提供的排序方式重新排列 13 組箱子，請用和第一題同樣的規則來重新排列這些箱子。
// 如果不確定為什麼不對的話，也可以自己使用上面的 drawBoxes() 來看看有什麼不一樣。
//箱子疊疊樂

// 2. 請設計一個把一組撲克牌組按照「大老二」大小規則，由大到小重新排序，並回傳排序後的牌組的 Function。
// 大小規則：先比數字大小，假如同大小的話再比花色。
// ＊號碼大小：2 > A > K > Q > J > 10 > 9 > 8 > 7 > 6 > 5 > 4 > 3
// ＊花色大小：黑桃 > 紅心 > 方塊 > 梅花
// 💡 你可以設計一個幫助你對照大小的 Dictionary。
// 你的 function 應接收一個「撲克牌的 Array」並回傳一個「撲克牌的 Array」
// ＊撲克牌是 (花色: String, 號碼: String) 的別稱。

// 👇 請呼叫「大老二排序測試」這個 function 測試你的 function。你會需要把你設計的 function 當作引數丟進去。
//大老二排序測試

