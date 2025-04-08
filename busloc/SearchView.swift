import SwiftUI

struct SearchView: View {
    @State private var startStop: String = ""
    @State private var endStop: String = ""
    @State private var isSelectingStart = false
    @State private var isSelectingEnd = false
    @State private var searchResult: Bus?

    let items: [Bus] = busData
    var allStops: [String] {
        Set(items.flatMap { $0.route }).sorted()
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {

                VStack(alignment: .leading) {
                    NavigationLink(destination: StopPickerView(selectedStop: $startStop, allStops: allStops), isActive: $isSelectingStart) {
                        HStack {
                            Text(startStop.isEmpty ? "Select starting stop" : startStop)
                                .foregroundColor(startStop.isEmpty ? .gray : .primary)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }

                VStack(alignment: .leading) {
                    NavigationLink(destination: StopPickerView(selectedStop: $endStop, allStops: allStops), isActive: $isSelectingEnd) {
                        HStack {
                            Text(endStop.isEmpty ? "Select destination stop" : endStop)
                                .foregroundColor(endStop.isEmpty ? .gray : .primary)
                            Spacer()
                            Image(systemName: "magnifyingglass")
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                }

                Button("Find Best Route") {
                    searchResult = findBestRoute(from: startStop, to: endStop)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

                if let result = searchResult {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Rute Terbaik: \(result.name)")
                                .font(.title3)
                                .bold()
                            Text("Total Halte: \(numberOfStops(in: result, from: startStop, to: endStop))")
                            
                            Divider()
                            ForEach(routeSegment(in: result, from: startStop, to: endStop), id: \.self) { stop in
                                HStack {
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 8, height: 8)
                                    Text(stop)
                                }
                            }
                        }
                        .padding()
                    }
                } else if !startStop.isEmpty && !endStop.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.orange)
                            .padding(.top, 30)
                        Text("Sorry, route is unavailable")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }

                Spacer()
            }
            .navigationTitle("Find Best Route")
        }
    }

    func findBestRoute(from start: String, to end: String) -> Bus? {
        let candidates = items.compactMap { bus -> (Bus, Int)? in
            guard let startIndex = bus.route.firstIndex(of: start),
                  let endIndex = bus.route.firstIndex(of: end),
                  startIndex < endIndex else {
                return nil
            }
            let count = endIndex - startIndex
            return (bus, count)
        }

        return candidates.min(by: { $0.1 < $1.1 })?.0
    }

    func numberOfStops(in bus: Bus, from start: String, to end: String) -> Int {
        guard let startIndex = bus.route.firstIndex(of: start),
              let endIndex = bus.route.firstIndex(of: end) else {
            return 0
        }
        return abs(endIndex - startIndex) + 1
    }

    func routeSegment(in bus: Bus, from start: String, to end: String) -> [String] {
        guard let startIndex = bus.route.firstIndex(of: start),
              let endIndex = bus.route.firstIndex(of: end),
              startIndex < endIndex else {
            return []
        }
        return Array(bus.route[startIndex...endIndex])
    }
}



#Preview {
    SearchView()
}
