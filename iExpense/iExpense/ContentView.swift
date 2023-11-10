//
//  ContentView.swift
//  iExpense
//
//  Created by Artem Marhaza on 10/11/2023.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in // Loop through our items in the expenses class instance
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(item.amount < 10 ? .green : item.amount < 100 ? .yellow : .red)
                }
            }
            .onDelete(perform: deleteItems) // Used to delete a row
        }
    }
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decoded
                return
            }
        }
        items = []
    }
    
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal"}
    }
    
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business"}
    }
}

struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItem)
                
                ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) { // function used to delete items in our list
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItem(at offset: IndexSet) {
        removeItems(at: offset, in: expenses.personalItems)
    }
    
    func removeBusinessItem(at offset: IndexSet) {
        removeItems(at: offset, in: expenses.businessItems)
    }
    
    func setColor(amount: Double) -> Color {
        let color: Color
        
        switch amount {
        case 0...10: color = .green
        case 10...100: color = .yellow
        default: color = .red
        }
        
        return color
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
