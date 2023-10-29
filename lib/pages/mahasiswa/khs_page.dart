import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siakad_app/bloc/khs/khs_bloc.dart';
import 'package:siakad_app/common/components/custom_scaffold.dart';
import 'package:siakad_app/common/constants/colors.dart';

import '../../common/components/row_text.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  void initState() {
    context.read<KhsBloc>().add(const KhsEvent.getKhs());
    super.initState();
  }

  double ipk = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: false,
        children: [
          const Text(
            "KHS Mahasiswa",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "14 of 64 results",
                style: TextStyle(
                  color: ColorResource.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.network(
                'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2021/12/15/1405406409.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text(
              "Jesica Jane",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: const Text(
              "Mahasiswa",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
          const RowText(
            label: 'Mata Kuliah :',
            value: 'Nilai :',
            labelColor: ColorResource.primary,
            valueColor: ColorResource.primary,
          ),
          const SizedBox(height: 8.0),
          BlocBuilder<KhsBloc, KhsState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: const Text(
                      'Tidak ada data KHS yang tersedia.',
                      style: TextStyle(
                        color: ColorResource.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: ColorResource.primary,
                    ),
                  );
                },
                loaded: (khs) {
                  int total = 0;
                  for (var element in khs) {
                    total += int.parse(element.nilai);
                  }
                  ipk = total / khs.length;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: khs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                              ),
                              child: RowText(
                                label: khs[index].subject.title,
                                value: khs[index].grade.toString(),
                              ),
                            );
                          }),
                      const SizedBox(height: 40.0),
                      RowText(
                        label: 'IPK Semester :',
                        value: ipk.toString(),
                        labelColor: ColorResource.primary,
                        valueColor: ColorResource.primary,
                      ),
                    ],
                  );
                },
              );
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 3),
        ],
      ),
    );
  }
}
