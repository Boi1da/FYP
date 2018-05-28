//
//  MetricAnalysisViewController.swift
//  FYP
//
//  Created by Armani on 04/02/2018.
//  Copyright © 2018 Armani Cesar. All rights reserved.
//

import UIKit
import Charts


class MetricAnalysisViewController: UIViewController {

    
    
    @IBOutlet weak var metricAnalysisChart: BarChartView!
   // @IBOutlet weak var metricAnalysisRing: MKRingProgressView!
    @IBOutlet weak var metricAnalysisScrollView: UIScrollView!
    
    @IBOutlet weak var metricAnalysisBackground: UIView!
    var indexPath: IndexPath!
    var result : [String : Any]!
    var startColour : UIColor!
    var endColour : UIColor!
    var metricPercentageNumber : Int!
    var metricType : String!
    
    @IBOutlet weak var metricTypeLabel: UILabel!
    @IBOutlet weak var metricPercentage: UILabel!
    var lineSampleArray = [12, 98, 231, 276, 103, 21]
    
    //Create data set for the graph
    let months = ["Jan", "Feb", "Mar",
                  "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep",
                  "Oct", "Nov", "Dec"]

    
    
    override func viewDidLoad() {
         metricTypeLabel.text = "Current \(metricType!)"
        updateGraph()
    }
    
    func updateGraph(){
       
        
        
        metricAnalysisChart.backgroundColor = endColour
        metricAnalysisChart.chartDescription?.enabled = false
        
        let l = metricAnalysisChart.legend
        l.wordWrapEnabled = true
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        
        let rightAxis = metricAnalysisChart.rightAxis
        rightAxis.axisMinimum = 0
        
        let leftAxis = metricAnalysisChart.leftAxis
        leftAxis.axisMinimum = 0
        
        var xAxis = metricAnalysisChart.xAxis
        xAxis.labelTextColor = UIColor.white
        xAxis.labelPosition = .bothSided
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        
    
        let data = LineChartData()
  
        
        metricAnalysisChart.data = data
        
        metricAnalysisChart.chartDescription?.text = "Technical debt"
        metricAnalysisChart.chartDescription?.textColor = UIColor.white
        
    }
    
    func generateBarChartData() -> BarChartData{
         var barChartEntry = [ChartDataEntry]()
        for i in 0..<lineSampleArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(lineSampleArray[i]))
            
            barChartEntry.append(value)
        }
        
        let debtSet1 = BarChartDataSet(values: barChartEntry, label: "bar1")
        debtSet1.setColor(endColour)
        debtSet1.valueTextColor = UIColor.white
        debtSet1.valueFont = .systemFont(ofSize: 12)
        debtSet1.axisDependency = .left
        
        let data = BarChartData(dataSets: [debtSet1])
        return data
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
      //  metricAnalysisRing.startColor = startColour
//        metricAnalysisRing.endColor = endColour
//        metricAnalysisRing.animateTo(metricPercentageNumber)
     //   metricPercentage.animateToNumber(metricPercentageNumber, duration: 1)

    }
    
}

//extension MetricAnalysisViewController : UIScrollViewDelegate {
//
//}


extension MetricAnalysisViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return months[Int(value) % months.count]
    }
}
