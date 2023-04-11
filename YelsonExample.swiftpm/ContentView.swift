import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    let image = UIImage(named: "YelsonImage")!
        
    var body: some View {
        Image(uiImage: pixelate(image))
            .resizable()
            .scaledToFit()
    }
    
    func pixelate(_ image: UIImage) -> UIImage {
        let inputImage = CIImage(image: image)!
        let filter = CIFilter.pixellate()
        filter.inputImage = inputImage
        filter.scale = 10
        let outputImage = filter.outputImage!
        let context = CIContext()
        let cgImage = context.createCGImage(outputImage, from: outputImage.extent)!
        return UIImage(cgImage: cgImage)
    }
}
