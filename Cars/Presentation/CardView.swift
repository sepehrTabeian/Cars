//
//  CardView.swift
//  Cars
//
//  Created by Sepehr on 6/16/23.
//

import SwiftUI
struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .background(RoundedRectangle(cornerRadius: Constants.radius10).foregroundColor(Color.theme.backgroundColor))
        .padding(.horizontal,Constants.padding12)
        .padding(.vertical,Constants.padding4)
    }
}
