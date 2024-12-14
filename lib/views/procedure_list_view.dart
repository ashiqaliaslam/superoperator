import 'package:flutter/material.dart';
import 'package:superoperator/views/procedure_detail_view.dart';

class ProcedureListView extends StatelessWidget {
  const ProcedureListView({super.key});

  static String route = 'procedure_detail';

  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)!.settings.arguments as String;
    // Sample data for demonstration
    final procedures = {
      'Changeover Procedures': [
        'bfp_changeover',
        'Instrument Air Compressor Changeover'
      ],
      'Emergency Handling Procedures': [
        'Boiler 1 Trip',
        'STG 1 Trip',
      ],
      'Miscellaneous Procedures': [
        'EDG Testing',
        'Sodium Hypochlorite Unloading'
      ],
      'HSE Procedures': [
        'PTW',
        'Safe Driving Procedure',
      ],
      'Startup Procedures': [
        'Boiler',
        'Lime Dosing System',
      ],
    };

    final procedureList = procedures[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: procedureList.length,
        itemBuilder: (context, index) {
          final procedure = procedureList[index];
          return ListTile(
            // title: Text(procedure),
            title: Text(procedure.replaceAll('_', ' ')),
            onTap: () {
              Navigator.pushNamed(
                context,
                ProcedureDetailsView.route,
                arguments: {'category': category, 'procedure': procedure},
              );
            },
          );
        },
      ),
    );
  }
}
