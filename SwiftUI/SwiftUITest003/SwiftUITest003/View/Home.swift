//
//  Home.swift
//  SwiftUITest003
//
//  Created by jackiossy on 2023/6/15.
//

import SwiftUI

struct Home: View {
    // MARK: View Properties
    @State var offset: CGFloat = 0
    @State var currentTab: Tab = sampleTabs.first!
    var body: some View {
        GeometryReader { proxy in
            let screenSize = proxy.size
            ZStack(alignment:.top) {
                // MARK: Page Tab View
                TabView (selection: $currentTab){
                    ForEach(sampleTabs) { tab in
                        GeometryReader {proxy in
                            let size = proxy.size
                            
                            Image(tab.sampleImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .clipped()
                        }
                        .ignoresSafeArea()
                        .offsetX { value in
                            // MARK: Calculating Offset With The Help Of Currently Active Tab
                            if currentTab == tab {
                                // To Keep Track of Total Offset
                                // Here is a Trick Simply Multiply Offset With (width of the tab view * current index)
                                
                                offset = value - (screenSize.width * CGFloat(indexOf(tab: tab)))
                            }
                            
                        }
                    }
                }
                .ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .never))
                // MARK: Building Custom Header With Dynamic Tabs
                DynamicTabHeader(size: screenSize )
            }
            .frame(width: screenSize.width, height: screenSize.height)

        }
    }
    
    @ViewBuilder
    func DynamicTabHeader(size: CGSize)->some View {
        VStack(alignment: .leading, spacing: 22) {
            Text("Dynamic Tabs")
                .font(.title.bold())
                .foregroundColor(.white)
            
            // MARK: I'm Going to show two Types of Dynamic Tabs
            // Type 1:
            HStack(spacing: 0) {
                ForEach(sampleTabs) { tab in
                    Text(tab.tabName)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                
                }
            }
            .background(alignment: .bottom) {
                Capsule()
                    .fill(.white)
                    .frame(width: (size.width - 30) / CGFloat(sampleTabs.count), height: 4)
                    .offset(y: 12)
                    .offset(x: tabOffset(size: size, padding: 30))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .background(alignment: .bottomLeading) {
            Rectangle()
                .fill(.ultraThinMaterial)
                // MARK:    Dark Mode Only For BG
                .environment(\.colorScheme, .dark)
                .ignoresSafeArea()
                
        }
    }
    
    // MARK: tab offset
    func tabOffset(size: CGSize, padding: CGFloat) -> CGFloat {
        return (-offset / size.width) * (size.width - padding)
    }
    
    // MARK: Tab Index
    func indexOf(tab: Tab)->Int {
        let index = sampleTabs.firstIndex { CTab in
            CTab ==  tab
        } ?? 0
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
