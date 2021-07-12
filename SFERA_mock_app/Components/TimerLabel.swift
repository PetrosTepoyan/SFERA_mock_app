//
//  TimerLabel.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit

class TimerLabel: UILabel {
	
	var minutes: Int!
	var seconds: Int!
	
	var isStopped: Bool {
		return minutes == 0 && seconds == 0
	}
	
	var remainingTimeInterval: TimeInterval {
		return TimeInterval(minutes * 60 + seconds)
	}
	
	func setupText(minutes: Int, seconds: Int) {
		self.minutes = minutes
		self.seconds = seconds
		
		updateText()
	}
	
	func updateTimeByOneSecond() {
		guard seconds != nil,
			  minutes != nil
		else { return }
		if seconds! == 0 {
			minutes! -= 1
			seconds! = 59
		} else {
			seconds! -= 1
		}
		
		updateText()
	}
	
	private func updateText() {
		
		guard minutes != nil,
			  seconds != nil
		else { return }
		
		let leadingMinuteZero = minutes < 10 ? "0" : ""
		let leadingSecondZero = seconds < 10 ? "0" : ""
		
		text = "\(leadingMinuteZero)\(minutes!):\(leadingSecondZero)\(seconds!)"
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
	
	
}
