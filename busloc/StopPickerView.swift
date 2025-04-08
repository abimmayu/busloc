//
//  StopPickerView.swift
//  busloc
//
//  Created by Atilla Rizkyara on 08/04/25.
//
import SwiftUI

struct StopPickerView: View {
    @Binding var selectedStop: String
    var allStops: [String]

    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""

    var filteredStops: [String] {
        if searchText.isEmpty {
            return allStops
        } else {
            return allStops.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        List {
            ForEach(filteredStops, id: \.self) { stop in
                Button(action: {
                    selectedStop = stop
                    dismiss()
                }) {
                    Text(stop)
                }
            }
        }
        .searchable(text: $searchText, prompt: "Cari halte...")
        .navigationTitle("Pilih Halte")
    }
}

