//    //
//    //  ContentView.swift
//    //  Memorise
//    //
//    //  Created by Mckiba Williams on 5/21/20.
//    //  Copyright © 2020 McKiba Williams. All rights reserved.
//    //
//    import SwiftUI
//
//    struct ContentView: View {
//
//        @ObservedObject var viewModel: EmojiMemoryGame
//
//        var body: some View {
//
//            ZStack{
//                //NewGameButton()
//                Grid(viewModel.cards) { card in
//                    CardView(card: card).onTapGesture {
//                        self.viewModel.choose(card: card)
//
//                    }.aspectRatio(0.72, contentMode: .fit)
//                        .padding(1)
//                }
//                .padding()
//                .foregroundColor(viewModel.theme.themColor)
//                //.aspectRatio(0.66, contentMode: .fit)
//                //CustomNavigationView()
//
//            }
//        }
//    }
//
//    struct CustomNavigationView: View {
//
//        var body: some View {
//
//            VStack{
//                HStack{
//                    Text("Title")
//                        .font(.system(size:35, weight: .bold))
//                    Spacer()
//
//                }.padding()
//                Spacer()
//            }
//        }
//    }
//
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView(viewModel: EmojiMemoryGame())
//        }
//    }
//
//    struct CardView : View{
//        var card: MemoryGame<String>.Card
//
//        var body: some View{
//            GeometryReader{ geometry in
//                self.body(for: geometry.size)
//            }
//        }
//
//
//        func body(for size:CGSize) -> some View {
//            ZStack{
//                if self.card.isFaceUp{
//                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
//                    RoundedRectangle(cornerRadius: cornerRadius).stroke().stroke(lineWidth: 3)
//                    Text(self.card.Content)
//                }else{
//                    if !card.isMatched {
//                        RoundedRectangle(cornerRadius: cornerRadius).fill()
//                    }
//                }
//            }
//            .font(Font.system(size: fontSize(for: size)))
//        }
//
//
//        let cornerRadius : CGFloat = 10.0
//        let edgelineWidth : CGFloat = 5
//        let fontScaleFactor: CGFloat = 0.75
//
//        func fontSize(for size: CGSize) -> CGFloat {
//            min(size.width, size.height) * fontScaleFactor
//
//        }
//
//    }
//
//
//    struct NewGameButton: View {
//
//        var body: some View{
//            ZStack {
//
//                RoundedRectangle(cornerRadius: 5)
//                    .frame(width: 100, height: 50)
//                    .foregroundColor(Color.red)
//                Text("Game").bold()
//            }
//
//        }
//    }
//
//
//
