//
//  test dots.swift
//  TestApp2
//
//  Created by Michele Zurlo on 02/11/22.
//

import SwiftUI


struct RadioButtonsCalmEnergized: View {

    @State var selectedColor: Color?

    var body: some View {
        
        HStack {
        
            CheckBox(selectedColor: self.$selectedColor, color: calmEmotion.color,size: calmEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteCalmEmotion.color,size: quiteCalmEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: NormalColorCalmEnergizedEmotion.color,size: NormalColorCalmEnergizedEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteEnergizedEmotion.color,size: quiteEnergizedEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: energizedEmotion.color,size: energizedEmotion.size).padding()
           
        }
    }
}

struct RadioButtonsCheerfulSensitive: View {

    @State var selectedColor: Color?

    var body: some View {
        
        HStack {
        
            CheckBox(selectedColor: self.$selectedColor, color: cheerfulEmotion.color,size: cheerfulEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteCheerfulEmotion.color,size: quiteCheerfulEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: NormalColorCheerfulSensitiveEmotion.color,size: NormalColorCheerfulSensitiveEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteSensitiveEmotion.color,size: quiteSensitiveEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: sensitiveEmotion.color,size: sensitiveEmotion.size).padding()
           
        }
    }
}

struct RadioButtonsDistractedFocused: View {

    @State var selectedColor: Color?

    var body: some View {
        
        HStack {
        
            CheckBox(selectedColor: self.$selectedColor, color: distractedEmotion.color,size: distractedEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteDistractedEmotion.color,size: quiteDistractedEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: distractedFocusedNormalEmotion.color,size: distractedFocusedNormalEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteFocusedEmotion.color,size: quiteFocusedEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: focusedEmotion.color,size: focusedEmotion.size).padding()
           
        }
    }
}

struct RadioButtonsRelaxedStressed: View {

    @State var selectedColor: Color?

    var body: some View {
        
        HStack {
        
            CheckBox(selectedColor: self.$selectedColor, color: relaxedEmotion.color,size: relaxedEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteRelaxedEmotion.color,size: quiteRelaxedEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: RelaxedStressedNormalEmotion.color,size: RelaxedStressedNormalEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteStressedEmotion.color,size: quiteStressedEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: stressedEmotion.color,size: stressedEmotion.size).padding()
           
        }
    }
}

struct RadioButtonsInsecureSelfConfident: View {

    @State var selectedColor: Color?

    var body: some View {
        
        HStack {
        
            CheckBox(selectedColor: self.$selectedColor, color: insecureEmotion.color,size: insecureEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteInsecureEmotion.color,size: quiteInsecureEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: InsecureSelfConfidentNormalEmotion.color,size: InsecureSelfConfidentNormalEmotion.size).padding()
            CheckBox(selectedColor: self.$selectedColor, color: quiteSelfConfidentEmotion.color,size: quiteSelfConfidentEmotion.size)
            CheckBox(selectedColor: self.$selectedColor, color: selfConfidentEmotion.color,size: selfConfidentEmotion.size).padding()
           
        }
    }
}

struct CheckBox: View {

    @Binding var selectedColor: Color?
    var color: Color
    var size: CGFloat
    @EnvironmentObject var cardModel: CardModel

    var body: some View {
        Button(action: { self.selectedColor = self.color
           
            cardModel.addEmotion(emotion: Emotion(size: size,color: color))
        
        }) {
            Circle()
                .foregroundColor(color)
                .frame(width: size,height: size)
                .overlay{
                    
                    
                    self.selectedColor == color ? Circle().stroke(.gray, lineWidth: 5) : nil
                   
                    
                       
                    
                }
        }
    }
}
