//
//  ListDetailView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//

import SwiftUI



struct ListDetailView: View {
    
    //var character: Character // creo una variable de tipo Character para pasar los datos de los personajes al detalle de la Lista
    
    var character: Results // creo una variable de tipo Results 
    
    
    var body: some View {
        VStack {
            AsyncImage(url: character.imageUrl) { image in
                       image.resizable().frame(width: 200, height: 200)
                               .clipShape(Circle())
                               .overlay(Circle()
                                   .stroke(Color.black, lineWidth: 4 ))
                           .shadow(color: Color.gray, radius: 5)
                       } placeholder: {
                           Image(systemName: "person.fill")
                               .resizable().frame(width: 200, height: 200)
                               .clipShape(Circle())
                               .overlay(Circle()
                                   .stroke(Color.black, lineWidth: 4 ))
                           .shadow(color: Color.gray, radius: 5)
                           
                       }
            Text(character.name!).font(.largeTitle)
            Text(character.species!).font(.title)
            Text(character.status!).font(.title2)
            Spacer()
            
            /*character.image!.resizable().frame(width: 200, height: 200).clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 4)).shadow(color: Color.gray, radius: 5)
            Text(character.name!).font(.largeTitle)
            Text(character.type!).font(.title)
            Spacer() // representa un espacio en el bloque restante del VStack*/
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListDetailView (character: Results.init(name: "Name", status: "Alive", species: "String", url: "url"))
        //ListDetailView(character: Character(id: 1,
           // image: Image(systemName: "person.fill"),
           // name: "Mau", type: "human"))
    }
}
