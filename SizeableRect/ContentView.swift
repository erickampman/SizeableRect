//
//  ContentView.swift
//  SizeableRect
//
//  Created by Eric Kampman on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { gp in 
            SizeableRectView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
