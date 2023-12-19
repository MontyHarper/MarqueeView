//
//  ContentView.swift
//  MarqueeView
//
//  Created by Monty Harper on 12/19/23.
//  https://github.com/MontyHarper
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MarqueeView(controller: MarqueeController(message: "Hello World! This is a test. This text will scroll smoothly from right to left, looping around forever and ever.  *  "))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
