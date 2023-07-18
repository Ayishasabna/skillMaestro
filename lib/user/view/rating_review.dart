import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/user/view/payment_description_screen.dart.dart';

import '../../application/user/get_jobs_provider.dart';
import '../../core/constants.dart';

class WorkReviewScreen extends StatelessWidget {
  const WorkReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'Ratings & Reviews',
            style: normalText.copyWith(fontSize: 26),
          ),
        ),
        body: Consumer<AlljobsListForUser>(
          builder: (context, value, child) =>
              value.jobDetail['result']['reviews'][0]['message'].isEmpty
                  ? const Center(
                      child: Text('No Reviews Posted Yet!'),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: value.jobDetail['result']['reviews'].length,
                      itemBuilder: (context, index) {
                        double newRating = value.jobDetail['result']['reviews']
                                [index]['rating']
                            .toDouble();

                        log("______________ratingnew______________${newRating}");
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widgets().sizedboxHeight10(),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    initialRating: newRating,
                                    /* double.parse(
                                          value.jobDetail['result']['reviews']
                                              [index]['rating'])
                                      .toDouble(), */
                                    /* value.jobDetail['result']
                                      ['reviews'][index]['rating'], */
                                    itemSize: 20,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 230, 209, 23),
                                    ),
                                    onRatingUpdate: (value) {},
                                  ),
                                  Text(
                                    "(${value.jobDetail['result']['reviews'][index]['message']})",
                                    style: normalText,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      value.jobDetail['result']['reviews']
                                          [index]['message'],
                                      style: normalText),
                                ],
                              ),
                              widgets().sizedboxHeight10(),
                              /* Text(
                          value.reveiws![index]!.description,
                          style: const TextStyle(fontSize: 19),
                        ),
                        kHeight10, */
                              Row(
                                children: [
                                  /* const CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage('assets/splash/unknown.jpg'),
                                ), */
                                  SizedBox(
                                    width: 10,
                                  ),
                                  /* Text(
                              "${value.reveiws![index]!.userId.fullName}  ,  ",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ), */
                                  /* Text(
                              value.reveiws![index]!.userId.status,
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ) */
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    size: 18,
                                  ),
                                  /* Text(
                                'Verified User  ${value.reveiws![index]!.date}') */
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
        ));
  }
}
