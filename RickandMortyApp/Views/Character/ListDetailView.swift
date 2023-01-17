//
//  ListDetailView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//

import SwiftUI



struct ListDetailView: View {
    
    
    var character: Results // variable to pass the data to the detail List
    
    
    var body: some View {
        VStack {
            AsyncImage(url: character.imageUrl) { image in
                image.resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    
            }
            Text(character.name!).font(.largeTitle)
                            //Text("Name").font(.largeTitle)
            Text(character.species!).font(.title2).foregroundColor(.gray)
                        HStack{
                            Text(character.status!).font(.title3).foregroundColor(.gray)
                            if (character.status == "Alive") {
                            Image(systemName: "circle.fill").foregroundColor(.green)
                        }else if(character.status == "unknown") {
                            Image(systemName: "circle.fill").foregroundColor(.orange)
                        }else{
                             Image(systemName: "circle.fill").foregroundColor(.red)
                        }            }
                        //Text(character.type).font(.title)
                        Spacer()
                        }
                    }
                }
            
          
struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListDetailView (character: Results.init(name: "Name", status: "Alive", species: "String", url: "url"))
    }
}
