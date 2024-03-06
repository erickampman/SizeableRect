//
//  SizeableRectView.swift
//  SizeableRect
//
//  Created by Eric Kampman on 3/6/24.
//

import SwiftUI

struct SizeableRectView: View {
	@State var offset = CGSize.zero
	@State var startLocation = CGPoint.zero

	var drag: some Gesture {
		DragGesture(minimumDistance: 1)
			.onChanged() { value in
				let x = value.location.x - value.startLocation.x
				let y = value.location.y - value.startLocation.y
				startLocation = value.startLocation
				self.offset = CGSize(width: abs(x), height: abs(y))
			}
			.onEnded() { value in
				let x = value.location.x - value.startLocation.x
				let y = value.location.y - value.startLocation.y
				self.offset = CGSize(width: abs(x), height: abs(y))
			}
	}

    var body: some View {
		GeometryReader { gp in
			Rectangle()
				.gesture(drag)
			Rectangle()
				.offset(CGPoint(x: startLocation.x, y: startLocation.y))
				.frame(width: self.offset.width, height: self.offset.height)
				.foregroundColor(.blue)
		}
    }
	
	func fixSize(_ start: CGPoint, _ end: CGPoint) -> CGSize {
		let w = end.x - start.x
		let h = end.y - start.y
		
		return CGSize(width: abs(w), height: abs(h))
	}
}

#Preview {
    SizeableRectView()
}
