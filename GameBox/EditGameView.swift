//
//  EditGameView.swift
//  GameBox
//
//  Created by Guillaume Demergès on 04/07/2024.
//

import SwiftUI
import SwiftData

struct EditGameView: View {
    @Bindable var game: Game
    
    var body: some View {
        Form {
            TextField("Name", text: $game.name)
            TextField("Details", text: $game.details, axis: .vertical)
            DatePicker("Date", selection: $game.date)
            
            Section("Priority"){
                Picker("Priority", selection: $game.priority){
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Edit Game")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Game.self, configurations: config)
        let example = Game(name: "Example Game", details: "Exemple details game")
        return EditGameView(game: example)
            .modelContainer(container)
    }catch {
        fatalError("Failed to create model container")
    }
}
