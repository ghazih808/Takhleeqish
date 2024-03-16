

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takhleekish/Artist/throughNavbar/AnalyticsPage/barGraph/barData.dart';

class BarGraph extends StatelessWidget{
  final double AbstractAmount;
  final double landscapeAmount;
  final double portraitAmount;
  final double StillLifeAmount;
  final double ModernArtAmount;
  final double ContemporaryAmount;

  BarGraph({required this.AbstractAmount, required this.landscapeAmount,
    required this.portraitAmount, required this.StillLifeAmount, required this.ModernArtAmount,
    required this.ContemporaryAmount,});
  @override
  Widget build(BuildContext context) {
    BarData barData=BarData(AbstractAmount: AbstractAmount,
        landscapeAmount: landscapeAmount,
        portraitAmount: portraitAmount,
        StillLifeAmount: StillLifeAmount,
        ModernArtAmount: ModernArtAmount,
        ContemporaryAmount: ContemporaryAmount);
    barData.intializeBarData();
    return Card(
      elevation: 4,
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(

          BarChartData(
            maxY: 10,
            minY: 0,
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: barData.barData.map((data) =>
                BarChartGroupData(x:data.x,
                  barRods: [BarChartRodData(toY: data.y,color: Color(0xff00598B),width: 13
                  ,borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY:10,
                      color: Colors.grey[300]
                    )
                  )]
                )).toList(),
            titlesData: FlTitlesData(
              show: true,
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles:true,getTitlesWidget: getBottomTiles)
            )
          ))
        ),
      ),
    );
  }

Widget getBottomTiles(double value,TitleMeta meta)
{
  const style=TextStyle(fontSize: 10,fontWeight: FontWeight.bold);
  Widget text;
  switch(value.toInt()) {
    case 0:
      text = const Text("Abst", style: style,);
      break;
    case 1:
      text = const Text("Lands", style: style,);
      break;
    case 2:
      text = const Text("Port", style: style,);

      break;
    case 3:
      text = const Text("Still", style: style,);

      break;
    case 4:
      text = const Text("Modern", style: style,);

      break;
    case 5:
      text = const Text("Contemp", style: style,);
      break;

    default:
      text = const Text("", style: style,);
      break;

  }
 return SideTitleWidget(child: text, axisSide: meta.axisSide);

  }


  
}