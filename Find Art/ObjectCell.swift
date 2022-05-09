//
//  ObjectCell.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 09/05/2022.
//

import SwiftUI

struct ObjectCell: View {
    
    var object: ArtObject
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Text(object.title)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button("More") {
                    
                }
                .font(.callout)
            }
            .font(.title)
            if object.isPublicDomain == false {
                Image(systemName: "photo")
                Text("Image is not Public Domain")
                    .font(.subheadline)
            } else {
                AsyncImage(url: .init(string: object.primaryImage)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 300, maxHeight: 100)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            Text("Artist: " + object.artistDisplayName)
            Text("Culture: " + object.culture)
        }
        .padding()
    }
}

struct ObjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ObjectCell(object: .init(objectID: 11,
                                 isPublicDomain: true, primaryImage: "https://images.metmuseum.org/CRDImages/as/web-large/79016.jpg",
                                 objectName: "Bead", title: "Tubular Bead", culture: "Mexico", artistDisplayName: "Unknown", artistDisplayBio: ""))
    }
}
