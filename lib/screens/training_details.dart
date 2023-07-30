import 'package:fitness/models/training.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:fitness/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class TrainingDetailsScreen extends StatelessWidget {
  final TrainingModel training;

  const TrainingDetailsScreen(this.training);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: training.title,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded, size: 25),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: MainColors.grayDarkest,
            fontFamily: 'Shabnam',
            fontSize: 16,
          ),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(training.imageUrl, fit: BoxFit.cover),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          child: Icon(Icons.play_circle, color: Colors.white.withOpacity(0.8), size: 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(training.trainer),
                    Text('${training.duration.toFaString()} دقیقه', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              Text(
                training.description,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
