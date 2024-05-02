//
//  ListButton.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 5/1/24.
//

import Foundation
import SwiftUI

struct ListButton: View {
    var name: String
    var backgroundColor: Color

    var body: some View {
        HStack(alignment: .center) {
            Text(name)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .cornerRadius(13)
        .padding(.all, 24)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ListButton(name: "Testing", backgroundColor: .green)
}
