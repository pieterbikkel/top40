//
//  AVPlayer+.swift
//  Top40
//
//  Created by Simon Schöpke on 02.03.21.
//

import AVFoundation

extension AVPlayer {
    var isPlayingEX: Bool {
        return rate != 0 && error == nil
    }
}
