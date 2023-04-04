//
//  StackView6.swift
//  DatePickerAralik
//
//  Created by ahmet kardesseven on 4.04.2023.
//

import SwiftUI

struct StackView7: View {
    
    @State private var selectedDates: Set<DateComponents> = []
    @State private var formattedDates: String = ""
    
    let formatter = DateFormatter()
    let fromDate = Date()
    let toDate = Calendar.current.date(byAdding: .day, value: 32, to: Date())!
    
    var body: some View {
        VStack {
            Text("DevTechie!")
                .font(.largeTitle)
                .foregroundColor(.primary)
            MultiDatePicker("Travel Dates", selection: $selectedDates, in: fromDate..<toDate)
                .frame(height: 300)
                .onChange(of: selectedDates, perform: { _ in
                    formatSelectedDates()
                })
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Text(formattedDates)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button("Paylaş") {
                share()
            }
            .padding()
        }
        .padding()
    }
    
    private func formatSelectedDates() {
        formatter.dateFormat = "MMM-dd-YY"
        let dates = selectedDates
            .compactMap { date in
                Calendar.current.date(from: date)
            }
            .map { date in
                formatter.string(from: date)
            }
        formattedDates = dates.joined(separator: "\n")
    }
    
    private func share() {
        let shareText = "Seçili tarihler:\n\(formattedDates)"
        let avc = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(avc, animated: true, completion: nil)
    }
}

struct StackView7_Previews: PreviewProvider {
    static var previews: some View {
        StackView7()
    }
}
