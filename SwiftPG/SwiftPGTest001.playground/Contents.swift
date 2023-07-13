
import Foundation

struct 行李 {
    var 重量: Int {
        didSet {
            重量 = min(10, 重量)
        }
    }
    
    init(重量: Int) {
        self.重量 = min(10,重量)
    }
}

var packages = 行李(重量: 5)
print(packages)
packages.重量 = 13
print(packages)
packages.重量 = 7
print(packages)

extension Collection {
    var isNotEmpty: Bool {
        !isEmpty
    }
}

[1,2,3,4].isEmpty
"".isEmpty

extension Int {
    var printstring:String {
        return "my value is \(self)"
    }
}

1313.printstring

let myvalue = 1314521
print(myvalue.printstring)

