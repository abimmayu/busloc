import SwiftUI

struct TicketMask: View {
    let bus: Bus
    let onClick: () -> Void
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
                    Text("\(bus.route.first!) - \(bus.route.last!)")
                        .font(.caption)
                        .padding(.top, 4)
                        .foregroundColor(.white)
                    Button(action: onClick){
                        Text("Route >")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .frame(maxWidth: 50, alignment: .leading)
                            .padding(.leading, 8)
                            .background(.white)
                            .cornerRadius(5)
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
            .init(name: "#1", route: [
                "Intermoda", "Cosmo", "Verdant View", "Eternity", "Simplicity 2", "Edutown 1", "Edutown 2",
                "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5", "GOP 1", "SML Plaza", "The Breeze",
                "CBD Timur 1", "CBD Timur 2", "Nava Park 1", "SWA 2", "Giant", "Eka Hospital 1", "Puspitaloka",
                "Polsek Serpong", "Ruko Madrid", "Pasar Modern Timur", "Griya Loka 1", "Sektor 1.3", "Griya Loka 2",
                "Santa Ursula 1", "Santa Ursula 2", "Sentra Onderdil", "Autoparts", "Eka Hospital 2", "East Business District",
                "SWA 1", "Greencove", "The Breeze", "CBD Timur 1", "CBD Selatan 1", "AEON Mall 1", "CBD Barat 2",
                "Simpilicity 1", "Cosmo", "Verdant View", "Intermoda", "Icon Business Park", "Masjid Al-Ukhuwah",
                "Divena & Deshna", "Avani", "Amarilla", "Chadnya", "Atmajaya", "Intermoda"
            ], etaStart: "10:30", etaEnd: "11:30"),
            .init(name: "#2", route: [
                "Greenwich Park Office", "Jadeite", "De Maja", "De Heliconia 2", "De Nara", "De Park 2", "Nava Park 2",
                "Giardina", "Collinare", "Foglio", "Studento 2", "Albera", "Foresta 1", "GOP 1", "SML Plaza", "The Breeze",
                "CBD Timur 1", "CBD Timur 2", "Nava Park 1", "SWA 2", "Giant", "Eka Hospital 1", "Puspitaloka",
                "Polsek Serpong", "Ruko Madrid", "Pasar Modern Timur", "Griya Loka 1", "Sektor 1.3", "Griya Loka 2",
                "Santa Ursula 1", "Santa Ursula 2", "Sentra Onderdil", "Autoparts", "Eka Hospital 2", "East Business District",
                "SWA 1", "Greencove", "The Breeze", "CBD Timur 1", "CBD Timur 2", "Simpang Foresta", "Allevare", "Fiore",
                "Studento 1", "Naturale", "Fresco", "Primavera", "Foresta 2", "FBL 5", "Courts Mega Store", "Q BIG 1",
                "Lulu", "Greenwich Park 1"
            ], etaStart: "11:00", etaEnd: "11.30"),
            .init(name: "#3", route: [
                "Intermoda", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5",
                "EPICON", "Gramedia", "Astra", "Courts Mega Store", "Q BIG 1", "Lulu", "Greenwich Park 1", "Jadeite",
                "De Maja", "De Heliconia 2", "De Nara", "De Park 2", "Nava Park 2", "GOP 1", "Giardina", "Collinare", "Foglio",
                "Studento 2", "Albera", "Foresta 1", "GOP 1", "SML Plaza", "The Breeze", "Casa De Parco 2", "B M C",
                "Digital Hub 1", "Digital Hub 2", "Verdant View", "Eternity", "Intermoda"
            ], etaStart: "11:30", etaEnd: "12:30"),
            .init(name: "#4", route: [
                "Intermoda", "Icon Centro", "Horizon Broadway", "Extreme Park", "Saveria", "Casa De Parco 1", "SML Plaza",
                "The Breeze", "CBD Timur 1", "CBD Selatan 1", "AEON Mall 1", "CBD Timur 2", "Simpang Foresta", "Allevare",
                "Fiore", "Studento 1", "Naturale", "Fresco", "Primavera", "Foresta 2", "De Park 1", "De Frangpani",
                "De Heliconia 1", "De Brassia", "Jadeite", "Greenwich Park 2", "Q Big 2", "Q Big 3", "BCA", "FBL 2", "FBL 1",
                "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5", "CBD Barat 1", "CBD Barat 2", "Simplicity 1", "Intermoda"
            ], etaStart: "12:30", etaEnd: "13:30"),
            .init(name: "#5", route: [
                "The Breeze", "CBD Timur 1", "CBD Selatan 1", "Lobby AEON", "AEON Mall 2", "CBD Utara 3", "ICE 1", "ICE 2",
                "ICE Business Park", "ICE 6", "ICE 5", "CBD Barat 1", "CBD Barat 2", "Lobby AEON", "AEON Mall 2",
                "CBD Timur 2", "Nava Park 1", "Greencove", "The Breeze"
            ], etaStart: "13:30", etaEnd: "14:30"),
            .init(name: "#7", route: [
                "Intermoda", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5",
                "EPICON", "Gramedia", "Astra", "Courts Mega Store", "Q BIG 1", "Lulu", "Q Big 2", "Q Big 3", "BCA", "FBL 2",
                "FBL 1", "GOP 1", "SML Plaza", "The Breeze", "Casa De Parco 2", "B M C", "Digital Hub 1", "Saveria",
                "Casa De Parco 1", "CBD Timur 1", "CBD Selatan 1", "Lobby AEON", "AEON Mall 1", "AEON Mall 2", "CBD Barat 2",
                "Simplicity 1", "Intermoda"
            ], etaStart: "14:30", etaEnd: "15:30"),
            ]
    }
}

#Preview {
    TicketMask(bus: BusData.getData()[0], onClick: {})
}
