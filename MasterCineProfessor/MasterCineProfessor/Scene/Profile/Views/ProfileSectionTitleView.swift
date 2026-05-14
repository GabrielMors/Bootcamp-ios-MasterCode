//
//  ProfileSectionTitleView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import SwiftUI

struct ProfileSectionTitleView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}