//
//  Main+TimerCellDelegate.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

extension MainViewController: TimerCellDelegate {
	func updateTimerInterval(forCellAt indexPath: IndexPath, entity: TimerEntity) {
		let ind = indexPath.row
		guard ind <= timers.count - 1 else { return }
		if entity.duration == 0 {
			timers.remove(at: ind)
			timerTable.reloadData()
		} else {
			timers[ind].duration = entity.duration
			timers[ind].isPaused = entity.isPaused
		}
	}
}
