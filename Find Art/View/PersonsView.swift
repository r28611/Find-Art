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
    @State var filterSettingsIsPresented: Bool = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var filter: Filter
    
    init(model: VM) {
        self.model = model
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(filter.header)) {
                    ForEach(self.model.persons) { person in
                        PersonCell(person: person)
                            .onAppear {
                                if person == model.persons.last {
                                    model.loadMoreContent()
                                }
                            }
                    }
                }
                .padding(2)
            }
            .sheet(isPresented: self.$filterSettingsIsPresented,
                   onDismiss: {
                if model.persons.isEmpty {
                    model.fetchPersons()
                }
            },
                   content: {
                FilterSettingsView()
                    .environmentObject(self.filter)
            })
            .alert(item: self.$model.error) { error in
                Alert(title: Text("Network error"),
                      message: Text(error.localizedDescription),
                      dismissButton: .cancel())
            }
            .navigationBarTitle(Text("Persons"))
            .navigationBarItems(trailing:
                                    Button("Filter") {
                self.filterSettingsIsPresented = true
            })
            .onAppear {
                model.fetchPersons()
            }
            .refreshable { model.fetchPersons() }
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    
    static var previews: some View {
        PersonsView(model: PersonsViewModel())
    }
    
}
