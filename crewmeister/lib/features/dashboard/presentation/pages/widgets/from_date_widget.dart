import 'package:crewmeister/features/dashboard/presentation/bloc/dashboard_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FromDateWidget extends StatelessWidget {
  final DashboardPageState state;
  const FromDateWidget(
      {super.key, required this.fromDateController, required this.state});
  final TextEditingController fromDateController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fromDateController,
      readOnly: true,
      decoration: const InputDecoration(
        suffixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(),
      ),
      onTap: () {
        fromDateSelect(context);
      },
    );
  }

  Future fromDateSelect(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        initialDate: DateTime.now(),
        context: context,
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      fromDateController.text = DateFormat('dd-MMM-yyyy').format(pickedDate);
      String selecteddate = DateFormat('yyyy-MM-dd').format(pickedDate);
      // ignore: use_build_context_synchronously
      BlocProvider.of<DashboardPageBloc>(context).add(
        DatePickerTapEvent(
          selectedValue: state.selectedAbsenceType ?? '',
          absencesCopyData: state.absencesCopyData,
          selectedDate: selecteddate,
          pageNumber: 0,
          pageSize: 0,
        ),
      );
    } 
  }
}
