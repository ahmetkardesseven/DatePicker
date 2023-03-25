//
//  StackView4.swift
//  DatePickerAralik
//
//  Created by ahmet kardesseven on 24.03.2023.
//

import SwiftUI

struct StackView4: View {
    @State var startDate = Date()
       @State var endDate = Date()
    var maxDate: Date {
            return Calendar.current.date(byAdding: .day, value: 32, to: startDate)!
        }
        var minDate: Date {
            return Date()
        }
    
    var body: some View {
        VStack {
                    Text("Başlangıç Tarihi")
                    DatePicker(
                        "",
                        selection: $startDate,
                        in: minDate...,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .labelsHidden()
                    .padding(.bottom, 8)
                    
                    Text("Bitiş Tarihi")
                    DatePicker(
                        "",
                        selection: $endDate,
                        in: startDate...maxDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .labelsHidden()
                }
                .padding()
                .onChange(of: startDate, perform: { _ in
                    endDate = maxDate
                })
    }
}

struct StackView4_Previews: PreviewProvider {
    static var previews: some View {
        StackView4()
    }
}
