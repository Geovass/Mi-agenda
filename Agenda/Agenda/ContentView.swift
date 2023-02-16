//
//  ContentView.swift
//  Agenda
//
//  Created by alumno on 16/02/23.
//

import SwiftUI

struct Contact: Hashable{
    let name: String
    let lastName : String
    let imageName: String
    let movil: String
    let fechaNacimiento: Date
    //fechaNacimiento.formatted(.dateTime.day().month().year())
    let email: String
    let color: Color
}

struct ContentView: View {
    
    var contacts: [Contact] = [
        .init(name: "Milner", lastName: "Flores", imageName: "person.circle.fill", movil: "5510506314", fechaNacimiento: Date.now, email: "milner_ushuaia@gmail.com", color: .cyan),
        .init(name: "Aldo", lastName: "Guzman", imageName: "person.circle.fill", movil: "5635349874", fechaNacimiento: Date.distantPast, email: "yaelguzz27@gmail.com", color: .orange),
        .init(name: "Carlos", lastName: "Diaz", imageName: "person.circle.fill", movil: "5549438145", fechaNacimiento: Date.distantFuture, email: "koaramistic@gmail.com", color: .green)]
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            List {
                Section("Mas antiguos") {
                    ForEach(contacts, id: \.name ) { contact in
                        NavigationLink(value: contact) {
                            Label(contact.name, systemImage: contact.imageName)
                                .foregroundColor(contact.color)
                        }
                    }
                }
                Section("Mas recientes"){
                    
                }
            }
            
            .navigationTitle("Mis contactos")
            .navigationDestination(for: Contact.self){ cont in
                    VStack{
                        Label{
                        }icon:{
                            Image(systemName: "\(cont.imageName)")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .foregroundColor(cont.color)
                        }
                        
                        Text("\(cont.name) " + "\(cont.lastName)")
                            .font(.system(size: 30))
                        
                        Label{
                            Text("Movil: ")
                                .font(.system(size: 15))
                                .foregroundColor(cont.color)
                            Text("\(cont.movil)")
                                .font(.system(size: 15))
                        }icon:{}
                        
                        Label{
                        }icon: {
                            Image(systemName: "phone.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                                .foregroundColor(cont.color)
                            Image(systemName: "message.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                                .foregroundColor(cont.color)
                            Image(systemName: "video.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                                .foregroundColor(cont.color)
                            Image(systemName: "envelope.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                                .foregroundColor(cont.color)
                                
                        }
                }.padding(.init(top: 50, leading: 0, bottom: 600, trailing: 10))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
