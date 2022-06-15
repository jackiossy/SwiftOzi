//
//  Expense.swift
//  swiftuitest002
//
//  Created by jackiossy on 6/15/22.
//

import SwiftUI

// Mark: Expense model and sample date
struct Expense: Identifiable,Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String {
    case income = "income"
    case expense = "expense"
}

var sample_expenses: [Expense] = [
    Expense(id: "MagicKeyboard", remark: "99", amount: 99, date: Date(timeIntervalSince1970: 165287245), type: .expense, color: "Yellow"),
    Expense(id: "Food", remark: "99", amount: 19, date: Date(timeIntervalSince1970: 165287245), type: .expense, color: "Yellow"),
    Expense(id: "Trackpad2", remark: "99", amount: 99, date: Date(timeIntervalSince1970: 165287245), type: .expense, color: "Yellow")
]
