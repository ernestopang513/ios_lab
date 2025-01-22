//
//  CustomSectionListView.swift
//  componentesApp
//
//  Created by Ernesto Pang on 22/01/25.
//

import SwiftUI

struct CustomSectionListView: View {
    
    struct House: Identifiable {
        let id = UUID()
        let title: String
        let data: [String]
    }
    
    let houses: [House] = [
            House(title: "DC Comics", data: [
                "Superman", "Batman", "Wonder Woman", "The Flash", "Aquaman",
                "Green Lantern", "Cyborg", "Shazam", "Green Arrow", "Batgirl",
                "Nightwing", "Supergirl", "Martian Manhunter", "Harley Quinn",
                "Joker", "Catwoman", "Lex Luthor", "Poison Ivy", "Robin", "Deathstroke"
            ]),
            House(title: "Marvel Comics", data: [
                "Spider-Man", "Iron Man", "Captain America", "Thor", "Black Widow",
                "Hulk", "Doctor Strange", "Black Panther", "Captain Marvel",
                "Wolverine", "Deadpool", "Scarlet Witch", "Ant-Man", "Wasp",
                "Groot", "Rocket Raccoon", "Gamora", "Drax the Destroyer"
            ]),
            House(title: "Anime", data: [
                "Son Goku", "Naruto Uzumaki", "Monkey D. Luffy", "Sailor Moon",
                "Kenshin Himura", "Edward Elric", "Inuyasha", "Sakura Kinomoto",
                "Light Yagami", "Eren Yeager", "Lelouch Lamperouge", "Vegeta",
                "Ichigo Kurosaki", "Kaneki Ken", "Gon Freecss", "Asuka Langley",
                "Saitama", "Mikasa Ackerman", "Natsu Dragneel", "Usagi Tsukino"
            ])
        ]
    
    var body: some View {
        VStack{
            Text("Lista de personajes")
                .font(.largeTitle)
                .padding()
            List{
                ForEach(houses) { house in
                    Section(
                        header: Text(house.title)
                        .font(.headline)
                        .padding()
                        .background(Color.clear)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)) {
                            ForEach(house.data, id: \.self) { item in
                                Text(item)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.primary)
                            }
                        }
                }
            }
//            }.listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    CustomSectionListView()
}
