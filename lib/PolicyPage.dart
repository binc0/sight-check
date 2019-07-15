import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Privacy Policy"),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Container(
          margin: EdgeInsets.only(top: 16, right: 64, bottom: 32, left: 64),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                  child: Text(
                    """Personally Identifiable Information\nMichael Jancen-Widmer \n85570 Markt Schwaben \nEnzensberger Str. 8 \ncontact@michaeljancen.com \n+4917660472617 \n\nMichael Jancen-Widmer built the Sight-Check app and provided it at no cost and is intended for use as is.

This page is used to inform website visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Sight-Check unless otherwise defined in this Privacy Policy.

\nInformation Collection and Use\nFor a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request is retained on your device and is not collected by me in any way. The app does use third party services that may collect information used to identify you.

\nGoogle Play Services and Log Data \nI want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.

\nCookies \nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device\'s internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

\nService Providers \nI may employ third-party companies and individuals due to the following reasons:
\n- To facilitate our Service; \n- To provide the Service on our behalf;\n- To perform Service-related services; or\n- To assist us in analyzing how our Service is used.\n
I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

\nSecurity\nI value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.

\nLinks to Other Sites\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

\nChildren’s Privacy \nThese Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.

\nChanges to This Privacy Policy \nI may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.

\nContact Us \nIf you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me.""",
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
