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
            .font(.title)
            Image(systemName: "photo")
//                AsyncImage(url: .init(string: "object.primaryImage")) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success(let image):
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(maxWidth: 300, maxHeight: 100)
//                    case .failure:
//                        Image(systemName: "photo")
//                    @unknown default:
//                        EmptyView()
//                    }
//                }
//            }
            Text(person.displaydate ?? "unknown")
            Text(person.culture ?? "unknown")
        }
        .padding()
    }
}

struct PersonCell_Previews: PreviewProvider {
    static var previews: some View {
        PersonCell(person: Person(id: 1, displayname: "Mabel Everett Harris Lyon", displaydate: "c.1873 - 1931", birthplace: nil, culture: "Dutch", deathplace: nil, url: "https://www.harvardartmuseums.org/collections/person/3004"))
    }
}
