import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(
      {Key key,
      this.title,
      this.resultData,
      this.indonesiaData,
      this.chinaData,
      this.italyData,
      this.singData})
      : super(key: key);
  final String title;
  final dynamic resultData;
  final dynamic indonesiaData;
  final dynamic chinaData;
  final dynamic singData;
  final dynamic italyData;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int _counter = 0;
  dynamic apiData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        child: Text(
                          'Global Case',
                          style: TextStyle(
                              fontSize: 16.0, color: Color(0xFFb4c6EA)),
                        ),
                        padding: EdgeInsets.only(left: 16.0),
                      ),
                      Padding(
                        child: Text(
                          'Last updated: ${formatDate(DateTime.parse(widget.resultData['lastUpdate']), [
                            yyyy,
                            '-',
                            mm,
                            '-',
                            dd,
                            ' ',
                            HH,
                            ':',
                            nn,
                            ':',
                            ss
                          ])}',
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xFFb4c6EA)),
                        ),
                        padding: EdgeInsets.only(right: 20.0),
                      ),
                    ]),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(15.0, 10, 15.0, 15.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(children: <Widget>[
                        DetailCard(
                          title: 'Confirmed',
                          value: widget.resultData['confirmed']['value'],
                          hideRate: true,
                        ),
                        DetailCard(
                          title: 'Recovered',
                          value: widget.resultData['recovered']['value'],
                          rateValue: ((widget.resultData['recovered']['value'] /
                                      widget.resultData['confirmed']['value']) *
                                  100)
                              .round(),
                        ),
                        DetailCard(
                          title: 'Deaths',
                          value: widget.resultData['deaths']['value'],
                          rateValue: ((widget.resultData['deaths']['value'] /
                                      widget.resultData['confirmed']['value']) *
                                  100)
                              .round(),
                          rateColor: Colors.red,
                        ),
                      ])),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        child: Text(
                          'Indonesia',
                          style: TextStyle(
                              fontSize: 16.0, color: Color(0xFFb4c6EA)),
                        ),
                        padding: EdgeInsets.only(left: 16.0),
                      ),
                      Padding(
                        child: Text(
                          'Last updated: ${formatDate(DateTime.parse(widget.indonesiaData['lastUpdate']), [
                            yyyy,
                            '-',
                            mm,
                            '-',
                            dd,
                            ' ',
                            HH,
                            ':',
                            nn,
                            ':',
                            ss
                          ])}',
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xFFb4c6EA)),
                        ),
                        padding: EdgeInsets.only(right: 20.0),
                      ),
                    ]),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(15.0, 10, 15.0, 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(children: <Widget>[
                      DetailCard(
                        title: 'Confirmed',
                        value: widget.indonesiaData['confirmed']['value'],
                        hideRate: true,
                      ),
                      DetailCard(
                        title: 'Recovered',
                        value: widget.indonesiaData['recovered']['value'],
                        rateValue: ((widget.indonesiaData['recovered']
                                        ['value'] /
                                    widget.indonesiaData['confirmed']
                                        ['value']) *
                                100)
                            .round(),
                      ),
                      DetailCard(
                        title: 'Deaths',
                        value: widget.indonesiaData['deaths']['value'],
                        rateValue: ((widget.indonesiaData['deaths']['value'] /
                                    widget.indonesiaData['confirmed']
                                        ['value']) *
                                100)
                            .round(),
                        rateColor: Colors.red,
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: Text(
                    'Other Countries',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFFb4c6EA)),
                  ),
                  padding: EdgeInsets.only(left: 16.0),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(15.0, 10, 15.0, 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        CityItem(
                          title: 'China',
                          confirmed: widget.chinaData['confirmed']['value'],
                          recovered: widget.chinaData['recovered']['value'],
                          deaths: widget.chinaData['deaths']['value'],
                        ),
                        CityItem(
                          title: 'Singapore',
                          confirmed: widget.singData['confirmed']['value'],
                          recovered: widget.singData['recovered']['value'],
                          deaths: widget.singData['deaths']['value'],
                        ),
                        CityItem(
                          title: 'Italy',
                          confirmed: widget.italyData['confirmed']['value'],
                          recovered: widget.italyData['recovered']['value'],
                          deaths: widget.italyData['deaths']['value'],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CityItem extends StatelessWidget {
  const CityItem(
      {Key key, this.title, this.confirmed, this.recovered, this.deaths})
      : super(key: key);
  final String title;
  final int confirmed;
  final int recovered;
  final int deaths;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Row(
        children: <Widget>[
          Padding(
            child: Icon(Icons.location_city),
            padding: EdgeInsets.all(5.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                ),
                Text(
                  '$confirmed Confirmed',
                  style: TextStyle(fontSize: 10.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '$recovered Recovered',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0),
            ),
          ),
          Expanded(
            child: Text(
              '$deaths Deaths',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.0),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  const DetailCard(
      {Key key,
      @required this.title,
      @required this.value,
      this.child,
      this.rateColor = Colors.green,
      this.hideRate = false,
      this.rateValue = 0})
      : super(key: key);
  final String title;
  final int value;
  final Widget child;
  final bool hideRate;
  final Color rateColor;
  final int rateValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.7),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 20.0, color: Color(0xFF8E8E8E)),
              ),
            ),
            if (!hideRate)
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  '$rateValue%',
                  style: TextStyle(fontSize: 16.0, color: rateColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
