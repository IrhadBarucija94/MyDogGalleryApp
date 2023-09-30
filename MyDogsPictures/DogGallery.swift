//
//  ContentView.swift
//  MyDogsPictures
//
//  Created by Irhad Baručija on 29. 9. 2023..
//

import SwiftUI

struct DogGallery: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    private let sampleDogs = [
    "mona2",
    "ella1",
    "mona1",
    "ella2",
    "mona&ella1",
    "mona3",
    "ella3",
    "mona4",
    "ella4",
    "mona&ella2",
    "mona5",
    "ella5",
    "mona6",
    "ella6",
    "mona7",
    "mona8",
    "mona9",
    "mona10",
    "mona11",
    "mona&ella3",
    "mona12",
    "mona13",
    "mona14",
    "mona15"
    ]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.7)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(sampleDogs, id: \.self) { dog in
                        Image(dog)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 360)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .containerRelativeFrame(.horizontal, count: verticalSizeClass == .regular ? 1 : 4, spacing: 16)
                            .scrollTransition { content, phase in content
                                    .opacity(phase.isIdentity ? 1.0 : 0.3)
                                    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3, y: phase.isIdentity ? 1.0 : 0.3)
                                    .offset(y: phase.isIdentity ? 0 : 50)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(16, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    DogGallery()
}


