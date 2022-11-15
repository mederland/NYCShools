//
//  BackButton.swift
//  Hospice
//
//  Created by Nicky Taylor on 10/24/22.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 26))
                    Text("Back")
                        .font(.system(size: 20))
                }
                .foregroundColor(.blue)
            }
            Spacer()
            
        }
        .padding(.leading, 24)
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton() { }
    }
}
