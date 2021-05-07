//
//  ContentView.swift
//  ScrollToTop-FloatingButton
//
//  Created by Ramzy on 07/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            CustomScrollView()
                .navigationTitle("Navigation Title")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
