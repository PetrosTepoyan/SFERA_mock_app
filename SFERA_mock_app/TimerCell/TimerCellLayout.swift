//
//  TimerCellLayout.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

extension TimerCell {
	func setupSubviews() {
		self.contentView.addSubview(stackView)
		stackView.addArrangedSubview(timerNameLabel)
		stackView.addArrangedSubview(pauseButton)
		stackView.addArrangedSubview(remainingTimeLabel)
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -20),
			stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			pauseButton.widthAnchor.constraint(equalToConstant: 100),
			pauseButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
		
		remainingTimeLabel.sizeToFit()
	}
}
