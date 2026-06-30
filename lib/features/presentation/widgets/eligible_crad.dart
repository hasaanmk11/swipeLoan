import 'package:app/features/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LoanEligibleScrolableCrad extends StatelessWidget {
  const LoanEligibleScrolableCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "See All Payments",
                style: TextStyle(
                  color: Color(0xff16C172),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios, size: 12, color: Color(0xff16C172)),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 70,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return Container(
                width: 260,

                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xffE7F9ED).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: appBorderBgClr),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(
                        color: Color(0xff16C172),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.percent,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "You're Eligible For A Lower Interest Rate",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color(0xff262626),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Flexible(
                                child: Text(
                                  "Contact you bank to learn more",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                size: 14,
                                color: Color(0xff5E5E5E),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
