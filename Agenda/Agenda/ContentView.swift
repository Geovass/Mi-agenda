//
//  ContentView.swift
//  Agenda
//
//  Created by Geovanni Romero on 16/02/23.
//

import SwiftUI

struct Contact: Hashable{
    let name: String
    let lastName : String
    let imageName: String
    let movil: String
    let fechaNacimiento: Date
    let email: String
    let color: Color
}

struct ContentView: View {
    
    @State var newName = ""
    @State var newLastName = ""
    @State var newFechaNacimiento = Date.now
    @State var newChooseColor = Color.purple
    @State var newEmail = ""
    @State var newFirstMovil = ""
    @State var newSecondMovil = ""
    
    var contacts: [Contact] = [
        .init(name: "Milner", lastName: "Flores", imageName: "person.circle.fill", movil: "5510506314", fechaNacimiento: Date.now, email: "milner_ushuaia@gmail.com", color: .cyan),
        .init(name: "Aldo", lastName: "Guzman", imageName: "person.circle.fill", movil: "5635349874", fechaNacimiento: Date.distantPast, email: "yaelguzz27@gmail.com", color: .orange),
        .init(name: "Carlos", lastName: "Diaz", imageName: "person.circle.fill", movil: "5549438145", fechaNacimiento: Date.distantFuture, email: "koaramistic@gmail.com", color: .green)]
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            Label{
            }icon: {
                NavigationLink{
                    List{
                        Section("Datos"){
                            TextField("Nombre", text: $newName)
                                .textFieldStyle(.roundedBorder)
                            TextField("Apellido", text: $newLastName)
                                .textFieldStyle(.roundedBorder)
                            DatePicker("Fecha de nacimiento", selection: $newFechaNacimiento, displayedComponents: .date)
                            ColorPicker("Elige un color", selection: $newChooseColor, supportsOpacity: true)
                                .textFieldStyle(.roundedBorder)
                        }
                        Section("Contacto"){
                            TextField("Email", text: $newEmail)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.emailAddress)
                            TextField("Movil 1", text: $newFirstMovil)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                            TextField("Movil 2", text: $newSecondMovil)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                        }
                    }.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    
                }label: {
                    Label{
                    }icon: {
                        Image(systemName: "person.badge.plus")
                            .foregroundColor(.brown)
                    }
                        }
                Image(systemName: "magnifyingglass")
                Image(systemName: "slider.vertical.3")
            }.padding(.init(top: 0, leading: 280, bottom: 0, trailing: 10))
            
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
                }
                    Form{
                        Label{
                            Text("\(cont.fechaNacimiento.formatted(.dateTime.day().month().year()))")
                        }icon:{
                            Image(systemName: "birthday.cake.fill")
                                .foregroundColor(cont.color)
                        }
                        
                        Label{
                            Text("\(cont.email)")
                        }icon:{
                            Image(systemName: "envelope.fill")
                                .foregroundColor(cont.color)
                        }
                    }
                }
            }
        }
        
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
