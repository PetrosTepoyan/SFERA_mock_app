//
//  Main+TableDelegate.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
}
