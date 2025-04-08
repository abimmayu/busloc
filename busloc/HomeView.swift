//
//  home view.swift
//  busloc
//
//  Created by Aqua on 27/03/25.
//

import SwiftUI

let busData: [Bus] = BusData.getData()

struct HomeView: View {
    @State private var selectedBus: Int = 0;
    @State private var isNavigating = false
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 50)
            ZStack {
                HalfCircle()
                    .fill(Color.orange)
                    .frame(height: 180)
                    .overlay(
                        Text("Start your journey!")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    )
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
            .padding(.bottom, 75)
            NavigationLink(destination: SearchView()) {
                HStack {
                    TextField("Destination", text: .constant(""))
                        .padding(.trailing,120)
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .clipShape(Circle())
                        
                    }
                    .frame(maxWidth: 50, maxHeight: 50)
                }
                .frame(width: 300, height: 50)
                .background(Color.gray.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(radius: 1)
                .padding()
                .padding(.bottom, 10)
            }
            ScrollView {
                VStack {
                    ForEach(Array(busData.enumerated()), id: \.element) { index, bus in
                        TicketMask(bus: bus, onClick: {
                            selectedBus = index+1
                            isNavigating = true
                        }
                            
                        )
                    }
                }
            }
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.top)
        .background(
                    NavigationLink(
                        destination: BusStopList(rute: selectedBus),
                        isActive: $isNavigating,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
    }
}

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


#Preview {
    HomeView()
}
