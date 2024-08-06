//
//  MissionView.swift
//  Moonshot
//
//  Created by Apple on 06/08/2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
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
                    Text("Mission Highlights")
                        .font(.title.bold())
                        
                    
                    Text(mission.description)
                        .font(.caption.bold())
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .padding(.all)
        }
        .navigationTitle(mission.disPlayedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackGround)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionView(mission: missions[0])
}
