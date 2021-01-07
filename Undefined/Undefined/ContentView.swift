//
//  ContentView.swift
//  Undefined
//
//  Created by Matt Jerrard on 12/29/20.
//

import SwiftUI
import Combine

class Character: ObservableObject{
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    static let sizes = ["large", "medium", "small"]
    let character_sizes = [Image("large_stick_man"), Image("medium_stick_man"), Image("small_stick_man")]
    
    var size = 0 { didSet { update() } }
    var name = "" { didSet { update() } }
    var character = Image("large_stick_man") { didSet { update() } }
    
    func getSize() -> Int{
        return size
    }
    
    func getCharacter() ->Image{
        return character
    }
    
    func getCharacterSizes() ->[Image]{
        return character_sizes
    }
    
    func update() {
        objectWillChange.send(())
    }
    
}

struct ContentView: View {
    @ObservedObject var character = Character()
    
    func getSize() ->Int{
        return character.getSize()
    }
    
    func getCharacter() ->Image{
        return character.getCharacter()
    }
    
    func getCharacters() ->[Image]{
        return character.getCharacterSizes()
    }
        
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $character.size, label: Text("Select character size")) {
                    ForEach(0 ..< Character.sizes.count) {
                        Text(Character.sizes[$0]).tag($0)
                        //var characterImage = getCharacters()[$0]
                    }
                    
                }
                
            //Text(getSize())
                                        
            if getSize() == 0 {
                getCharacters()[0]
                .resizable()
                .scaledToFit()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            }
            if getSize() == 1 {
                getCharacters()[1]
                .resizable()
                .scaledToFit()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            }
            if getSize() == 2 {
                getCharacters()[2]
                .resizable()
                .scaledToFit()
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            }
                
        }
            
        .navigationBarTitle(Text("Choose your character..."))

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
