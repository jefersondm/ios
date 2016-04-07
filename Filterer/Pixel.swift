import Foundation
import UIKit

//This class is responsible by the conversion of an UIImage to RGBA
//and provide to the other classes relevant pieces of information
//to apply the filters
public class PixelInfo {
    
    private var redAvgPixel:Int = 0
    private var greenAvgPixel:Int = 0
    private var blueAvgPixel:Int = 0
    private var alphaAvarage:Int = 0
    
    private var inRgb:RGBAImage
    
    required public init (xImage:UIImage){
        
    self.inRgb = RGBAImage(image:xImage)!
    defineAvarages()
        
    }
    
    
    
    //method to count the amount of pixels of each color
    
    public func countColors () -> (red:Int, green:Int, blue:Int, alpha:Int) {
        var redPixel: Int = 0
        var greenPixel: Int = 0
        var bluePixel: Int = 0
        var alphaPixel: Int = 0
        
        for y in 0..<self.inRgb.height{
            for x in 0..<self.inRgb.width{
                
                let index = y * inRgb.width + x
                let pixel = inRgb.pixels[index]
                
                redPixel += Int(pixel.red)
                greenPixel += Int(pixel.green)
                bluePixel += Int(pixel.blue)
                alphaPixel += Int(pixel.alpha)
            }
        }
        
        return (redPixel, greenPixel, bluePixel, alphaPixel)
    }
    
    
    
    //methos to define the avarage colors of pixels on the image
   
    public func defineAvarages(){
        let countOfPixels = inRgb.height * inRgb.width
        let countOfColors = countColors()
        
        self.redAvgPixel = countOfPixels/countOfColors.red
        self.greenAvgPixel = countOfPixels/countOfColors.green
        self.blueAvgPixel = countOfPixels/countOfColors.blue
        self.alphaAvarage = countOfPixels/countOfColors.alpha
        
    }
    
    public func getAvarages () ->(red:Int, green:Int, blue:Int, alpha:Int) {
    let redAvgPixel: Int = self.redAvgPixel
    let greenAvgPixel: Int = self.greenAvgPixel
    let blueAvgPixel: Int = self.blueAvgPixel
    let alphaAvgPixel: Int = self.alphaAvarage

    return (redAvgPixel, greenAvgPixel, blueAvgPixel, alphaAvgPixel)
    }
    
    
    public func getInRgb()->RGBAImage{
        let img = self.inRgb
        return img
    }
    
    
}