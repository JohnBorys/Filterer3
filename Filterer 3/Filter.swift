 
//  Filter.swift
//  Filterer 3
//
//  Created by John Bil on 19.09.16.
//  Copyright © 2016 John Bil. All rights reserved.

import UIKit

func filteredImageFunc(_ image: UIImage, amountCollor: Int, amountBrightness: Int, color: String) -> UIImage {
    // Black % Wight filter for initialization forom 0 (b&w image) to 100 (colorfull image)
    // Brightness filter (0 -> 100), 50 is original

    // let  image  = UIImage(named: "Best-Wallpaper-Wonderful-Awesome-GP")
        var myRGBA = RGBAImage(image: image)!
   
    
    
        for y in 0..<myRGBA.height {
            for x in 0..<myRGBA.width {
                let index = y * myRGBA.width + x
                var pixel = myRGBA.pixels[index]
                let userColor = color
                switch userColor {
                    case "Red":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + 2*avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + avgColor) )))
                    case "Green":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                        
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + 2*avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + avgColor) )))

                    case "Blue":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                        
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + 2*avgColor) )))

                    case "Yellow":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                        
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + 2*avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + 2*avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + avgColor) )))

                    case "Purpule":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                        
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + avgColor) )))
                    case "Original":
                        let redColor = (Int(pixel.red) - Int(pixel.red)/10)*amountBrightness/50 + Int(pixel.red)/10
                        let greenColor = (Int(pixel.green) - Int(pixel.green)/10)*amountBrightness/50 + Int(pixel.green)/10
                        let blueColor = (Int(pixel.blue) - Int(pixel.blue)/10)*amountBrightness/50 + Int(pixel.blue)/10
                        let avgColor = (redColor + greenColor + blueColor)/3
                    
                        pixel.red = UInt8(max(0, min(255, ((redColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.green = UInt8(max(0, min(255, ((greenColor - avgColor)*amountCollor/100 + avgColor) )))
                        pixel.blue = UInt8(max(0, min(255, ((blueColor - avgColor)*amountCollor/100 + avgColor) )))
                    default:
                        break }
                
                
                // Test Git
                
                



                myRGBA.pixels[index] = pixel

            }
        }
        let filteredImage = myRGBA.toUIImage()
        return filteredImage!
    }
