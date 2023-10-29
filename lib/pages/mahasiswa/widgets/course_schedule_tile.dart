import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';
import '../models/course_schedule_model.dart';

class CourseScheduleTile extends StatelessWidget {
  final CourseScheduleModel data;
  const CourseScheduleTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 65.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(data.startTime),
                  Text(
                    data.endTime,
                    style: const TextStyle(
                      color: ColorResource.grey,
                    ),
                  ),
                  // Text(data.timeStart.format(context)),
                  // Text(
                  //   data.timeEnd.format(context),
                  //   style: const TextStyle(
                  //     color: ColorResource.grey,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          const VerticalDivider(),
          const SizedBox(width: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.course,
                  style: const TextStyle(
                    color: ColorResource.primary,
                  ),
                ),
                const SizedBox(height: 18.0),
                Text('Dosen: ${data.lecturer}'),
                const SizedBox(height: 18.0),
                Flexible(
                  child: Text(
                    'Ruangan: ${data.room}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorResource.grey,
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
