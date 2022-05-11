//
//  PersonCell.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 09/05/2022.
//

import SwiftUI

struct PersonCell: View {
    
    var person: Person
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text(person.displayname)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button("More") {
                    
                }
                .font(.callout)
            }
            .font(.title3)
            VStack(alignment: .leading) {
                Text(person.displaydate ?? "years of life unknown")
                if let bplace = person.birthplace,
                   let dplace = person.deathplace {
                    Text("\(bplace) - \(dplace)")
                }
                if let culture = person.culture {
                    Text("\(culture)")
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(person: Person(id: 1, displayname: "Mabel Everett Harris Lyon", displaydate: "c.1873 - 1931", birthplace: nil, culture: "Dutch", deathplace: nil, url: "https://www.harvardartmuseums.org/collections/person/3004"))
    }
}
