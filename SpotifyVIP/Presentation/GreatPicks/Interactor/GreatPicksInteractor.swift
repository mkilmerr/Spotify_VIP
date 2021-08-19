//
//  GreatPicksInteractor.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 18/08/21.
//

import Foundation

protocol GreatPicksInteractorInput: GreatPicksViewControllerOutput {}

protocol GreatPicksInteractorOutput {
    func presentGreatPicks(picks: Array<GreatPicksViewModel>)
}

class GreatPicksInteractor {
    let picks = [GreatPicksViewModel(image: CommonAssets.caetano), GreatPicksViewModel(image: CommonAssets.michael), GreatPicksViewModel(image: CommonAssets.eminem), GreatPicksViewModel(image: CommonAssets.madonna)]
    
    var output: GreatPicksInteractorOutput?
    
    init(output: GreatPicksInteractorOutput) {
        self.output = output
    }
}

extension GreatPicksInteractor: GreatPicksInteractorInput {
    func getGreatPicks() {
        output?.presentGreatPicks(picks: self.picks)
    }
}
