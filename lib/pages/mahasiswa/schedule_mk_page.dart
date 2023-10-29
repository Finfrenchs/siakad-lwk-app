import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/schedule/schedule_bloc.dart';
import 'package:siakad_app/common/extensions/date_time_ext.dart';

import '../../common/components/custom_scaffold.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import 'models/course_schedule_model.dart';
import 'widgets/course_schedule_tile.dart';
import 'widgets/course_with_image.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  @override
  void initState() {
    super.initState();
    context.read<ScheduleBloc>().add(const ScheduleEvent.getSchedule());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: false,
        //physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "Jadwal MK",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CourseWithImage(
                  name: 'Basis Data',
                  imagePath: Images.basisData,
                ),
                CourseWithImage(
                  name: 'Algoritma',
                  imagePath: Images.algoritma,
                ),
                CourseWithImage(
                  name: 'RPL',
                  imagePath: Images.rpl,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Center(
            child: Text(
              DateTime.now().toFormattedDateWithDay(),
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: ColorResource.primary,
                  ),
                );
              }, loaded: (schedule) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: schedule.length,
                    itemBuilder: (context, index) {
                      return CourseScheduleTile(
                        data: CourseScheduleModel(
                          dateStart: DateTime.now(),
                          longTimeTeaching: 90,
                          course: schedule[index].subject!.title!,
                          lecturer: schedule[index].subject!.lecturer!.name!,
                          room: schedule[index].ruangan!,
                          startTime: schedule[index].jamMulai!,
                          endTime: schedule[index].jamSelesai!,
                        ),
                      );
                    });
              });
            },
          ),
        ],
      ),
    );
  }
}
