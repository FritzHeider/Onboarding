//
//  ContentVC.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/16/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 200)
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading){
                Text("Fritz Heider")
                    .font(.title)
                    .foregroundColor(.black)
                HStack {
                    Text("IOS Maker")
                        .font(.subheadline)
                    Spacer()
                    Text("Miami, FL")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
