//
//  Tab.swift
//  SwiftUITest003
//
//  Created by jackiossy on 2023/6/15.
//

import SwiftUI

struct Tab: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var tabName: String
    var sampleImage: String
}

var sampleTabs: [Tab] = [
    .init(tabName: "Iceland", sampleImage: "Image1"),
    .init(tabName: "France", sampleImage: "Image2"),
    .init(tabName: "Brazil", sampleImage: "Image3")
]
