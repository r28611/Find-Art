//
//  FilterSettingsView.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 11/05/2022.
//

import SwiftUI

struct FilterSettingsView: View {
    
    @EnvironmentObject var filter: Filter
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(CultureTag.allCases) { tag in
                    Button(action: {
                        self.changeTagState(tag)
                    }, label: {
                        HStack {
                            if self.filter.tags.contains(tag) {
                                Image(systemName: "checkmark.circle.fill")
                            } else {
                                
                            }
                            Text(tag.rawValue.capitalized)
                        }
                    })
                }
            }
            .navigationBarTitle(Text("Tags"))
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func changeTagState(_ tag: CultureTag) {
        filter.tags.contains(tag)
        ? filter.tags.removeAll(where: { $0 == tag })
        : filter.tags.append(tag)
    }
}


struct FilterSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSettingsView(filter: .init())
    }
}
