//
//  ViewController.swift
//  EquilateralTriangle
//
//  Created by Balamurugan A on 27/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let centerView = UIView(frame: CGRect(x: self.view.frame.width/2 - 200, y: self.view.frame.height/2 - 200, width: 400, height: 400))
        centerView.layer.backgroundColor = UIColor.clear.cgColor
        self.view.addSubview(centerView)
        drawTriangle(on: centerView, numberOfEquilateral: 3)
    }
    
    //MARK: - Draw Equilateral Triangle
    ///  This method help to draw equilateral triangle with squares
    /// - Parameters:
    ///   - view: UIView as parameter
    ///   - numberOfEquilateral: Int as number of equilateral Triangle
    func drawTriangle(on view: UIView, numberOfEquilateral: Int) {
        
        var mainFrame = view.frame //Main view frame
        
        var mainViewHeightWidth = view.frame.height
        
        var initialSquareStartPoint: CGFloat = 0
 
        var squareRect = CGRect(x: 0, y: 0, width: 400, height: 400) // Square rect
                
        var triangleCPoint = CGPoint(x: mainFrame.width / 2, y: 0) // Triangle center point
        
        for i in 1...numberOfEquilateral {
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0 + initialSquareStartPoint, y: mainFrame.width))
            path.addLine(to: triangleCPoint)
            path.addLine(to: CGPoint(x: mainViewHeightWidth + initialSquareStartPoint, y: mainFrame.width))
            path.close()
            
            let squareWidthHeight = mainViewHeightWidth / 2
            let xSquareStart = (mainFrame.width/2 - squareWidthHeight / 2)
            squareRect = CGRect(x: 0, y: squareWidthHeight, width: squareWidthHeight, height: squareWidthHeight)//Updating square rect
            initialSquareStartPoint = xSquareStart
            
            path.move(to: CGPoint(x: xSquareStart, y: mainFrame.width))
            path.addLine(to: CGPoint(x: xSquareStart, y: mainFrame.width - squareWidthHeight))
            path.addLine(to: CGPoint(x: xSquareStart + squareWidthHeight, y: mainFrame.width - squareWidthHeight))
            path.addLine(to: CGPoint(x: xSquareStart + squareWidthHeight, y: mainFrame.width))
            path.close()
            
            let centerX = xSquareStart + (squareWidthHeight/2)
            let centerY = mainFrame.width - squareWidthHeight
            triangleCPoint = CGPoint(x: centerX, y: centerY) //Updating triangle center point
            
            let shape = CAShapeLayer()
            shape.path = path.cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            
            
            view.layer.addSublayer(shape)
            mainViewHeightWidth = squareRect.width //Updating view width
        }
        
    }
}

