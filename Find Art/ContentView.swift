//
//  ContentView.swift
//  Find Art
//
//  Created by Margarita Novokhatskaia on 10/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Hello, User!")
                .padding(.top, 32)
                .font(.largeTitle)
            HStack {
                Text("Login:")
                Spacer()
                TextField("Enter login", text: $login) .frame(maxWidth: 150) .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack { Text("Password:")
                Spacer()
                SecureField("Enter password", text: $password)
                    .frame(maxWidth: 150)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: self.onLoginPressed) {
                Label("Sign in", systemImage: "arrow.right.circle")
            }.padding(.top, 50)
                .padding(.bottom, 20)
                .disabled(login.isEmpty || password.isEmpty)
            Spacer()
        }.frame(maxWidth: 250)
    }
    
    private func onLoginPressed() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
