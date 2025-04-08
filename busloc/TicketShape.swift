import SwiftUI

struct TicketMask: View {
    let bus: Bus
    var body: some View {
        ZStack {
            ZStack {
                Group {
                    Circle()
                        .frame(width: 20, height: 20)
                        .position(x: 0, y: 60)
                    Circle()
                        .frame(width: 20, height: 20)
                        .position(x: 300, y: 60)
                    Circle()
                        .frame(width: 20, height: 20)
                        .position(x: 200, y: 0)
                    Circle()
                        .frame(width: 20, height: 20)
                        .position(x: 200, y: 120)
                }
                .foregroundColor(.white)
                Path { path in
                    path.move(to: CGPoint(x: 150, y: 22))
                    path.addLine(to: CGPoint(x: 150, y: 120))
                }
                .stroke(style: StrokeStyle(lineWidth: 4, dash: [5, 5]))
                .foregroundColor(.white)
                .position(x: 200, y:50)
            }
            .frame(width: 300, height: 120)
            .background(Color.orange)
            .mask(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black)
                    .frame(maxWidth: 300, maxHeight: 120)
            )
            HStack {
                VStack(alignment: .leading) {
                    Text(bus.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    HStack {
                        ForEach(bus.route, id: \.self) { stop in
                            Text("\(stop),")
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Spacer()
                VStack(alignment: .trailing, spacing: 10) {
                    Text("ETA")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("\(bus.etaStart) - \(bus.etaEnd)")
                        .padding(.top, 4)
                        .padding(.bottom, 8)
                        .multilineTextAlignment(.trailing)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 70)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
        .frame(maxWidth: 300, maxHeight: 120)
    }
}


struct Bus: Hashable {
    let name: String
    let route: [String]
    let etaStart: String
    let etaEnd: String
}

final class BusData {
    static func getData() -> [Bus] {
        return [
            .init(name: "#1", route: ["Kallithea", "Piraeus"], etaStart: "10:30", etaEnd: "11:30"),
            .init(name: "#2", route: ["Kallithea", "Piraeus"], etaStart: "11:00", etaEnd: "11.30"),
            ]
    }
}

#Preview {
    TicketMask(bus: BusData.getData()[0])
}
