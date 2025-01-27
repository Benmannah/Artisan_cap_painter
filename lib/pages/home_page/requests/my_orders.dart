import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:artisan_cap_painter/components/text_inputs.dart';
import 'package:artisan_cap_painter/pages/home_page/requests/request_card.dart';
import 'package:artisan_cap_painter/state_managers/appointment_data_state.dart';
import 'package:artisan_cap_painter/utils/app_colors.dart';
import 'package:artisan_cap_painter/styles/styles.dart';
import '../../../state_managers/user_data_state.dart';

class MyOrders extends ConsumerStatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  ConsumerState<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends ConsumerState<MyOrders> {
  @override
  Widget build(BuildContext context) {
    var user = ref.read(userProvider);
    var size = MediaQuery.of(context).size;
    var request = ref.watch(appointmentStreamProvider);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
              height: size.height * 0.16,
              alignment: Alignment.bottomCenter,
              width: size.width,
              decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'My Request',
                    style: GoogleFonts.roboto(
                        fontSize: 32,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomTextFields(
                      hintText: 'search request',
                      color: Colors.white,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onChanged: (vaule) {
                        //TODO: search request
                      },
                    ),
                  )
                ],
              )),
          Expanded(
            child: request.when(data: (data) {
              if (data.isEmpty) {
                return Center(
                  child: Text(
                    'No request found',
                    style: normalText(color: Colors.black45),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RequestCard(data: data[index]);
                    });
              }
            }, error: (e, s) {
              return Center(
                child: Text(
                  'Something went wrong',
                  style: normalText(color: Colors.black45),
                ),
              );
            }, loading: () {
              return const Center(
                child: SizedBox(
                    width: 40, height: 40, child: CircularProgressIndicator()),
              );
            }),
          )
        ],
      ),
    );
  }
}
