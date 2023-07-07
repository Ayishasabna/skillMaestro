import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_message_provider.dart';

import '../../../core/widgets/textstyle.dart';

Widget ExpertsendCardWidget(context, String msg, String time, bool isSent) {
  //log("_________________--time__________________$time");
  return Column(
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextStyleWidget(
                      title: Provider.of<MessagingExpertProvider>(context,
                              listen: false)
                          .dateChange(time),
                      thick: FontWeight.w500,
                      textcolor: Colors.green,
                      fontsize: 10)
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}