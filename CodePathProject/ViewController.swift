//
//  ViewController.swift
//  CodePathProject
//
//  Created by Jamal Nezianya on 1/19/25.
//

import UIKit

class ViewController: UIViewController {
    var  clickCount = 0
    
    @IBOutlet weak var changeLabelText: UILabel!
    @IBOutlet var labels: [UILabel]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        clickCount += 1
        let isFill = clickCount % 3 == 0
        let randomColor = changeColor(fill: isFill)
        view.backgroundColor = randomColor

        sender.setTitleColor(randomColor, for: .normal)

        // Change only one label
        changeLabelText.textColor = randomColor
        changeLabelText.backgroundColor = isFill ? randomColor.withAlphaComponent(0.3) : UIColor.clear
    }
    
    func changeLabelText(with color: UIColor, isFill: Bool) {
            guard let labels = labels, !labels.isEmpty else {
                print("Labels array is nil or empty!")
                return
            }

            for label in labels {
                label.textColor = color
                label.backgroundColor = isFill ? color.withAlphaComponent(0.3) : UIColor.clear
            }
        }
    
    func changeColor(fill: Bool) -> UIColor{

            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)
            let alpha: CGFloat = fill ? 1.0 : 0.5

            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
    
}

