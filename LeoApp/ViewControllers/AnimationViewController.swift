
import UIKit

class AnimationViewController: UIViewController{
    
    var funcCount = [changeColor, moveRectangleToAngle, cornerRadius, turnOn180, hiddenRectangle, rotationRepite]
    
    var currentIndex = 0
    
    //MARK: IBOutlet
    
    @IBOutlet weak var rectView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       changeColor()
    }
    
    //MARK: IBAction
    
    @IBAction func nextButton(_ sender: Any) {
    
        self.rectView.layer.removeAllAnimations()
        if currentIndex < funcCount.count-1{
            currentIndex += 1
        
        }
        if currentIndex == 0{
        countLabel.text = "1"
            changeColor()
            
        }
        if currentIndex == 1{
            countLabel.text = "2"
            moveRectangleToAngle()
            
        }
        if currentIndex == 2{
            countLabel.text = "3"
            cornerRadius()
            
        }
        if currentIndex == 3{
            countLabel.text = "4"
            turnOn180()
        }
        if currentIndex == 4{
            countLabel.text = "5"
            hiddenRectangle()
        }
        if currentIndex == 5{
            countLabel.text = "6"
            rotationRepite()
        }
    }
            
    
    
    

    @IBAction func backButton(_ sender: Any) {
        self.rectView.layer.removeAllAnimations()
        if currentIndex > 0{
            currentIndex += -1
        }
        if currentIndex == 0{
        countLabel.text = "1"
            changeColor()
            
        }
        if currentIndex == 1{
            countLabel.text = "2"
            moveRectangleToAngle()
            
        }
        if currentIndex == 2{
            countLabel.text = "3"
            cornerRadius()
            
        }
        if currentIndex == 3{
            countLabel.text = "4"
            turnOn180()
        }
        if currentIndex == 4{
            countLabel.text = "5"
            hiddenRectangle()
        }
        if currentIndex == 5{
            countLabel.text = "6"
            rotationRepite()
        }
    }
    
    //MARK: FUNC OF ANIMATION
    
    func changeColor(){
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                       self.rectView.backgroundColor = .systemYellow
         },            completion: { _ in self.rectView.backgroundColor = .purple
    })
}
    
    func moveRectangleToAngle(){
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
                        self.rectView.frame = CGRect(x: 210, y: 30, width: 100, height: 100)
                       }, completion: {
                        _ in self.rectView.frame = CGRect(x: 107, y: 72, width: 200, height: 200)
                       })
    }
    
    func cornerRadius(){
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: {
                        self.rectView.layer.cornerRadius = self.rectView.frame.size.width / 2
                       },
                       completion: {
                        _ in self.rectView.layer.cornerRadius = 1
                       })
    }
    
    func turnOn180(){
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                       self.rectView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                       })
    }
    
    func hiddenRectangle(){
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.rectView.alpha = 0
                       },
                       completion: {
                        _ in self.rectView.alpha = 1
                       })
     }
    
    func rotationRepite(){
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat(Double.pi * 2)
        rotationAnimation.duration = 1
        rotationAnimation.repeatCount = .infinity
        self.rectView.layer.add(rotationAnimation, forKey: "spinAnimation")
    }
 }

