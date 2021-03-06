//
//  CircleImage.swift
//  Onboarding
//
//  Created by Fritz Heider on 5/16/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("FritzFace")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth:4))
            .shadow(radius: 10)
        
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
