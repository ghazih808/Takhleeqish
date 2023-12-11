import 'package:flutter/material.dart';

class ArtistAnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Analytics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ArtistAnalyticsCard(
              title: 'Total Sales',
              value: '215',
            ),
            SizedBox(height: 16),
            ArtistAnalyticsCard(
              title: 'Views on Art',
              value: '3,500',
            ),
            SizedBox(height: 16),
            ArtistAnalyticsCard(
              title: 'Total Revenue',
              value: '\$12,500',
            ),
            SizedBox(height: 16),
            ArtistAnalyticsCard(
              title: 'Feedback',
              value: 'Positive: 85%\nNeutral: 10%\nNegative: 5%',
            ),
          ],
        ),
      ),
    );
  }
}

class ArtistAnalyticsCard extends StatelessWidget {
  final String title;
  final String value;

  const ArtistAnalyticsCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ArtistAnalyticsPage(),
  ));
}
