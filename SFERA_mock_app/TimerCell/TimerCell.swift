//
//  TimerCell.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import Foundation
import UIKit


protocol TimerCellDelegate: AnyObject {
	func updateTimerInterval(forCellAt indexPath: IndexPath, entity: TimerEntity)
}

class TimerCell: UITableViewCell {
	
	lazy var stackView: UIStackView = {
		let s = UIStackView()
		s.axis = .horizontal
		s.spacing = 10
		s.translatesAutoresizingMaskIntoConstraints = false
		return s
	}()
	
	lazy var timerNameLabel: UILabel = UILabel()
	
	lazy var pauseButton: UIButton = {
		let b = UIButton(type: .system)
		b.setTitle("Пауза", for: .normal)
		b.setTitleColor(.white, for: .normal)
		b.backgroundColor = .systemBlue
		b.layer.cornerRadius = 6
		b.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		return b
	}()
	
	lazy var remainingTimeLabel: TimerLabel = {
		let l = TimerLabel()
		l.textAlignment = .center
		return l
	}()
	
	var timer: Timer!
	
	var indexPath: IndexPath!
	weak var delegate: TimerCellDelegate?
	private var timerEntity: TimerEntity!
	
	var isTimerStopped: Bool! {
		didSet {
			timerEntity.isPaused = isTimerStopped
			
			delegate?.updateTimerInterval(forCellAt: indexPath,
										  entity: timerEntity)
			
			pauseButton.setTitle(isTimerStopped ? "Продолжить" : "Пауза", for: .normal)
			
			if isTimerStopped {
				timer.invalidate()
			} else {
				guard !timer.isValid else { return }
				setupTimer()
			}
			
			
		}
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupTimer()
		setupSubviews()
		setupPauseButton()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func bind(_ timerEntity: TimerEntity) {
		self.timerEntity = timerEntity
		
		timerNameLabel.text = timerEntity.name
		isTimerStopped = timerEntity.isPaused
		
		let wholeMinutes: Int = Int(timerEntity.duration / 60)
		let seconds: Int = Int(timerEntity.duration) % 60
		
		remainingTimeLabel.setupText(minutes: wholeMinutes, seconds: seconds)
		
	}
	
	/// Timer label setup
	private func setupTimer() {
		timer = Timer.scheduledTimer(timeInterval: 1.0,
									 target: self,
									 selector: #selector(updateTimerLabel),
									 userInfo: nil,
									 repeats: true)
	}
	
	@objc func updateTimerLabel() {
		guard !remainingTimeLabel.isStopped else {
			timer.invalidate()
			return
		}
		remainingTimeLabel.updateTimeByOneSecond()
		timerEntity.duration = remainingTimeLabel.remainingTimeInterval
		delegate?.updateTimerInterval(forCellAt: indexPath,
									  entity: timerEntity)
	}
	
	/// Button setup
	private func setupPauseButton() {
		pauseButton.addTarget(self,
							  action: #selector(pauseButtonTouchUpInside),
							  for: .touchUpInside)
	}
	
	@objc private func pauseButtonTouchUpInside() {
		isTimerStopped.toggle()
	}
}
