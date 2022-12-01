//
//  ContentView.swift
//  UITV
//
//  Created by Colin on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gateway: Gateway
    @State var s : String = " "
    @State var selected : SearchResult!
    @State var gotmain = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(gateway:gateway,selected:Actor()), isActive: $gotmain) { EmptyView() } 
                HStack{
                    TextField("", text: $s).textFieldStyle(.roundedBorder).disableAutocorrection(true).frame(width: 350, height: 20, alignment: .trailing).padding().padding().padding()
                }
                HStack{
                    Spacer()
                    Button("Search Series"){
                        Task{
                            await self.gateway.doSeriesSearch(search: s)
                        }
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                    Spacer()
                    Button("Search Movies"){
                        Task{
                            await self.gateway.doMovieSearch(search: s)
                        }
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                }
                List{
                    ForEach(self.gateway.searchresults.results, id: \.self){ p in
                        HStack{
                            Text(p.title)
                        }.onTapGesture {
                            selected = p
                            self.gateway.selectedsearch = selected
                            gotmain = true
                            Task{
                                await gateway.getDetails()
                            }
                            
                        }.listRowBackground(selected == p ? Color.accentColor : Color(UIColor.systemGroupedBackground))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gateway: Gateway())
    }
}
//I discussed this part with Nafis and got it worked out together.
