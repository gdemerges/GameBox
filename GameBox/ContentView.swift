//
//  ContentView.swift
//  GameBox
//
//  Created by Guillaume Demergès on 04/07/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Game]()
    @State private var sortOrder = SortDescriptor(\Game.name)
    
    var body: some View {
        NavigationStack(path: $path){
            GameListingView(sort: sortOrder)
                .navigationTitle("GameBox")
                .navigationDestination(for: Game.self, destination: EditGameView.init)
                .toolbar {
                    Button("Add Game", systemImage: "plus", action: addGame)
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down"){
                        Picker("Sort", selection: $sortOrder){
                            Text("Name")
                                .tag(SortDescriptor(\Game.name, order: .reverse))
                            
                            Text("Priority")
                                .tag(SortDescriptor(\Game.priority, order: .reverse))
                            
                            Text("Date")
                                .tag(SortDescriptor(\Game.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addGame(){
        let game = Game()
        modelContext.insert(game)
        path = [game]
    }
}

#Preview {
    ContentView()
}
