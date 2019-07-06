//
//  TutorialSampleViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/05/02.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class TutorialSampleViewController: UIViewController {

	@IBOutlet weak var nextButton: UIButton!
	
	@IBOutlet weak var tutorialStartButton: UIButton!
	
	private let hollowedOutView = HollowedOutView()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		

	}
	
	override func viewDidLayoutSubviews() {
		hollowedOutView.frame = self.view.frame
		
		hollowedOutView.hollowRect = tutorialStartButton.frame
		
		self.view.addSubview(hollowedOutView)
	}

	@IBAction func tapTutorialStartButton(_ sender: Any) {
		hollowedOutView.hollowRect = nextButton.frame
	}
}
