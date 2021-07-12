//
//  MainViewController.swift
//  SFERA_mock_app
//
//  Created by Петрос Тепоян on 7/12/21.
//

import UIKit

class MainViewController: UIViewController {

	lazy var timerNameTextField: UITextField = {
		let l = UITextField()
		l.placeholder = "Название таймера"
		l.backgroundColor = .systemGray4
		l.layer.cornerRadius = 12
		l.leftViewMode = .always
		l.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		l.translatesAutoresizingMaskIntoConstraints = false
		return l
	}()
	
	lazy var timerDurationTextField: UITextField = {
		let l = UITextField()
		l.placeholder = "Время в секундах"
		l.backgroundColor = .systemGray4
		l.layer.cornerRadius = 12
		l.leftViewMode = .always
		l.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
		l.translatesAutoresizingMaskIntoConstraints = false
		return l
	}()
	
	lazy var addButton: UIButton = {
		let b = UIButton(type: .system)
		b.setTitle("Добавить", for: .normal)
		b.backgroundColor = .systemGray6
		b.layer.cornerRadius = 15
		b.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		b.translatesAutoresizingMaskIntoConstraints = false
		return b
	}()
	
	lazy var timerTable: UITableView = {
		let t = UITableView()
		t.translatesAutoresizingMaskIntoConstraints = false
		return t
	}()
	
	var timers: [TimerEntity] = [ ] {
		didSet {
			timers.sort { $0.duration > $1.duration }
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTimerTableView()
		setupSubviews()
		buttonSetup()
	}
	
	private func buttonSetup() {
		addButton.addTarget(self, action: #selector(addNewTimer), for: .touchUpInside)
	}
	
	@objc func addNewTimer(_ sender: UIButton) {
		guard let name = timerNameTextField.text,
			  let durationString = timerDurationTextField.text,
			  let duration = TimeInterval(durationString)
		else { return }
		let newTimerEntity = TimerEntity(name: name, duration: duration, isPaused: false)
		timers.append(newTimerEntity)
		timerTable.reloadData()
	}

	private func setupTimerTableView() {
		timerTable.register(TimerCell.self, forCellReuseIdentifier: "TimerCell")
		timerTable.dataSource = self
		timerTable.delegate = self
		timerTable.separatorStyle = .none
		timerTable.allowsSelection = false
	}
}

