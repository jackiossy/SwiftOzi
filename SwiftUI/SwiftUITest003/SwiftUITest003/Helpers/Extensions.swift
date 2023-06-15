//
//  Extensions.swift
//  SwiftUITest003
//
//  Created by jackiossy on 2023/6/15.
//

import SwiftUI

// MARK: Custom Modifier
extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat)->())->some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self) { value  in
                            completion(value)
                        }
                }
            }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
