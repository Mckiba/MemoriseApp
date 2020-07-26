//
//  ContentView.swift
//  Memorise
//
//  Created by Mckiba Williams on 5/21/20.
//  Copyright © 2020 McKiba Williams. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack{
            HStack{
                Text(viewModel.theme.themeName)
                    .font(.system(size:35, weight: .bold))
                Spacer()
                NewGameButton().onTapGesture {
                    self.viewModel.newGame()
                }
            }.padding()
            Spacer()
            
            ZStack{
                //NewGameButton()
                Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        self.viewModel.choose(card: card)
                        
                    }.aspectRatio(0.72, contentMode: .fit)
                        .padding(1)
                }
                .padding()
                .foregroundColor(viewModel.theme.themColor)
            }
            Text("Score: \(viewModel.score)")
                .font(.system(size:25, weight: .bold))
            Spacer()
        }
    }
    
    
    struct CardView : View{
        var card: MemoryGame<String>.Card
        
        var body: some View{
            GeometryReader{ geometry in
                self.body(for: geometry.size)
            }
        }
        
        @ViewBuilder
        private func body(for size: CGSize) -> some View {
            
            if card.isFaceUp || !card.isMatched {
                ZStack{
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockwise: true)
                        .padding(5)
                        .opacity(0.4)
                    Text(self.card.Content)
                        .font(Font.system(size: fontSize(for: size)))
                }
                .modifier(Cardify(isFaceUp: card.isFaceUp))
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
        
        
        
        //Mark : Drawing Constants
        
        
        private let fontScaleFactor: CGFloat = 0.7
        
        private func fontSize(for size: CGSize) -> CGFloat {
            min(size.width, size.height) * fontScaleFactor
        }
    }
    
    
    
    struct NewGameButton: View {
        
        var body: some View{
            ZStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 50)
                    .foregroundColor(Color.white)
                Text("New Game")
                    .font(.system(size:23 , weight: .semibold))
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
       // game.choose(card: game.cards[0])
        return ContentView(viewModel: game)
    }
}




