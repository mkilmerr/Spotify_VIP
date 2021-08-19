//
//  GreatPicksPresenter.swift
//  SpotifyVIP
//
//  Created by Marcos Kilmer Pereira de Aquino on 18/08/21.
//

import Foundation

protocol GreatPicksPresenterInput: GreatPicksInteractorOutput {}

protocol GreatPicksPresenterOutput {
    func displayPicks(picks: Array<GreatPicksViewModel>)
}

class GreatPicksPresenter {
    var output: GreatPicksPresenterOutput?
    
    init(output: GreatPicksPresenterOutput) {
        self.output = output
    }
}

extension GreatPicksPresenter: GreatPicksPresenterInput {
    func presentGreatPicks(picks: Array<GreatPicksViewModel>) {
        output?.displayPicks(picks: picks)
    }
}
