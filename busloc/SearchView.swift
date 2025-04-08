import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    let items: [Bus] = busData
    
    var filteredItems: [Bus?] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter {
                let routesList = $0.route
                return routesList.contains(where: { $0.lowercased().contains(searchText.lowercased()) })
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // Search bar
                TextField("Search Route...", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                ScrollView {
                    VStack {
                        ForEach(filteredItems, id: \.self) { item in
                            if let route = item {
                                RouteView(bus: route, filteredString: searchText)
                            } else {
                                Text("\(item!) - No route available")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("Search Routes")
        }
    }
}

struct RouteView: View {
    var bus: Bus
    var filteredString: String?

    var body: some View {
        VStack(alignment: .leading) {
            DisclosureGroup {
                ForEach(bus.route, id: \.self) { route in
                    HStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 8, height: 8)
                            .padding(.leading, 32)
                        Text(route)
                            .font(.body)
                            .fontWeight(route.lowercased().contains(filteredString?.lowercased() ?? "") ? .bold : .regular) // Bold jika cocok
                            .foregroundColor(route.lowercased().contains(filteredString?.lowercased() ?? "") ? .orange : .primary)
                        Spacer()
//                        Text("\(halte.eta) min")
//                            .foregroundColor(.gray)
                    }
                }
            } label: {
                HStack {
                    Image(systemName: "bus")
                        .foregroundColor(.orange)
                    Text(bus.name)
                        .font(.headline)
                }
            }
            .padding()
        }
    }
}

struct Halte: Identifiable {
    let id = UUID()
    let name: String
    let eta: Int
    let latitude: Double
    let longitude: Double
}

struct Rute {
    let name: String
    let haltelist: [Halte]
}

final class RouteData {
    static func allRoutes() -> [String: Rute] {
        return [
            "The Breeze": Rute(name: "The Breeze", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "Aeon": Rute(name: "Aeon", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "Intermoda": Rute(name: "Intermoda", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "Foresta": Rute(name: "Foresta", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "ICE BSD": Rute(name: "ICE BSD", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "SML Plaza": Rute(name: "SML Plaza", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ]),
            "Greenwich": Rute(name: "Greenwich", haltelist: [
                Halte(name: "Halte 1", eta: 10, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 2", eta: 15, latitude: 48.856614, longitude: 2.352222),
                Halte(name: "Halte 3", eta: 20, latitude: 48.856614, longitude: 2.352222)
            ])
        ]
    }
}

#Preview {
    SearchView()
}
