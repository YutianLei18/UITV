//
//  SeriesView.swift
//  UITV
//
//  Created by Colin on 11/11/22.
//

import SwiftUI
struct SecondView: View {
    @StateObject var gateway: Gateway
    @State var selected : Actor
    @State var gotomain = false
    
    var body: some View {
            VStack{
                NavigationLink(destination: ActorView(gateway:gateway), isActive: $gotomain) { EmptyView() }
                Text(gateway.seriesData.title).padding()
                Text(gateway.seriesData.plot).padding()
                
                List {
                    ForEach( self.gateway.seriesData.actorList, id: \.self) { p in
                        HStack{
                            Text(p.name)
                            
                        }.onTapGesture{
                            selected = p
                            self.gateway.selectedactor = selected
                            
                            gotomain = true
                        }.listRowBackground(selected == p ? Color.accentColor : Color(UIColor.systemGroupedBackground))
                    }
                }
            }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(gateway: Gateway(), selected : Actor())
    }
}

