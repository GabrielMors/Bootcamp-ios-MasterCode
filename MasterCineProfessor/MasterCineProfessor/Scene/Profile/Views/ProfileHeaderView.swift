//
//  ProfileHeaderView.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//

import SwiftUI

struct ProfileHeaderView: View {

    let profile: ProfileModel

    var body: some View {
        VStack(spacing: 0) {
            coverView

            profileCard
                .padding(.horizontal, 20)
                .offset(y: -70)
                .padding(.bottom, -50)
        }
    }

    private var coverView: some View {
        ZStack(alignment: .top) {
            LinearGradient(
                colors: [
                    Color.blue,
                    Color.purple,
                    Color.indigo
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(height: 220)
            .clipShape(
                RoundedCorner(
                    radius: 36,
                    corners: [.bottomLeft, .bottomRight]
                )
            )

            HStack {
                Text("Meu Perfil")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)

                Spacer()

                Button {
                    print("Settings tapped")
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                        .background(Color.white.opacity(0.18))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 64)
        }
    }

    private var profileCard: some View {
        VStack(spacing: 12) {
            profileImage

            VStack(spacing: 6) {
                HStack(spacing: 6) {
                    Text(profile.name)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)

                    if profile.isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.blue)
                    }
                }

                Text(profile.username)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.secondary)

                Text(profile.occupation)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.blue)
            }

            Text(profile.bio)
                .font(.system(size: 15))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(2)
                .padding(.horizontal, 24)

            ratingView
        }
        .padding(.top, 22)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .shadow(color: .black.opacity(0.08), radius: 18, x: 0, y: 8)
    }

    private var profileImage: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(systemName: profile.profileImageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 96, height: 96)
                .background(Color(.systemBackground))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(.systemBackground), lineWidth: 5)
                )
                .shadow(color: .black.opacity(0.18), radius: 14, x: 0, y: 8)

            Button {
                print("Edit photo tapped")
            } label: {
                Image(systemName: "camera.fill")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(.systemBackground), lineWidth: 3)
                    )
            }
        }
    }

    private var ratingView: some View {
        HStack(spacing: 6) {
            Image(systemName: "star.fill")
                .font(.system(size: 14))
                .foregroundColor(.yellow)

            Text(String(format: "%.1f", profile.rating))
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.primary)

            Text("avaliação média")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(Color.yellow.opacity(0.14))
        .clipShape(Capsule())
    }
}
