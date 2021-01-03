//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

//import UIKit
//
////Добавил требуемую библиотеку Apple
////Audio Visual Foundational module
//import AVFoundation
//
//
//class ViewController: UIViewController {
//
////  Добавил переменную плеера class AVAudioPlayer
////  An audio player that provides playback of audio data from a file or memory.
//    var player: AVAudioPlayer?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
////  Перенес первую красную кнопку
//    @IBAction func keyPressed(_ sender: UIButton) {
////        Функция при нажатии на кнопку С
//
////        Вызываю функцию которую перенес из СтакОверфлоу
//        playSound()
//
//////        Выводит в консоль текст
////        print("C button is pressed")
//    }
//
//
////    Перенес функцию со СтакОверфлоу
//    func playSound() {
//
////        Заменил дефолтный ресурс на свой и поставил формат файла
////        Bundle
////        A representation of the code and resources stored in a bundle             directory on disk
//        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
//
//        do {
////            Ставим категорию чтобы играло даже при выкл звуке на айфоне
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
////             Запускаем звук
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else { return }
//
//            player.play()
////          Если есть ошибки - выводим ошибки
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//
//}


import UIKit
//          Добавляем библиотеку Эппл
import AVFoundation

class ViewController: UIViewController {
    //          Устанавливаем переменную
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //         Переносим кнопку
    @IBAction func keyPressed(_ sender: UIButton) {
        
//        Устанавливаем прозрачность при нажатии
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        print(sender.currentTitle!)
        //       Функция при нажатии на кнопку + вызываем функцию (аутпутом назначаем заголовок файла со звуком)
        playSound(soundName: sender.currentTitle!)
    }
    
    //         Функция проигрывания музыки (в инпут создаем параметр и назначаем его строкой)
    func playSound(soundName: String) {
        //         Находим муз файл в каталоге (ресурсом назначаем параметр из импута)
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //         Просим сыграть найденный файл
        player = try! AVAudioPlayer(contentsOf: url!)
        //        Запускаем звук
        player.play()
        
    }
}
