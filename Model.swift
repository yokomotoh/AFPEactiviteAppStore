//
//  Model.swift
//  AFPEactiviteAppStore
//
//  Created by vincent schmitt on 12/03/2021.
//

import Foundation


struct Application: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var appIcon: String
    var howToGet: HowToGet
}

struct HowToGet: Hashable, Identifiable {
    var id = UUID()
    var howToGetIcon: String
    var howToGetDescription: String
}

let cloud = HowToGet(howToGetIcon: "icloud.and.arrow.down", howToGetDescription: "")

let rmc = Application(name: "RMC Sport - Live TV, Replay", description: "Ligue des Champions en live", appIcon: "rmc", howToGet: cloud)

let applications = [rmc, rmc, rmc, rmc, rmc, rmc, rmc, rmc, rmc, rmc]

struct Journal: Hashable {
    //var id = UUID()
    var introduction: String
    var title: String
    var description: String
    var imageJounal: String
}

let welcomeOrginals = Journal(introduction: "Les Femmes à L'Honneur", title: "Welcome Originals", description: "Les conceils d'une cheffe étoilée ⭐️" , imageJounal: "homme")

let journals = [welcomeOrginals, welcomeOrginals, welcomeOrginals]


struct CategoryApplications: Hashable {
    var title: String
    var apps = [Application]()
}

let selectionSemaine = CategoryApplications(title: "La sélection de la semaine", apps: applications)

let categoriesApps = [selectionSemaine, selectionSemaine, selectionSemaine]

struct Profile {
    var name: String
    var profilePhoto: String
}

let myProfile = Profile(name: "Yoko", profilePhoto: "profil")
