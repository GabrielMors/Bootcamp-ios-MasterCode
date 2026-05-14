//
//  ProfileStatCardView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import SwiftUI

struct ProfileStatCardView: View {
    
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 42, height: 42)
                .background(Color.blue.opacity(0.12))
                .clipShape(Circle())
            
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
            
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 18)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 6)
    }
}