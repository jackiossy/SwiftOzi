//
//  NewsDetailModel.swift
//  SwiftUITest006
//
//  Created by Jackiossy on 7/3/23.
//

import SwiftUI

/**
 {
     "code": 1,
     "msg": "success",
     "data": {
         "news": [
             {
                 "article_id": 920278,
                 "article_content": "<p>比亚迪旗下首款纯电猎跑SUV车型N7将于今晚19:300正式上市，我们将在线进行直播，欢迎大家锁定观看。</p><p>作为腾势品牌新生以来的第二款车型，N7定位于豪华纯电猎跑SUV，<strong>将提供两种不同的前脸</strong>，主要区别就是LED灯组，一种为“流星利箭”式，里面的光源造型比较复杂，另一种则是一体式，更为简洁明了，此外，官方在两侧雾灯区域加入激光雷达，并用黑水晶材质进行设计融合，让视觉效果更加协调。</p><p align=\"center\"><img onclick=\"javascript:window.news.setImages(setimageswwghttps://img1.mydrivers.com/img/20230703/ee754232-b388-4921-a959-866361ca79df.jpgsetimageswwg)\" w=\"600\" h=\"347\" originimg=\"https://img1.mydrivers.com/img/20230703/ee754232-b388-4921-a959-866361ca79df.jpg\" src=\"https://img1.mydrivers.com/img/20230703/ee754232-b388-4921-a959-866361ca79df.jpg\" /></p><p align=\"center\"><img onclick=\"javascript:window.news.setImages(setimageswwghttps://img1.mydrivers.com/img/20230703/8e714622-c4ce-479f-a5da-768cede86f77.pngsetimageswwg)\" w=\"600\" h=\"412\" originimg=\"https://img1.mydrivers.com/img/20230703/8e714622-c4ce-479f-a5da-768cede86f77.png\" src=\"https://img1.mydrivers.com/img/20230703/8e714622-c4ce-479f-a5da-768cede86f77.png\" /></p><p>尺寸方面，新车<strong>长宽高分别为4860/1935/1602mm，轴距为2940mm</strong>，作为猎跑SUV，腾势N7配备空气悬架，既保证了车辆通过性，又满足了低趴造型设计。</p><p align=\"center\"><img onclick=\"javascript:window.news.setImages(setimageswwghttps://img1.mydrivers.com/img/20230703/d7d37378-a36a-40df-9c6b-d56cd73b1ee6.jpgsetimageswwg)\" w=\"600\" h=\"347\" originimg=\"https://img1.mydrivers.com/img/20230703/d7d37378-a36a-40df-9c6b-d56cd73b1ee6.jpg\" src=\"https://img1.mydrivers.com/img/20230703/d7d37378-a36a-40df-9c6b-d56cd73b1ee6.jpg\" /></p><p>不同于比亚迪其他车型，N7内饰确实给出了很多新意，其整体采用了对称式布局，采用“无限探索”的设计语言，中控台上配有10.25英寸全液晶仪表、17.3英寸中控屏和10.25英寸副驾驶娱乐屏，同时还拥有AR-HUD抬头显示，双侧智能风口显示屏，统共多达6块屏幕，科技感十足。</p><p>此外，该车还将全球首搭帝瓦雷品牌音响，并搭载比亚迪自研的云辇-A底盘悬架系统，<strong>采用CTB电池底盘一体化技术</strong>，可有效提升车辆扭转刚度，还配备了腾势Pilot高级智能驾驶辅助系统，可利用双激光雷达，实现高阶辅助驾驶能力。</p><p>至于续航和动力，腾势N7单电机版驱动电机峰值功率230kW；双电机版驱动电机峰值功率为390kW，预计零百加速4秒内。</p><p align=\"center\"><img onclick=\"javascript:window.news.setImages(setimageswwghttps://img1.mydrivers.com/img/20230703/618b717d-40d9-40a9-a9ca-cbc30f679206.pngsetimageswwg)\" w=\"600\" h=\"277\" originimg=\"https://img1.mydrivers.com/img/20230703/618b717d-40d9-40a9-a9ca-cbc30f679206.png\" src=\"https://img1.mydrivers.com/img/20230703/618b717d-40d9-40a9-a9ca-cbc30f679206.png\" /></p><p align=\"center\"><img onclick=\"javascript:window.news.setImages(setimageswwghttps://img1.mydrivers.com/img/20230703/49a50518-45cd-413b-8c5f-dd688043334d.pngsetimageswwg)\" w=\"600\" h=\"338\" originimg=\"https://img1.mydrivers.com/img/20230703/49a50518-45cd-413b-8c5f-dd688043334d.png\" src=\"https://img1.mydrivers.com/img/20230703/49a50518-45cd-413b-8c5f-dd688043334d.png\" /></p><p>配备容量为91.392kWh动力电池，并提供两种续航版本可选，CLTC工况下，<strong>纯电续航里程702km和630km，分别对应后驱和四驱</strong>，且均支持双枪快充，最大充电功率可达230KW，充电仅15分钟，续航里程增加240多km。</p>",
                 "source": "",
                 "sourceurl": "",
                 "postdate": "2023/7/3 14:09:49"
             }
         ]
     }
 }
 */

struct NewsDetailModel: Decodable, Hashable {
    var code: Int
    var msg: String
    var data: News
}

struct News: Decodable, Hashable {
    var news: [NewsContent]
}

struct NewsContent: Decodable, Hashable {
    var article_content: String
}


