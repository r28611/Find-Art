//
//  PersonsView.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/05/2022.
//

import SwiftUI
import Combine

struct PersonsView<VM: ViewModelProtocol>: View {
    
    @ObservedObject var model: VM
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    init(model: VM) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                        
                    ForEach(self.model.persons) { person in
                            PersonCell(person: person)
                        }
                    }
                    .padding(2)
            }
            .alert(item: self.$model.error) { error in
                Alert(title: Text("Network error"),
                      message: Text(error.localizedDescription),
                      dismissButton: .cancel())
            }
            .navigationBarTitle(Text("Persons"))
                .foregroundColor(self.colorScheme == .light ? .blue : .orange)
            .onAppear {
                model.fetchPersons()
            }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    
    static var previews: some View {
        PersonsView(model: PersonsViewModel())
    }
    
}
