//
//  ProfileInfoCardView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import SwiftUI

struct ProfileInfoCardView: View {
    
    let profile: ProfileModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ProfileSectionTitleView(title: "Informações")
                .padding(.horizontal, 0)
            
            VStack(spacing: 14) {
                infoRow(
                    icon: "envelope.fill",
                    title: "E-mail",
                    value: profile.email
                )
                
                Divider()
                
                infoRow(
                    icon: "phone.fill",
                    title: "Telefone",
                    value: profile.phone
                )
                
                Divider()
                
                infoRow(
                    icon: "location.fill",
                    title: "Localização",
                    value: profile.location
                )
                
                Divider()
                
                infoRow(
                    icon: "briefcase.fill",
                    title: "Profissão",
                    value: profile.occupation
                )
            }
            .padding(18)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 6)
        }
        .padding(.horizontal, 20)
    }
    
    private func infoRow(
        icon: String,
        title: String,
        value: String
    ) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 38, height: 38)
                .background(Color.blue.opacity(0.12))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.secondary)
                
                Text(value)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
    }
}