class Procedure {
  final String title;
  final String purpose;
  final List<WorkInstruction> workInstructions;
  final List<String> relatedDocuments;
  final List<String> distributionList;

  Procedure({
    required this.title,
    required this.purpose,
    required this.workInstructions,
    required this.relatedDocuments,
    required this.distributionList,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) {
    var workInstructionsFromJson = json['workInstructions'] as List;
    List<WorkInstruction> workInstructionsList = workInstructionsFromJson
        .map((i) => WorkInstruction.fromJson(i))
        .toList();

    return Procedure(
      title: json['title'],
      purpose: json['purpose'],
      workInstructions: workInstructionsList,
      relatedDocuments: List<String>.from(json['relatedDocuments']),
      distributionList: List<String>.from(json['distributionList']),
    );
  }
}

class WorkInstruction {
  final int stepNumber;
  final String procedure;
  final List<String> responsibility;

  WorkInstruction({
    required this.stepNumber,
    required this.procedure,
    required this.responsibility,
  });

  factory WorkInstruction.fromJson(Map<String, dynamic> json) {
    return WorkInstruction(
      stepNumber: json['stepNumber'],
      procedure: json['procedure'],
      responsibility: List<String>.from(json['responsibility']),
    );
  }
}
