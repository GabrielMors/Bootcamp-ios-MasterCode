//
//  ProfileBadgeView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import SwiftUI

struct ProfileBadgeView: View {
    
    let badge: ProfileBadge
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: badge.icon)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
            
            Text(badge.title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            LinearGradient(
                colors: [
                    Color.blue,
                    Color.purple
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(Capsule())
        .shadow(color: .blue.opacity(0.18), radius: 8, x: 0, y: 5)
    }
}