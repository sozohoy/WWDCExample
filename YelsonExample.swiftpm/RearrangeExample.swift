//
//  RearrangeExample.swift
//  YelsonExample
//
//  Created by 한지석 on 2023/04/10.
//

import SwiftUI
import ColorKit


struct RearrangeExample: View {
    @State private var showingImagePicker = false
    @State var pickedImage: Image?
    @State var topColors: TopColors
    
    var body: some View {
        VStack {
            if topColors.colorFrequency.count != 0 {
                ForEach(0..<8) { index in
                    Rectangle()
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color(uiColor: (topColors.colorFrequency[index].color)))
                }
            }
            Button {
                self.showingImagePicker.toggle()
            } label: {
                Text("Picker")
            }.sheet(isPresented: $showingImagePicker) {
                ImagePicker { UIImage in
                    self.pickedImage = Image(uiImage: UIImage)
                    self.topColors = TopColors(image: UIImage)
                    print("이미지 변환")
                    print(topColors.colorFrequency.count)
                    print(topColors.colorFrequency)
                    print(UIImage)
                }
            }
            pickedImage?
                .resizable()
                .frame(width: 200, height: 150)

        }
    }
}

struct TopColors {
    var colorFrequency: [ColorFrequency]
    var colorAvarage: UIColor
    
    init(image: UIImage) {
        do {
            self.colorFrequency = try image.dominantColorFrequencies()
            self.colorAvarage = try image.averageColor()
        } catch {
            self.colorFrequency = []
            self.colorAvarage = .black
            fatalError(error.localizedDescription)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    typealias UIViewControllerType = UIImagePickerController
    @Environment(\.dismiss) var dismiss
    let imagePicked: (UIImage) -> ()
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.imagePicked(image)
                parent.dismiss()
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
}


struct RearrangeExample_Previews: PreviewProvider {
    static var previews: some View {
        RearrangeExample(topColors: TopColors(image: UIImage(named: "Yelson1")!))
    }
}
