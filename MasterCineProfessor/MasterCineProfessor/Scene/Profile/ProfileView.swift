//
//  ProfileView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import SwiftUI

struct ProfileView: View {

    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                ProfileHeaderView(profile: viewModel.profile)

                statsSection

                badgesSection

                ProfileInfoCardView(profile: viewModel.profile)

                actionsSection

                logoutButton
            }
            .padding(.bottom, 32)
        }
        .background(Color(.systemGroupedBackground))
        .ignoresSafeArea(edges: .top)
    }

    private var statsSection: some View {
        HStack(spacing: 12) {
            ProfileStatCardView(
                title: "Posts",
                value: "\(viewModel.profile.postsCount)",
                icon: "doc.text.fill"
            )
            
            ProfileStatCardView(
                title: "Seguidores",
                value: "\(viewModel.profile.followersCount)",
                icon: "person.2.fill"
            )
            
            ProfileStatCardView(
                title: "Seguindo",
                value: "\(viewModel.profile.followingCount)",
                icon: "person.badge.plus.fill"
            )
        }
        .padding(.horizontal, 20)
    }
    
    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            ProfileSectionTitleView(title: "Conquistas")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.profile.badges) { badge in
                        ProfileBadgeView(badge: badge)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    
    private var actionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            ProfileSectionTitleView(title: "Conta")
            
            VStack(spacing: 12) {
                ForEach(viewModel.profile.actions) { action in
                    ProfileActionRowView(action: action)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var logoutButton: some View {
        Button {
            print("Logout tapped")
        } label: {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Sair da Conta")
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundColor(.red)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.red.opacity(0.08))
            .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    ProfileView()
}
