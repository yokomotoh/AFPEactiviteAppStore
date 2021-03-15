//
//  ContentView.swift
//  AFPEactiviteAppStore
//
//  Created by yoko on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Hello1")
                .tabItem{
                    Label(
                        title: { Text("Aujourd'hui") },
                        icon: { Image(systemName: "1.circle") }
)
                }
            Text("Hello2")
                .tabItem{
                    Label(
                        title: { Text("Jeux") },
                        icon: { Image(systemName: "2.circle") }
)
                }
            AppView()
                .tabItem{
                    Label(
                        title: { Text("Apps") },
                        icon: { Image(systemName: "3.circle") }
)
                }
            Text("Hello4")
                .tabItem{
                    Label(
                        title: { Text("Arcade") },
                        icon: { Image(systemName: "4.circle") }
)
                }
            Text("Hello5")
                .tabItem{
                    Label(
                        title: { Text("Rechercher") },
                        icon: { Image(systemName: "5.circle") }
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
