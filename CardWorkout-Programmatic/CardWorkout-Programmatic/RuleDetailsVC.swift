//
//  RuleDetailsVC.swift
//  CardWorkout-Programmatic
//
//  Created by Marco Capraro on 2/1/24.
//

import UIKit

class RuleDetailsVC: UIViewController {
    
    var doneButton      = CWButton()
    let titleLabel      = UILabel()
    let rulesLabel      = UILabel()
    let exerciseLabel   = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureDoneButton()
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    func configureDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
        view.addSubview(doneButton)
        doneButton.addTarget(self, action: #selector(dismissRuleDetailsVC), for: .touchUpInside)


        NSLayoutConstraint.activate([
            doneButton.widthAnchor.constraint(equalToConstant: 100),
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            doneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        ])
    }
    
    func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Rules"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureRulesLabel() {
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.text = "The value of each card represents the number of exercises you do.\n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLabel.textAlignment = .center
        rulesLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        rulesLabel.lineBreakMode = .byWordWrapping
        rulesLabel.numberOfLines = 0
        view.addSubview(rulesLabel)
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExerciseLabel() {
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseLabel.text = "♠️ = Push-Ups\n\n❤️ = Sit-Ups\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exerciseLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        exerciseLabel.numberOfLines = 0
        view.addSubview(exerciseLabel)
        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 50),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func dismissRuleDetailsVC() {
        dismiss(animated: true)
    }

}
