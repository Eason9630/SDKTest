//
//  ViewController.swift
//  SDKTest
//
//  Created by 林祔利 on 2023/3/19.
//

import UIKit
import AVFAudio
import AVFoundation
import AVKit
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    let synthesizer = AVSpeechSynthesizer()
    let player = AVPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //宣告一個座標位置
        if let map = map{
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.06759, longitude: 121.57379), latitudinalMeters: 1000, longitudinalMeters: 1000)
            let bigBenAnnotation = MKPointAnnotation()
            map.setRegion(region, animated: true)
            
            bigBenAnnotation.title = "內湖運動公園"
            bigBenAnnotation.coordinate = CLLocationCoordinate2D(latitude: 25.06755, longitude: 121.57379)
            bigBenAnnotation.subtitle = "遊玩場所"
            map.addAnnotation(bigBenAnnotation)
            let londonEyeAnnotation = MKPointAnnotation()
            londonEyeAnnotation.title = "特斯拉"
            londonEyeAnnotation.coordinate = CLLocationCoordinate2D(latitude: 25.06712, longitude: 121.57553)
            londonEyeAnnotation.subtitle = "特斯拉"
            map.addAnnotation(londonEyeAnnotation)
        }else{
            print("map is nil")
        }
        
    }
    
    
    @IBAction func speak(_ sender: Any) {
        
        //用 AVSpeechUtterance 使用要講的話
        let utterance =  AVSpeechUtterance(string: "就是開不了口，讓她知道。我一定會呵護著妳，也逗妳笑。")
        //說哪一種語言，預設是英文， AVSpeechSynthesisVoice 設定國家語言
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //播放速度
        utterance.rate = 0.4
        //音調
        utterance.pitchMultiplier = 0.5
        //要真的可以說話要使用 AVSpeechSynthesizer （合成器），產生合成器
        
        //用合成器呼叫一個方法，把設定好的 AVSpeechUtterance 放進去
        synthesizer.speak(utterance)
        
    }
    
    @IBAction func Audio(_ sender: Any) {

        let url = Bundle.main.url(forResource: "嘉賓", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        self.player.play()
    }
    
    @IBSegueAction func showMovie(_ coder: NSCoder) -> AVPlayerViewController? {
        let controller = AVPlayerViewController(coder: coder)!
            let url = URL(string: "https://video-ssl.itunes.apple.com/apple-assets-us-std-000001/Video128/v4/ac/7c/62/ac7c6274-60ea-5b7c-4c99-f08d78bfe574/mzvf_484000410198456586.640x352.h264lc.U.p.m4v")
            //AVPlayer 只會播出聲音
            //AVPlayerViewController 就會產生畫面
            //在用AVPlayerViewController的屬性，使用playwe屬性
            controller.player = AVPlayer(url: url!)
            controller.player?.play()
            return controller
    }
}
