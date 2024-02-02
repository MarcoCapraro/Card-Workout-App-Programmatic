//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Marco Capraro on 2/1/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var cardImageView   = UIImageView()
    var startStopButton = CWButton(config: .filled(), color: .red, title: "Stop!", systemImageName: "stop.circle")
    var restartButton   = CWButton(config: .filled(), color: .orange, title: "Restart", systemImageName: "arrow.clockwise.circle")
    var rulesButton     = CWButton(config: .filled(), color: .blue, title: "Rules", systemImageName: "list.bullet")
    
    var cards: [UIImage] = Deck.allValues
    var timer: Timer!
    var bShuffling: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        configureUI()
        
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        invalidateTimer()
    }
    
    func startTimer() {
        bShuffling = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(generateRandomCard), userInfo: nil, repeats: true)
    }
    
    func invalidateTimer() {
        bShuffling = false
        timer.invalidate()
    }
    
    @objc func generateRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(startStopButton)
        startStopButton.addTarget(self, action: #selector(startStopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            startStopButton.widthAnchor.constraint(equalToConstant: 260),
            startStopButton.heightAnchor.constraint(equalToConstant: 50),
            startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startStopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 25)
        ])
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: startStopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 15)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRuleDetailsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: startStopButton.trailingAnchor),
            rulesButton.centerYAnchor.constraint(equalTo: restartButton.centerYAnchor)
        ])
    }
    
    @objc func presentRuleDetailsVC() {
        present(RuleDetailsVC(), animated: true)
    }
    
    @objc func startStopTimer() {
        let backgroundColor = (!bShuffling) ? UIColor.systemRed : UIColor.systemGreen
        let title = (!bShuffling) ? "Stop!" : "Start!"
        let newImage = (!bShuffling) ? UIImage(systemName: "stop.circle") : UIImage(systemName: "play.circle")
        
        if(!bShuffling) {
            startTimer()
        } else {
            invalidateTimer()
        }
        
        // Change button (green background, text = Start!, image = Play
        startStopButton.configuration?.baseBackgroundColor = backgroundColor
        startStopButton.configuration?.title = title
        startStopButton.configuration?.image = newImage
        
    }
    
    @objc func restartTimer() {
        invalidateTimer()
        startTimer()
        
        // Change button (red background, text = Stop!, image = Stop
        startStopButton.configuration?.baseBackgroundColor = .systemRed
        startStopButton.configuration?.title = "Stop!"
        startStopButton.configuration?.image = UIImage(systemName: "stop.circle")
    }

}
