//
//  TrainingViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct TrainingRound {
    let respiration: Int;
    let apnea: Int;
}

struct CO2TrainingCell {
    let round: Int
    let interval: TimeInterval
}

class CO2TrainingViewModel {
    var rows: [CO2TrainingCell] = [];

    init(rounds: Int,
        forApneaTime apneaTime: Int,
        startingFromRespirationTime startTime: Int,
        withRespirationDecreaseTime decreseTime: Int) {
    
        for round in 1...rounds {
            rows.append(CO2TrainingCell(round: round, interval: TimeInterval(startTime - (decreseTime * (round-1) ))))
            rows.append(CO2TrainingCell(round: round, interval: TimeInterval(apneaTime)))
        }
    }
    
    func count() -> Int {
        return rows.count
    }
    
    func getInterval(forRound row: Int) -> TimeInterval {
        return rows[row].interval
    }
}
