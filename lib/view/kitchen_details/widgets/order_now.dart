import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_subs/view/kitchen_details/widgets/details_item_card.dart';

class OrderNowWidget extends StatelessWidget {
  const OrderNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 82,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (_, i) => Container(
                width: MediaQuery.of(context).size.width / 1.5,
                margin: const EdgeInsets.only(right: 12),
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -3, vertical: -3),
                  leading: Image.network(
                      'https://m.economictimes.com/thumb/msid-107312198,width-1200,height-900,resizemode-4,imgsize-6574/paytm-etonline.jpg'),
                  title: Text(
                    'Upto \u{20B9}100 Cashback',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    'Pay via PAYTM',
                    style: GoogleFonts.openSans(),
                  ),
                ),
              ),
            ),
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Lunch',
                style: GoogleFonts.ptSansCaption(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Closing in 30 mins',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                ),
              ),
              children: const [
                DetailsItemCardWidget(),
                DetailsItemCardWidget(freeDessert: true),
              ],
            ),
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                'Dinner',
                style: GoogleFonts.ptSansCaption(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                'Oders accepts till 9 pm',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                ),
              ),
              children: const [
                DetailsItemCardWidget(),
                DetailsItemCardWidget(freeDessert: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
