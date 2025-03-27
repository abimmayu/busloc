//
//  home view.swift
//  busloc
//
//  Created by Aqua on 27/03/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            // MARK: - HEADER
            ZStack {
                // Half Circle Background
                HalfCircle()
                    .fill(Color.orange)
                    .frame(height: 180)
                    .overlay(
                        Text("Start your journey!")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    )

                // Profile Avatar
                Circle()
                    .stroke(Color.orange, lineWidth: 8)
                    .background(Circle().fill(Color.white))
                    .frame(width: 200, height: 130)
                    .overlay(
                        Image("Kucing")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding(10)
                    )
                    .offset(y: 90)
            }
            .padding(.bottom, 50)
            Spacer()
            
            // MARK: - SEARCH BAR
            HStack {
                TextField("Destination", text: .constant(""))
                    .padding(.leading, 15)

                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .clipShape(Circle())
                        
                }
                .frame(maxWidth: 50, maxHeight: 50)
              
            }
            .frame(height: 50)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
            .padding()
            .padding(.bottom, 480)
            Spacer()
        }
        .background(Color.gray.opacity(0.1)) // Background for the full view
        .edgesIgnoringSafeArea(.top)
    }
}
// MARK: - HALF CIRCLE SHAPE
struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                    radius: rect.width / 2,
                    startAngle: .degrees(0),
                    endAngle: .degrees(180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}


#Preview {
    HeaderView()
}
