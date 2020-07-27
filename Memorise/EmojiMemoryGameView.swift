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
    
    let newGame: LocalizedStringKey = "New Game"
    var body: some View {
        
        VStack{
            HStack{
                Text(viewModel.theme.themeName)
                    .font(.system(size:35, weight: .bold))
                Spacer()
                
                Button(action:  {
                    withAnimation(.easeInOut(duration: 2)) {
                        self.viewModel.newGame()
                    }
                }, label: {Text(newGame)
                    .font(.system(size:23 , weight: .semibold))})
            }.padding()
            Spacer()
            
            
            ZStack{
                Grid(viewModel.cards) { card in
                    CardView(card: card).onTapGesture {
                        withAnimation(.linear(duration: 0.7)){
                            self.viewModel.choose(card: card)
                        }
                        
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
        
        @State private var animatedBonusRemaining: Double = 0
        
        private func startBonusTimeRemaining() {
            
            
            animatedBonusRemaining = card.bonusRemaining
            withAnimation(.linear(duration: card.bonusTimeRemaining)){
                
                animatedBonusRemaining = 0
            }
        }
        
        
        
        var body: some View{
            GeometryReader{ geometry in
                self.body(for: geometry.size)
            }
        }
        
        @ViewBuilder
        private func body(for size: CGSize) -> some View {
            
            if card.isFaceUp || !card.isMatched {
                ZStack{
                    Group{
                        if card.isConsumingBonusTime{
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90),clockwise: true)
                                .onAppear(){
                                    self.startBonusTimeRemaining()
                            }
                        }else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90),clockwise: true)
                        }
                    } .padding(5).opacity(0.4)
                        .transition(.identity)
                    Text(card.Content)
                        .font(Font.system(size: fontSize(for: size)))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 :0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
        }
        
        
        
        //Mark : Drawing Constants
        
        
        private let fontScaleFactor: CGFloat = 0.7
        
        private func fontSize(for size: CGSize) -> CGFloat {
            min(size.width, size.height) * fontScaleFactor
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




