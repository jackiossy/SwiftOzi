//
//  ExpenseViewModel.swift
//  swiftuitest002
//
//  Created by jackiossy on 6/15/22.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = sample_expenses
}

