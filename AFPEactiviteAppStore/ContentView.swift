//
//  ContentView.swift
//  AFPEactiviteAppStore
//
//  Created by vincent schmitt on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AppView()
                .tabItem{
                    Label(
                        title: { Text("Label1") },
                        icon: { Image(systemName: "1.circle") }
)
                }
            Text("Hello")
                .tabItem{
                    Label(
                        title: { Text("Label2") },
                        icon: { Image(systemName: "2.circle") }
)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
