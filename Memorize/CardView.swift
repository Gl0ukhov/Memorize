//
//  CardView.swift
//  Memorize
//
//  Created by Матвей Глухов on 05.07.2024.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Pie(endAngle: .degrees(90))
                    .opacity(Constants.Pie.opacity)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    )
                    .padding(Constants.insent)
            }
            .opacity(card.isFaceUp ? 1:0)
            base
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatch ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let insent: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 15
        }
    }
}

#Preview {
    VStack {
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "X", id: "test2"))
            CardView(MemoryGame<String>.Card(content: "X", id: "test1"))
        }
        HStack {
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "This is a very long string and I hope it fits", id: "test2"))
            CardView(MemoryGame<String>.Card(isMatch: true, content: "X", id: "test1"))
        }
    }
    .padding()
    .foregroundStyle(.green)
    
}
