//
//  ContentView.swift
//  Bullseye
//
//  Created by Chaya Deaver on 12/8/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var alertIsVisible = false
	@State private var sliderValue = 50.0
	@State private var game = Game()
	
	var body: some View {
		ZStack {
			Color("BackgroundColor")
				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				InstructionsView(game: $game)
				HStack {
					SliderLabelText(text: "1")
					Slider(value: $sliderValue, in: 1.0...100.0)
					SliderLabelText(text: "100")
				}
				.padding()
				Button(action: {
					print("Hello, SwiftUI")
					alertIsVisible = true
				}) {
					Text("Hit Me".uppercased())
						.bold()
						.font(.title3)
				}
					.padding(20.0)
					.background(
						ZStack {
							Color("ButtonColor")
							LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
						}
					)
					.foregroundColor(Color.white)
					.cornerRadius(21.0)
					.alert("Hello there!", isPresented: $alertIsVisible){
						Button("Awesome") {}
					} message: {
						let roundedValue = Int(sliderValue.rounded())
						Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
							.foregroundColor(Color("TextColor"))
					}
			}
		}
	}
}

struct InstructionsView: View {
	
	@Binding var game: Game
	
	
	var body: some View {
		VStack {
			InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
				.padding(.leading, 30.0)
				.padding(.trailing, 30.0)
			BigNumberText(text: String(game.target))
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		ContentView()
			.previewLayout(.fixed(width: 568, height: 320))
	}
}
