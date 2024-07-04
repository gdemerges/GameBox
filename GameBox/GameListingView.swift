//
//  GameListingView.swift
//  GameBox
//
//  Created by Guillaume Demergès on 04/07/2024.
//

import SwiftData
import SwiftUI

struct GameListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query (sort: [SortDescriptor(\Game.priority, order: .reverse), SortDescriptor(\Game.name)])var games: [Game]
    
    var body: some View {
        List {
            ForEach(games) { game in
                NavigationLink(value: game){
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.headline)
                    
                    Text(game.date.formatted(date:.long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteGame)
        }
    }
    
    init(sort: SortDescriptor<Game>){
        _games = Query(sort: [sort])
    }
    
    func deleteGame(_ indexSet: IndexSet) {
        for index in indexSet {
            let game = games[index]
            modelContext.delete(game)
        }
    }
}

#Preview {
    GameListingView(sort: SortDescriptor(\Game.name))
}
