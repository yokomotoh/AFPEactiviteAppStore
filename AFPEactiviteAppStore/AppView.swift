//
//  AppView.swift
//  AFPEactiviteAppStore
//
//  Created by yoko on 12/03/2021.
//

import SwiftUI

struct AppView: View {
    
    let rows: [GridItem] = Array(repeating: .init(.fixed(50)), count:3)
    //[GridItem(.fixed(50)), GridItem(.fixed(50)),GridItem(.fixed(50))]
    //let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        NavigationView{
            List {
                //VStack{
                ScrollView(.horizontal) {
                HStack{
                    ForEach(journals, id: \.self) {item in
                        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                            Text(item.introduction).font(.caption).foregroundColor(Color.blue)
                            Text(item.title).font(.headline)
                            Text(item.description).foregroundColor(Color.gray)
                            Image(systemName: item.imageJounal)
                        }
                    }
                }
                }
                Section(header: Text("La sélection de la semanie")) {
                ScrollView(.horizontal){
                    LazyHGrid(rows: rows, content: {
                        ForEach(0..<applications.count) { num in
                                EachGridCell(item: applications[num])
                            }
                        })
                }
                }
            
            /*
            ScrollView(.horizontal) {
                HStack{
                    let listNum = applications.count
                    ForEach(0..<listNum/3+1) {item3 in
                        let countRest = listNum - (item3*3)
                        VStack(alignment: .leading)  {
                            //Text("\(item3)")
                            ForEach(0..<min(3,countRest)) {item in
                                EachGridCell(item: applications[item3*3+item])
                                /*
                                VStack{
                                Text("\(applications[item3*3+item].name)")
                                Text("\(applications[item3*3+item].description)")
                                Image(systemName: application[item3*3+item].appIcon)
    */
                                }
                            }
                        }
                    }
                }
                 */
            
            
                /*
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows) {
                        ForEach(applications, id: \.self) { item in
                            //Text(item)
                            EachGridCell(item: item)
                        }
                    }
                    .frame(height: 50)
                }
                */
     

     
            //}
            .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .navigationTitle("Apps")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}


let testList = ["asdfho","bsdSDSDC","cSDCFSD","dSDV","eDVFERA","fdf","dfgbdrbg","hbdgb","ifbd","jdgb","kedb"]

struct EachGridCell: View {
    var item: Application
    var body: some View {
        HStack{
            Image(systemName: item.appIcon)
            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                Text(item.name).font(.headline)
                Text(item.description).font(.caption).foregroundColor(.gray)
            }
            VStack{
                Image(systemName: item.howToGet.howToGetIcon)
                //Text(item.howToGet.howToGetDescription)
            }
        }//.padding()
    }
}
