//
//  AppDetailView.swift
//  AFPEactiviteAppStore
//
//  Created by vincent schmitt on 14/03/2021.
//

import SwiftUI

struct AppDetailView: View {
    var categoryApplications: CategoryApplications = selectionSemaine
    var body: some View {
        //NavigationView {
        List(selectionSemaine.apps, id: \.self) {app in
            EachRow(item: app)
        }
        .navigationBarTitle(selectionSemaine.title, displayMode: .inline)
        //}
    }
}

struct AppDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppDetailView()
    }
}

struct EachRow: View {
    var item: Application
    var body: some View {
        HStack{
            Image(item.appIcon)
                .resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80).scaledToFill().cornerRadius(10)

            VStack(alignment: .leading, spacing: nil){
                Text(item.name).font(.headline)
                Text(item.description).font(.caption).foregroundColor(.gray)
                Spacer()
                Image(systemName: item.howToGet.howToGetIcon).resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                //Text(item.howToGet.howToGetDescription)
            }
            
            Spacer()
            VStack{
                
            }
            Spacer()
        }
    }
}
