//
//  ContentView.swift
//  Memorize
//
//  Created by Christian Perez on 8/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
    }
}

struct CardView : View {
    var isFaceUp : Bool
    var body : some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 10)
                Text("😀").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
        
        .padding()
    }
}


























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            ContentView()
                .previewInterfaceOrientation(.portraitUpsideDown)
        }
    }
}
