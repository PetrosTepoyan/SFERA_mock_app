//
//  MainLayout.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

extension MainViewController {
	func setupSubviews() {
		view.addSubview(timerNameTextField)
		view.addSubview(timerDurationTextField)
		view.addSubview(addButton)
		view.addSubview(timerTable)
		
		NSLayoutConstraint.activate([
			
			/// timerNameLabel
			timerNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			timerNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			timerNameTextField.heightAnchor.constraint(equalToConstant: 44),
			timerNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			
			/// timerDurationLabel
			timerDurationTextField.heightAnchor.constraint(equalToConstant: 44),
			timerDurationTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			timerDurationTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
			timerDurationTextField.topAnchor.constraint(equalTo: timerNameTextField.bottomAnchor, constant: 10),
			
			/// addButton
			addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
			addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
			addButton.topAnchor.constraint(equalTo: timerDurationTextField.bottomAnchor, constant: 10),
			addButton.heightAnchor.constraint(equalToConstant: 60),
			
			/// timerTable
			timerTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			timerTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			timerTable.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
			timerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}
