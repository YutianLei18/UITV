//
//  ActorView.swift
//  UITV
//
//  Created by Colin on 11/11/22.
//

import SwiftUI

struct ActorView: View {
    @StateObject var gateway: Gateway
    @State var actorbio : ActorBio = ActorBio()
    var body: some View {
        VStack{
            Text(actorbio.name).padding()
            AsyncImage(url: URL(string: self.actorbio.image)){ image in
                image.resizable()
            }placeholder: {
                ProgressView()
            }.frame(width: 200, height: 200).padding()
            Text(actorbio.summary).padding()
            List{
                ForEach( self.actorbio.knownFor, id: \.self) { p in
                    HStack{
                        Text(p.title)
                        
                    }
                }
            }
        }.task {
            await getDetailsActor()
        }
    }
    
    func getDetailsActor() async {
        let key = "k_whajo3te"
        let urlStr = "https://imdb-api.com/en/API/Name/\(key)/\(self.gateway.selectedactor.id)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(ActorBio.self, from: data)
            DispatchQueue.main.async { self.actorbio = pl }
        } catch {
        }
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorView(gateway: Gateway())
    }
}
