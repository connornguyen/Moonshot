//
//  ContentView.swift
//  Moonshot
//
//  Created by Apple on 02/08/2024.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    
    //Get data from JSON using decoder
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    //Set up Grid
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(mission) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronaut)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack{
                                    Text(mission.disPlayedName)
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackGround)
                            }
                            .clipShape(.rect(cornerRadius: 30))
                            .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.lightBackGround)
                            )
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.white, lineWidth: 0.2)
                            )
                    }
                }
                .padding([.vertical, .horizontal])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
