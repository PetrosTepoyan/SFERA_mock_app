//
//  Main+TableDataSource.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return timers.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = timerTable.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath) as! TimerCell
		cell.indexPath = indexPath
		cell.bind(timers[indexPath.row])
		cell.delegate = self
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard section == 0 else { return nil }
		return "Таймеры"
	}
}
