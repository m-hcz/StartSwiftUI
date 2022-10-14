//
//  SoundsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI
import AVKit

class SoundManager {
	static let instance = SoundManager()
	
	var player : AVAudioPlayer?
	
	enum SoundOption:String {
		case tada = "tada-sound"
		case badum = "badum-sound"
	}
	func playSound(sound:SoundOption) {
		guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
		
		do {
			player = try AVAudioPlayer(contentsOf: url)
			player?.play()
		} catch let error {
			print("Error \(error.localizedDescription)")
		}
		
	}
}

struct SoundsBootcamp: View {
	
    var body: some View {
		VStack(spacing: 40.0) {
			Button("Play sound 1") {
				SoundManager.instance.playSound(sound: .tada)
			}
			Button("Play sound 2") {
				SoundManager.instance.playSound(sound: .badum)
			}
		}
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}