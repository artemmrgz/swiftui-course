//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Artem Marhaza on 13/11/2023.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Checkout") {
                    CheckoutView(order: order)
                }
            }
            .disabled(!order.hasValidAddress)
        }
    }
}

#Preview {
    AddressView(order: Order())
}
