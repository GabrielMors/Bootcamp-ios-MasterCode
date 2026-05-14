//
//  ProfileViewModel.swift
//  MasterCine
//
//  Created by Caio Fabrini on 13/05/26.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileModel
    
    init() {
        self.profile = ProfileModel(
            name: "Caio Fabrini",
            username: "@caiofabrini07",
            email: "caiofabrini07@gmail.com",
            phone: "+55 16 99999-9999",
            location: "Ribeirão Preto, SP",
            occupation: "iOS Developer",
            bio: "Desenvolvedor iOS apaixonado por criar experiências modernas, performáticas e bem estruturadas.",
            profileImageName: "person.crop.circle.fill",
            coverImageName: "profile_cover",
            isVerified: true,
            rating: 4.9,
            postsCount: 128,
            followersCount: 2450,
            followingCount: 312,
            badges: [
                ProfileBadge(title: "SwiftUI", icon: "swift"),
                ProfileBadge(title: "MVVM", icon: "square.stack.3d.up.fill"),
                ProfileBadge(title: "Top Dev", icon: "star.fill"),
                ProfileBadge(title: "Mentor", icon: "graduationcap.fill")
            ],
            actions: [
                ProfileAction(
                    title: "Editar Perfil",
                    subtitle: "Atualize suas informações pessoais",
                    icon: "person.crop.circle.badge.pencil"
                ),
                ProfileAction(
                    title: "Meus Projetos",
                    subtitle: "Veja seus apps e trabalhos publicados",
                    icon: "folder.fill"
                ),
                ProfileAction(
                    title: "Favoritos",
                    subtitle: "Acesse seus itens salvos",
                    icon: "heart.fill"
                ),
                ProfileAction(
                    title: "Notificações",
                    subtitle: "Gerencie seus alertas e avisos",
                    icon: "bell.fill"
                ),
                ProfileAction(
                    title: "Configurações",
                    subtitle: "Preferências da sua conta",
                    icon: "gearshape.fill"
                ),
                ProfileAction(
                    title: "Segurança",
                    subtitle: "Senha, autenticação e privacidade",
                    icon: "lock.shield.fill"
                )
            ]
        )
    }
}
