//
//  ScrollView.swift
//  ScrollToTop-FloatingButton
//
//  Created by Ramzy on 07/05/2021.
//

import SwiftUI

struct CustomScrollView: View {
    
    @State var scrollViewOffset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    
    var body: some View {
        ScrollViewReader{ proxyReader in
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing:25) {
                    ForEach(1...40, id: \.self) {index in
                        HStack(spacing: 15){
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 50, height: 50)
                            
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.blue.opacity(0.2))
                                    .frame(height:30)
                        }
                    }
                } //: HStack
                .id("Scroll_To_Top")
                
                .overlay(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                self.startOffset = proxy.frame(in: .global).minY
                            }
                            let offset = proxy.frame(in: .global).minY
                            self.scrollViewOffset = offset - startOffset
                        }
                        return Color.clear
                    }
                    .frame(width: 0, height: 0)
                    ,alignment: .top
                )//: Overlay GemotryReader
            })//: ScrollView
            .overlay(
                Button(action: {
                    withAnimation(.spring()) {
                        proxyReader.scrollTo("Scroll_To_Top", anchor: .top)
                    }
                }, label: {
                    Image(systemName: "arrow.up")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
                })
                .padding(.trailing)
                .padding(.bottom,getSafeArea().bottom == 0 ? 12 : 0)
                .opacity(-scrollViewOffset > 350 ? 1 : 0)
                .animation(.easeInOut)
                , alignment: .bottomTrailing
            )//: Overlay Button
        } //: ScrollViewReader
    }
}
