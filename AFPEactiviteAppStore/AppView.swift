//
//  AppView.swift
//  AFPEactiviteAppStore
//
//  Created by yoko on 12/03/2021.
//

import SwiftUI

struct AppView: View {
    
    let rows: [GridItem] = Array(repeating: .init(.fixed(70)), count:3)
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
            List {
                //VStack{
                ScrollView(.horizontal) {
                    HStack {
                    ForEach(journals, id: \.self) {item in
                        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                            Text(item.introduction).font(.caption).foregroundColor(Color.blue).textCase(.uppercase)
                            Text(item.title).font(.title2)
                            Text(item.description).font(.title3).foregroundColor(Color.gray)
                            
                            Image( item.imageJounal).resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width*0.9).cornerRadius(10)
                        }
                        
                        }
                    }
                }
                
                ForEach(categoriesApps, id: \.self) { itemCategoryApp in
                    Section(header:
                        VStack{
                        Spacer()
                        HStack {
                            Text("\(itemCategoryApp.title)").font(.title3).fontWeight(.bold).multilineTextAlignment(.leading).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).autocapitalization(.sentences)//.textCase(.lowercase)
                        Spacer()
                        NavigationLink(destination:  AppDetailView()){Text("Tout voir").font(.callout).padding(.trailing, 25).autocapitalization(.sentences)//.textCase(.lowercase)
                        }
                        }
                        Spacer()
                        }
                        .background(Color.white)
                        .listRowInsets(EdgeInsets(top: 0,leading: 0,bottom: 0,trailing: 0))
                                .padding(.trailing)//.background(FillAll(color: .white))
                    ){
                    ScrollView(.horizontal){
                        LazyHGrid(rows: rows, content: {
                            ForEach(0..<itemCategoryApp.apps.count) { num in
                                EachGridCell(item: applications[num])
                                    .frame(width: geometry.size.width*0.9, alignment: .leading)
                            }
                        })
                    }.padding(.bottom)}
                }.textCase(nil)
            }
            .padding(.trailing, -15)
            .navigationTitle("Apps")
            //.navigationBarTitle("Apps", displayMode: .inline)
            .listStyle(PlainListStyle())
            .navigationBarItems(trailing:
                                    ProfileIcon(profileIcon: myProfile.profilePhoto))
            

            /*
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack{
                        Text("Apps").font(.title)
                        SPacer()
                        Image(systemName: "photo")
                    }
                    }
            }
            */
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

struct EachGridCell: View {
    var item: Application
    var body: some View {
        HStack{
            Image(item.appIcon)
                .resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60).scaledToFill().cornerRadius(10)

            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
                Text(item.name).font(.headline)
                Text(item.description).font(.caption).foregroundColor(.gray)
            }
            Spacer()
            VStack{
                Image(systemName: item.howToGet.howToGetIcon).resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                //Text(item.howToGet.howToGetDescription)
            }
            Spacer()
        }
    }
}

struct FillAll: View {
    let color: Color
    
    var body: some View {
        GeometryReader { proxy in
            self.color.frame(width: proxy.size.width * 1.3).fixedSize()
        }
    }
}


struct ProfileIcon: View {
    var profileIcon: String
    var body: some View {
        Image(profileIcon)
            .resizable()
            .scaledToFill()
            //.aspectRatio(contentMode: .fill)
            .frame(width:40,height:40)
            .clipShape(Circle())
            //.padding(.top, 90)
    }
}

struct ProfileInfo: View {
var text: String
@Binding var displayProfile:Int

var body: some View {
    ZStack{
        Rectangle()
        .fill(Color.gray)
        .opacity(0.5)

        VStack {
            Spacer()
            HStack {
                VStack(spacing: 20) {
                    Text(text).fontWeight(.bold).padding(.all, 20)

                    Text("Name")
                    Text("Age")
                    Text("Profession")
                    Text("Interest")
                }
            }
            .frame(minWidth: 300, idealWidth: 300, maxWidth: 300, minHeight: 250, idealHeight: 100, maxHeight: 250, alignment: .top).fixedSize(horizontal: true, vertical: true)
            .background(RoundedRectangle(cornerRadius: 27).fill(Color.white.opacity(1)))
            .overlay(RoundedRectangle(cornerRadius: 27).stroke(Color.black, lineWidth: 1))
            Spacer()
        }
    }.onTapGesture {
        self.displayProfile = -1
    }
  }
}
