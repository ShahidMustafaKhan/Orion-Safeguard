import 'package:flutter/material.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import '../../../constants/app_colors.dart';
import '../../../ui/input/input_field.dart';
import '../../../utils/heights_and_widths.dart';
import '../widget/custom_date_picker.dart';

class Step11 extends StatefulWidget {
  const Step11({super.key});

  @override
  State<Step11> createState() => _Step11State();
}

class _Step11State extends State<Step11> {
  TextEditingController submissionDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Declarations",
              style: AppTextStyles.robotoBold(
                fontSize: 24.0,
              ),
            ),
          ),
          h1,
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            "I certify that to the best of my knowledge, the information that I have given in my application for employment is true and complete and understand that any false statement or omission to Orion Safeguarding Ltd or its representatives may render lead to termination of employment without notice.",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            """I confirm that the information I have provided on my application is true and complete to the best of my knowledge. I Understand and agree that I will be subject to any or all of the following checks: Address check, Financial Probity check which company will retain on file, Id verification check, Academic / Professional qualification check, Employment history, including any periods of unemployment/self-employment and any gaps, Criminal background check. I understand and agree that if so required I will make a Statutory Declaration in accordance with the provisions of the Statutory Declarations Act 1835 in confirmation of previous employment or unemployment.""",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            """I authorize Orion Safeguarding Ltd or its nominated agents to carry out financial history check /credit check and approach Government agencies, former employers, educational establishments, for information relating to and verification of my employment/unemployment record. I authorize Orion Safeguarding Ltd to make a consumer information search and ID checks with a credit reference agency, which will keep a record of that search and may share that information with other credit reference agencies.""",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            "I consent to Orion Safeguarding Ltd reasonable processing of any personal information obtained for the purposes of establishing my medical condition and future fitness to perform my duties. I accept that I may be required to undergo a medical examination where requested by Orion Safeguarding Ltd Subject to the Access to Medical Reports Act 1988, I consent to the results of such examinations to be given to Orion Safeguarding Ltd.",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            "I further declare that any documents that I provide as proof of my identity, proof of address, proof of right to work and any other documents that I provide are genuine and give my consent for these documents to be examined under a UV scanner or similar device. I acknowledge that any falsified documents may be reported to the appropriate authority. I understand that it may be a criminal offence to attempt to obtain employment by deception and that any misrepresentation, omission of a material fact or deception will be cause for immediate withdrawal of any offer of employment.",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            "General Data Protection Regulations (GDPR)",
            style: AppTextStyles.robotoBold(
              fontSize: 14.0,
            ),
          ),
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            """Orion Safeguarding Ltd will use the information you have given on your application form (together with any information which we obtain with your consent from third parties) for assessing your suitability for employment. It may be necessary to disclose your information to our agents and other service providers. By returning this form to Orion Safeguarding Ltd you consent to our processing personal data about you where this is necessary, for example information about your credit status, ethnic origin or criminal offences. You also consent to the transfer of your information to your current and future potential employers where this is necessary (this may be to companies operating abroad if you apply for work outside of the United Kingdom). Your information will be held on our computer database and/or in our paper filing systems. By signing below, you agree to this process and confirm that you do not have a criminal record subject to the current Rehabilitation of Offenders Act and any amendments. You have the right to apply for a copy of your information and to have any inaccuracies corrected.""",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            "Disclosure",
            style: AppTextStyles.robotoBold(
              fontSize: 14.0,
            ),
          ),
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            """You are applying for a position of trust and in the event of being offered employment by Orion Safeguarding Ltd we may apply for a Disclosure. However, having a criminal record does not necessarily bar you from employment. For more information, ask a member of staff for a copy of the CRB Code of Practice/Disclosure Scotland and/or Company our policy statement regarding ex-offenders. Disclosure information is treated in a sensitive way and is restricted to those who need to see it to make a recruitment decision. By signing this document, you allow Orion Safeguarding Ltd to see a copy of the Disclosure. The Disclosure information is not retained i.e. it is disposed of within the timescales recommended in the CRB Code of Practice. By signing below, you agree to this process.""",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            "Screening",
            style: AppTextStyles.robotoBold(
              fontSize: 14.0,
            ),
          ),
          Text(
            style: AppTextStyles.robotoRegular(
              fontSize: 14.0,
            ),
            """Any offer of employment is subject to satisfactory screening, that the applicant consents to being screened in accordance with BS7858 and will provide information as required. That the information provided is correct, and the applicant acknowledges that any false statements or omissions could lead to termination of employment.""",
            textAlign: TextAlign.left,
          ),
          h1,
          Text(
            "I confirm that my consent is explicit, fully informed and freely given for the purposes of this job.",
            style: AppTextStyles.robotoBold(
              fontSize: 14.0,
            ),
          ),
          h1,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            // titleWeight: FontWeight.w600,
            controller: TextEditingController(),
            label: "Enter your name",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "Applicant name",
            hintColor: Colors.grey.shade600,
          ),
          h0P4,
          InputField(
            fillColor: AppColors.grey,
            titleSize: 14.0,
            // titleWeight: FontWeight.w600,
            controller: TextEditingController(),
            label: "Enter Your NI no",
            borderRadius: 20.0,
            borderColor: AppColors.greyColor,
            boxConstraints: 12,
            verticalPadding: 17.0,
            fieldTitle: "NI No",
            hintColor: Colors.grey.shade600,
          ),
          h1,
          Row(
            children: [
              Expanded(
                child: InputField(
                  fillColor: AppColors.grey,
                  titleSize: 14.0,
                  // titleWeight: FontWeight.w600,
                  controller: TextEditingController(),
                  label: "Click here for signature",
                  borderRadius: 20.0,
                  borderColor: AppColors.greyColor,
                  boxConstraints: 12,
                  verticalPadding: 17.0,
                  fieldTitle: "Signature",
                  hintColor: Colors.grey.shade600,
                ),
              ),
              w3,
              Expanded(
                child: DatePickerTextField(
                  text: 'Submission Date',
                  hintText: '11-11-2024',
                  controller: submissionDate,
                ),
              ),
            ],
          ),
          h1,
        ],
      ),
    );
  }
}
