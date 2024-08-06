//
//  MissionView.swift
//  Moonshot
//
//  Created by Apple on 06/08/2024.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name).")
            }
        }
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in width * 0.6
                    }
                    .padding(.top)
                VStack(alignment: .leading)  {
                    
                    //Seperate layout
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackGround)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        
                    Text(mission.description)
                        .font(.caption.bold())
                    
                    //This seperate layout
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackGround)
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink {
                            //Call AstronautView
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack{
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(.capsule)
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                            }
                            VStack {
                                Text(crewMember.astronaut.name)
                                    .font(.subheadline.bold())
                                    .foregroundColor(.white)
                
                                Text(crewMember.role)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(mission.disPlayedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackGround)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
