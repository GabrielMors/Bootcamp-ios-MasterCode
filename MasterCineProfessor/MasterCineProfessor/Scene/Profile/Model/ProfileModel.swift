//
//  ProfileModel.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//


import Foundation

struct ProfileModel {
    let name: String
    let username: String
    let email: String
    let phone: String
    let location: String
    let occupation: String
    let bio: String
    let profileImageName: String
    let coverImageName: String
    let isVerified: Bool
    let rating: Double
    let postsCount: Int
    let followersCount: Int
    let followingCount: Int
    let badges: [ProfileBadge]
    let actions: [ProfileAction]
}

struct ProfileBadge: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}

struct ProfileAction: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
}
