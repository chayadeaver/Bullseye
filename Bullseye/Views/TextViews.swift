//
//  TextViews.swift
//  Bullseye
//
//  Created by Chaya Deaver on 1/26/23.
//

import SwiftUI

struct InstructionText: View {
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.foregroundColor(Color("TextColor"))
			.bold()
			.kerning(2.0)
			.multilineTextAlignment(.center)
			.lineSpacing(4.0)
			.font(.footnote)
	}
}

struct BigNumberText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.foregroundColor(Color("TextColor"))
			.kerning(-1.0)
			.font(.largeTitle)
			.fontWeight(.black)
	}
}

struct SliderLabelText: View {
	var text: String
	
		var body: some View {
			Text(text)
				.foregroundColor(Color("TextColor"))
				.bold()
		}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			InstructionText(text: "Instructions")
			BigNumberText(text: "999")
			SliderLabelText(text: "42")
		}
		
	}
}
