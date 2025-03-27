//
//  BusStopList.swift
//  Bus-Loc
//
//  Created by Atilla Rizkyara on 07/04/25.
//
import SwiftUI

struct BusStopList: View {
    let rute: Int

    var stops: [String] {
        switch rute {
        case 1:
            return [
                "Intermoda", "Cosmo", "Verdant View", "Eternity", "Simplicity 2", "Edutown 1", "Edutown 2",
                "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5", "GOP 1", "SML Plaza", "The Breeze",
                "CBD Timur 1", "CBD Timur 2", "Nava Park 1", "SWA 2", "Giant", "Eka Hospital 1", "Puspitaloka",
                "Polsek Serpong", "Ruko Madrid", "Pasar Modern Timur", "Griya Loka 1", "Sektor 1.3", "Griya Loka 2",
                "Santa Ursula 1", "Santa Ursula 2", "Sentra Onderdil", "Autoparts", "Eka Hospital 2", "East Business District",
                "SWA 1", "Greencove", "The Breeze", "CBD Timur 1", "CBD Selatan 1", "AEON Mall 1", "CBD Barat 2",
                "Simpilicity 1", "Cosmo", "Verdant View", "Intermoda", "Icon Business Park", "Masjid Al-Ukhuwah",
                "Divena & Deshna", "Avani", "Amarilla", "Chadnya", "Atmajaya", "Intermoda"
            ]
        case 2:
            return [
                "Greenwich Park Office", "Jadeite", "De Maja", "De Heliconia 2", "De Nara", "De Park 2", "Nava Park 2",
                "Giardina", "Collinare", "Foglio", "Studento 2", "Albera", "Foresta 1", "GOP 1", "SML Plaza", "The Breeze",
                "CBD Timur 1", "CBD Timur 2", "Nava Park 1", "SWA 2", "Giant", "Eka Hospital 1", "Puspitaloka",
                "Polsek Serpong", "Ruko Madrid", "Pasar Modern Timur", "Griya Loka 1", "Sektor 1.3", "Griya Loka 2",
                "Santa Ursula 1", "Santa Ursula 2", "Sentra Onderdil", "Autoparts", "Eka Hospital 2", "East Business District",
                "SWA 1", "Greencove", "The Breeze", "CBD Timur 1", "CBD Timur 2", "Simpang Foresta", "Allevare", "Fiore",
                "Studento 1", "Naturale", "Fresco", "Primavera", "Foresta 2", "FBL 5", "Courts Mega Store", "Q BIG 1",
                "Lulu", "Greenwich Park 1"
            ]
        case 3:
            return [
                "Intermoda", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5",
                "EPICON", "Gramedia", "Astra", "Courts Mega Store", "Q BIG 1", "Lulu", "Greenwich Park 1", "Jadeite",
                "De Maja", "De Heliconia 2", "De Nara", "De Park 2", "Nava Park 2", "GOP 1", "Giardina", "Collinare", "Foglio",
                "Studento 2", "Albera", "Foresta 1", "GOP 1", "SML Plaza", "The Breeze", "Casa De Parco 2", "B M C",
                "Digital Hub 1", "Digital Hub 2", "Verdant View", "Eternity", "Intermoda"
            ]
        case 4:
            return [
                "Intermoda", "Icon Centro", "Horizon Broadway", "Extreme Park", "Saveria", "Casa De Parco 1", "SML Plaza",
                "The Breeze", "CBD Timur 1", "CBD Selatan 1", "AEON Mall 1", "CBD Timur 2", "Simpang Foresta", "Allevare",
                "Fiore", "Studento 1", "Naturale", "Fresco", "Primavera", "Foresta 2", "De Park 1", "De Frangpani",
                "De Heliconia 1", "De Brassia", "Jadeite", "Greenwich Park 2", "Q Big 2", "Q Big 3", "BCA", "FBL 2", "FBL 1",
                "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5", "CBD Barat 1", "CBD Barat 2", "Simplicity 1", "Intermoda"
            ]
        case 5:
            return [
                "The Breeze", "CBD Timur 1", "CBD Selatan 1", "Lobby AEON", "AEON Mall 2", "CBD Utara 3", "ICE 1", "ICE 2",
                "ICE Business Park", "ICE 6", "ICE 5", "CBD Barat 1", "CBD Barat 2", "Lobby AEON", "AEON Mall 2",
                "CBD Timur 2", "Nava Park 1", "Greencove", "The Breeze"
            ]
        case 7:
            return [
                "Intermoda", "Simplicity 2", "Edutown 1", "Edutown 2", "ICE 1", "ICE 2", "ICE Business Park", "ICE 6", "ICE 5",
                "EPICON", "Gramedia", "Astra", "Courts Mega Store", "Q BIG 1", "Lulu", "Q Big 2", "Q Big 3", "BCA", "FBL 2",
                "FBL 1", "GOP 1", "SML Plaza", "The Breeze", "Casa De Parco 2", "B M C", "Digital Hub 1", "Saveria",
                "Casa De Parco 1", "CBD Timur 1", "CBD Selatan 1", "Lobby AEON", "AEON Mall 1", "AEON Mall 2", "CBD Barat 2",
                "Simplicity 1", "Intermoda"
            ]
        default:
            return []
        }
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    ForEach(stops.indices, id: \.self) { index in
                        let stop = stops[index]
                        
                        if index == stops.count - 1 {
                            BusStopLast(stopName: stop)
                        } else {
                            BusStopDefault(stopName: stop)
                        }
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(.leading, 50)
            .padding(.bottom, 20)
        }
        .navigationTitle("Rute \(rute)")
        .navigationBarTitleDisplayMode(.inline)
            }
        }
#Preview {
    ContentView()
}
