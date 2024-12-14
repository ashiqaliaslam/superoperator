import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:superoperator/models/procedure.dart';

class ProcedureDetailsView extends StatelessWidget {
  ProcedureDetailsView({super.key});

  static String route = 'procedures';

  @override
  Widget build(BuildContext context) {
    // final Map<String, String> args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // final String category = args['category']!;
    // final String procedureName = args['procedure']!;

    // // Load the JSON file
    // Future<Procedure> loadProcedureJson(
    //     String category, String procedureName) async {
    //   // Convert the category name to the folder name format
    //   String categoryFolder = category.toLowerCase().replaceAll(' ', '_');
    //   String jsonString = await rootBundle
    //       .loadString('assets/data/$categoryFolder/$procedureName.json');
    //   final jsonResponse = json.decode(jsonString);
    //   return Procedure.fromJson(jsonResponse);
    // }

    return Scaffold(
      appBar: AppBar(
        // title: Text(procedureName.replaceAll('_', ' ').toUpperCase()),
        title: const Text('Procedure Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title: ${procedure['header']?['title']}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Purpose: ${procedure['body']?['purpose']}"),
              const SizedBox(height: 10),
              const Text("Work Instructions:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // ...List<Widget>.from(procedure.workInstructions.map((step) {
              //   return Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Step ${step.stepNumber}: ${step.procedure}"),
              //       Text(
              //           "Responsibility: ${step.responsibility.join(', ')}"),
              //       const SizedBox(height: 10),
              //     ],
              //   );
              // }),),
              // const SizedBox(height: 10),
              // Text(
              //     "Related Documents: ${procedure.relatedDocuments.join(', ')}",),
              // const SizedBox(height: 10),
              // Text(
              //     "Distribution List: ${procedure.distributionList.join(', ')}",),
            ],
          ),
        ),
      ),
      // body: FutureBuilder<Procedure>(
      //   future: loadProcedureJson(category, procedureName),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(
      //           child: Text('Error loading procedure: ${snapshot.error}'));
      //     } else if (!snapshot.hasData) {
      //       return const Center(child: Text('Procedure not found'));
      //     } else {
      //       final procedure = snapshot.data!;
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: SingleChildScrollView(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text("Title: ${procedure.title}",
      //                   style: const TextStyle(
      //                       fontSize: 20, fontWeight: FontWeight.bold)),
      //               const SizedBox(height: 10),
      //               Text("Purpose: ${procedure.purpose}"),
      //               const SizedBox(height: 10),
      //               const Text("Work Instructions:",
      //                   style: TextStyle(
      //                       fontSize: 18, fontWeight: FontWeight.bold)),
      //               ...List<Widget>.from(procedure.workInstructions.map((step) {
      //                 return Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text("Step ${step.stepNumber}: ${step.procedure}"),
      //                     Text(
      //                         "Responsibility: ${step.responsibility.join(', ')}"),
      //                     const SizedBox(height: 10),
      //                   ],
      //                 );
      //               })),
      //               const SizedBox(height: 10),
      //               Text(
      //                   "Related Documents: ${procedure.relatedDocuments.join(', ')}"),
      //               const SizedBox(height: 10),
      //               Text(
      //                   "Distribution List: ${procedure.distributionList.join(', ')}"),
      //             ],
      //           ),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }

  final procedure = {
    "header": {
      "title": "Work Instructions",
      "department": "Power & Steam Generation",
      "document_title": "BFW Pump Changeover",
      "document_code": "OPS-WP-WI-01",
      "revision": {"number": 1, "date": "15-Feb-22"}
    },
    "body": {
      "document_title": "Boiler Feed Water Pump Changeover",
      "purpose": "To ensure the safe changeover of Boiler Feed water pump.",
      "work_instructions": {
        "steps": [
          {
            "step_number": 1,
            "procedure":
                "Formal go ahead for carrying out Boiler Feed Water Pump change over activity to be taken from UM-PSG. Scheduled changeover to be done in Morning Shift during week days.",
            "responsibility": ["Day Engineer"]
          },
          {
            "step_number": 2,
            "procedure":
                "In case of Emergency or some maintenance job on the running Pump. Change over activity can be done depending on job nature.",
            "responsibility": ["Shift Engineer"]
          },
          {
            "step_number": 3,
            "procedure":
                "Ensure that startup checklist for Stand By pump (CSP-5011A/B/S) has been filled and pump is ready to start.",
            "responsibility": ["Shift Engineer", "Area Operator"]
          },
          {
            "step_number": 4,
            "procedure":
                "Stand By pump vibration/temperature parameters are in the normal range and no security of the pump has been by-passed/forced.",
            "responsibility": ["Shift Engineer", "Boardman"]
          },
          {
            "step_number": 5,
            "procedure":
                "Make sure that Inspection & machinery team personnel are available in the area during the changeover activity.",
            "responsibility": ["Shift Engineer"]
          },
          {
            "step_number": 6,
            "procedure":
                "Electrical technician is available in the Main Electrical Building and Utilities Control Room has been informed regarding this activity.",
            "responsibility": ["Shift Engineer", "Boardman"]
          },
          {
            "step_number": 7,
            "procedure":
                "Before taking the PUMP IN SERVICE ITS DISCHARGE VALVE MOV (MOV-5010-02/03/04) MUST BE ON MANUAL MODE.",
            "responsibility": ["Shift Engineer", "Boardman"]
          },
          {
            "step_number": 8,
            "procedure":
                "Pump to be started on REMOTE from DCS. DCS Boardman to ensure and verify that pump has been started in area, its amperes and vibrations are in normal range.",
            "responsibility": ["Boardman"]
          },
          {
            "step_number": 9,
            "procedure":
                "Area operator to ensure that pump’s discharge ARC valve has been opened and flow established through recycle line. (PI-5010-21/22/23)",
            "responsibility": ["Area Operator"]
          },
          {
            "step_number": 10,
            "procedure": "Keep the pump running for next 5~10 minutes.",
            "responsibility": ["Shift Engineer"]
          },
          {
            "step_number": 11,
            "procedure":
                "Now give opening command to the discharge (MOV-5010-02/03/04) of the pump started (On single click valve will open around 5%). Opening to be verified by field operator also.",
            "responsibility": ["Boardman", "Field Operator"]
          },
          {
            "step_number": 12,
            "procedure":
                "Keep on the increasing the valve opening in steps while observing the Pumps amperes & vibrations. At 100% opening of MOV, put it on AUTO mode.",
            "responsibility": ["Boardman"]
          },
          {
            "step_number": 13,
            "procedure":
                "Once the stand by pump is taken in service, start closing the discharge MOV (after taking on MANUAL Mode) of the Pump to be stopped, in similar pattern. Keep on decreasing the valve opening till it is completely closed and pump flow is shifted on recycle.",
            "responsibility": ["Boardman"]
          },
          {
            "step_number": 14,
            "procedure":
                "Keep the pump to stopped running for next 5~10 minutes.",
            "responsibility": ["Shift Engineer"]
          },
          {
            "step_number": 15,
            "procedure":
                "Stop the pump from Local/Remote, ensure that its auxiliary Lube oil pump has started running and pursue for its handing over for the maintenance job or for its availability as Stand By. After ensuring the stopped pump availability on standby mode, put its discharge MOV back to AUTO Mode.",
            "responsibility": ["Boardman", "Shift Engineer"]
          }
        ]
      },
      "related_documents": [
        "BFW Pump Start Up Checklist",
        "PSG Machines Changeover Plan"
      ],
      "distribution_list": [
        "IMS Office",
        "Operations Manager",
        "Unit Manager (PSG)",
        "Control Room (PSG)"
      ]
    },
    "footer": {
      "route": {
        "prepared_by": {
          "name": "Sumair Ahmad Khan",
          "designation": "Section Manager",
          "date": "",
          "sign": ""
        },
        "reviewed_by": {
          "name": "Attique Ur Rehman",
          "designation": "Unit Manager - OPS",
          "date": "",
          "sign": ""
        },
        "approved_by": [
          {
            "name": "Sarfaraz Ahmed",
            "designation": "Process Manager",
            "date": "",
            "sign": ""
          },
          {
            "name": "Mahboob Ahmad",
            "designation": "Sr. Operation Manager",
            "date": "",
            "sign": ""
          }
        ]
      }
    }
  };
}
