//
//  MarqueeView.swift
//
//  Created by Monty Harper on 12/11/23.
//  https://github.com/MontyHarper
//

import Foundation
import SwiftUI

struct MarqueeView: View {
    
    // Making the controller optional allows you to place the MarqueeView before text is available to display without crashing your app.
    var controller: MarqueeController?
    
    init(controller: MarqueeController?) {
        self.controller = controller
    }
    
    var body: some View {
        
        if let controller = controller {
            TimelineView(.animation) {context in
                Text(controller.frame(context.date).text)
                    .padding()
                    .lineLimit(1)
                    .font(Font(controller.marqueeFont))
                    .foregroundColor(.primary)
                    .offset(x: controller.frame(context.date).offset, y: 0.0)
                    .background(.white)
                    .fixedSize(horizontal: true, vertical: false)
                    .clipped()
            }
        } else {
            Text("There is nothing to display yet...")
        }
    }
}


class MarqueeController {
    
    let message: String
    var characterWidths = [Double]()
    var timeMarkers = [TimeInterval]()
    var startTime = 0.0
    var runningTime = 0.0
    let speed = 90.0 // points/second
    let marqueeFont = UIFont.systemFont(ofSize: 24, weight: .black) // Using a UIFont because the width can be measured.
    
    init(message: String) {
        self.message = message
        var text = message
        for _ in 0..<message.count {
            let first = String(text.removeFirst())
            let width = first.size(withAttributes: [.font: marqueeFont]).width
            characterWidths.append(width)
            runningTime += width/speed
            timeMarkers.append(runningTime)
            text += first
        }
        startTime = Date().timeIntervalSince1970
    }
    
    // Given a time, return the text and offset that should be displayed at that moment.
    func frame(_ date: Date) -> (text: String, offset: Double) {
        let time = (date.timeIntervalSince1970 - startTime).truncatingRemainder(dividingBy: runningTime)
        let index = (timeMarkers.firstIndex(where: {time < $0}) ?? 0)
        let startStringIndex = message.startIndex
        let endStringIndex = message.endIndex
        let midStringIndex = message.index(message.startIndex, offsetBy: index)
        let text = String(message[midStringIndex..<endStringIndex]) + String(message[startStringIndex..<midStringIndex])
        let offset = characterWidths[index] * ((timeMarkers[index] - time)/(timeMarkers[index] - (index == 0 ? 0 : timeMarkers[index - 1])) - 1.0)
        return(text: text, offset: offset)
    }
}



