import UIKit

var greeting = "Hello, playground"

import Foundation

class People {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name)被释放了")
    }
    
    func 补充能量() {
        print("\(name) 正在烹饪食材🍳")
        print("\(name) :吃饱了😋")
    }
}

class 生化人: People {
    
    var 改造能力: ()-> Void
    
    init(_ name: String, 改造能力: @escaping () -> Void) {
        self.改造能力 = 改造能力
        super.init(name)
    }
}


//var someonen: 生化人? = 生化人("name")
//someonen?.补充能量()
//someonen = nil

var someone: 生化人? = 生化人("name") { print("xx攻击")}
someone?.补充能量()
someone?.改造能力()
someone = nil

class 狼 {}

/**
 class 启动
 什么是启动?
 - 透过init,把每一个属性都赋值的过程
 
struct提供自动启动, class没有自动启动

class 1.启动自己 2.启动super (启动顺序)
 
 
 
 */


let headers = [
  "accept": "application/json",
  "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDAxMjU5ZTA5YzhhNjJkYmMwOWMyM2MwMzVmZTFkNiIsInN1YiI6IjY0YTc2YzNjNjVjMjZjMDBlYjJhNTVkOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3BrKHC4E2mXqvnSYMlj-KjJV6NcDbA5TlfdQmzV3vOU"
]

let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/account/20115409")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "GET"
request.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    print(error as Any)
  } else {
    let httpResponse = response as? HTTPURLResponse
      print(httpResponse ?? "")
  }
})

dataTask.resume()
