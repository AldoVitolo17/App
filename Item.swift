//
//  Item.swift
//  Prove
//
//  Created by Aldo Vitolo on 20/10/23.
//

import Foundation
import SwiftUI

    struct Item: Identifiable {
        let id = UUID()
        var itemName: String
        var itemImage: String
    }
