import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/config/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/profile/cubit/contact_us/contact_us_cubit.dart';
import 'package:orion_safeguard/modules/profile/widgets/contact_us/input_email_field.dart';
import 'package:orion_safeguard/modules/screen_layout_widget/screen_layout.dart';

import '../../../generated/assets.dart';
import '../../../utils/enums.dart';
import '../../../utils/heights_and_widths.dart';
import '../cubit/company_details/company_details_cubit.dart';
import '../widgets/contact_us/input_message_field.dart';
import '../widgets/contact_us/input_name_field.dart';
import '../widgets/contact_us/send_message_button.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    FocusNode nameFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();
    FocusNode messageFocusNode = FocusNode();

    final key = GlobalKey<FormState>();

    return OrionLayout(
        pageTitle: 'Contact us',
        child: BlocProvider<ContactUsCubit>(
          create: (BuildContext context) => ContactUsCubit(),
          child: BlocConsumer<ContactUsCubit, ContactUsState>(
              listener: (context, state) {
                if (state.status == PostApiStatus.success) {
                  setState(() {});
                }
              },
              buildWhen: (previous, next) => false,
              builder: (context, state) {
                return SingleChildScrollView(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ContactDetailsWidget(),
                        h2,
                        Text(
                          "Send us a message",
                          style: AppTextStyles.robotoSemiBold(
                            fontSize: 20.0,
                          ),
                        ),
                        h2,
                        Form(
                            key: key,
                            child: Column(
                              children: [
                                InputNameField(
                                  nameFocusNode: nameFocusNode,
                                  emailFocusNode: emailFocusNode,
                                ),
                                h1,
                                InputEmailField(
                                  emailFocusNode: emailFocusNode,
                                  messageFocusNode: messageFocusNode,
                                ),
                                h1,
                                InputMessageField(
                                  messageFocusNode: messageFocusNode,
                                ),
                                h2,
                                SendMessageButton(
                                  formKey: key,
                                ),
                              ],
                            ))
                      ],
                    ));
              }),
        ));
  }
}

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyDetailsCubit companyDetailsCubit =
        context.read<CompanyDetailsCubit>();
    if (companyDetailsCubit.state.companyDetailsModel.data == null) {
      companyDetailsCubit.fetchCompanyDetails();
    }
    return BlocBuilder<CompanyDetailsCubit, CompanyDetailsState>(
        buildWhen: (previous, next) => previous != next,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ContactDetailInfo(
                fieldName: state.companyDetailsModel.data?.phone ?? '',
                fieldSvg: Assets.svgCall,
              ),
              h1,
              ContactDetailInfo(
                fieldName: state.companyDetailsModel.data?.email ?? '',
                fieldSvg: Assets.svgSms,
              ),
              h1,
              ContactDetailInfo(
                fieldName: state.companyDetailsModel.data?.address ?? '',
                fieldSvg: Assets.svgLocation,
              ),
              h1,
            ],
          );
        });
  }
}

class ContactDetailInfo extends StatelessWidget {
  const ContactDetailInfo(
      {super.key, required this.fieldName, required this.fieldSvg});

  final String fieldName, fieldSvg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              100.0,
            ),
            color: Colors.red.shade50,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              fieldSvg,
              height: 16.0,
              width: 16.0,
            ),
          ),
        ),
        w2,
        Text(
          fieldName,
          style: AppTextStyles.robotoMedium(
            fontSize: 14.0,
          ),
        )
      ],
    );
  }
}
