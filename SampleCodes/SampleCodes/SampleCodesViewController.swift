//
//  ViewController.swift
//  SampleCodes
//
//  Created by 伊志嶺朝輝 on 2019/04/28.
//  Copyright © 2019 TomRock. All rights reserved.
//

import UIKit

class SampleCodesViewController: BaseViewController ,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
	
	let sampleCodesLayoutColNum:CGFloat = 3.0
	let sampleCodesLayoutMargin:CGFloat = 5.0
	
	@IBOutlet weak var sampleCodesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
		Logger.info()
		self.title = "Sample Codes"
		sampleCodesCollectionView.delegate = self
		sampleCodesCollectionView.dataSource = self
		sampleCodesCollectionView.register(SampleCodeCell.self, forCellWithReuseIdentifier: SampleCodeCell.SampleCodeCellIdentifer)
		
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let cellWidth = (collectionView.frame.width - sampleCodesLayoutMargin)/sampleCodesLayoutColNum - sampleCodesLayoutMargin
        let collectionViewCellSize = CGSize(width: cellWidth,
											height: cellWidth)
		Logger.info("collectionViewCellSize : \(collectionViewCellSize)")
        return collectionViewCellSize
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		Logger.debug("Set Cell num to 3")
		return 30
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = sampleCodesCollectionView.dequeueReusableCell(withReuseIdentifier: SampleCodeCell.SampleCodeCellIdentifer, for: indexPath)
		Logger.debug("\(cell)")
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: sampleCodesLayoutMargin,
							left: sampleCodesLayoutMargin,
							bottom: sampleCodesLayoutMargin,
							right: sampleCodesLayoutMargin)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return sampleCodesLayoutMargin
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return sampleCodesLayoutMargin
	}
}

