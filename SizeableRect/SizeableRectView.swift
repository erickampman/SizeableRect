//
//  SizeableRectView.swift
//  SizeableRect
//
//  Created by Eric Kampman on 3/6/24.
//

import SwiftUI

struct SizeableRectView: View {
	@State var rect = CGRect(x: 0, y: 0, width: 0, height: 0)

	var drag: some Gesture {
		DragGesture(minimumDistance: 1)
			.onChanged() { value in
				rect = makeRect(value.location, value.startLocation)
			}
			.onEnded() { value in
				rect = makeRect(value.location, value.startLocation)
			}
	}

    var body: some View {
		GeometryReader { gp in
			Rectangle()
				.gesture(drag)
			Rectangle()
				.offset(rect.origin)
				.frame(width: rect.size.width, height: rect.size.height)
				.foregroundColor(.blue)
		}
    }
	
	func makeRect(_ p1: CGPoint, _ p2: CGPoint) -> CGRect {
		var xMin = 0.0
		var xMax = 0.0
		var yMin = 0.0
		var yMax = 0.0
		if p1.x < p2.x {
			xMin = p1.x
			xMax = p2.x
		} else {
			xMin = p2.x
			xMax = p1.x
		}
		if p1.y < p2.y {
			yMin = p1.y
			yMax = p2.y
		} else {
			yMin = p2.y
			yMax = p1.y
		}
		
		return CGRect(x: xMin, y: yMin, width: xMax - xMin, height: yMax - yMin)
	}
}

#Preview {
    SizeableRectView()
}
