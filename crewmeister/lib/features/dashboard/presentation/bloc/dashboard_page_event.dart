part of 'dashboard_page_bloc.dart';

sealed class DashboardPageEvent extends Equatable {
  //
}

class DashboardPageInitialEvent extends DashboardPageEvent {
  final bool? isFromReset;
  DashboardPageInitialEvent({
    required this.isFromReset
  });
  @override
  List<Object?> get props => [
    isFromReset,
  ];
}

class AbsenceTypeTapEvent extends DashboardPageEvent {
  final String? selectedValue;
  final List<AbsencesPayload> absencesCopyData;
  final String? selectedDate;
  final int pageNumber;
  final int pageSize;
  AbsenceTypeTapEvent({
    required this.selectedValue,
    required this.absencesCopyData,
    required this.selectedDate,
    required this.pageNumber,
    required this.pageSize,
  });

  @override
  List<Object?> get props => [
        selectedValue,
        absencesCopyData,
        selectedDate,
        pageNumber,
        pageSize,
      ];
}

class DatePickerTapEvent extends DashboardPageEvent {
  final String? selectedValue;
  final String? selectedDate;
  final List<AbsencesPayload> absencesCopyData;
  final int pageNumber;
  final int pageSize;
  DatePickerTapEvent({
    required this.selectedValue,
    required this.absencesCopyData,
    required this.selectedDate,
    required this.pageNumber,
    required this.pageSize,
  });

  @override
  List<Object?> get props => [
        selectedValue,
        absencesCopyData,
        selectedDate,
        pageNumber,
        pageSize,
      ];
}

class LoadMoreEvent extends DashboardPageEvent {
  final String? selectedValue;
  final String? selectedDate;
  final List<AbsencesPayload> absencesCopyData;
  final int pageNumber;
  final int pageSize;
  final List<AbsencesPayload> absencesDetails;
  final List<AbsencesPayload> absencesTypeList;
  final List<MemberPayload> memberPayload;
  LoadMoreEvent({
    required this.selectedValue,
    required this.absencesCopyData,
    required this.selectedDate,
    required this.pageNumber,
    required this.pageSize,
    required this.absencesDetails,
    required this.absencesTypeList,
    required this.memberPayload,
  });

  @override
  List<Object?> get props => [
        selectedValue,
        absencesCopyData,
        selectedDate,
        pageNumber,
        pageSize,
        absencesDetails,
        absencesTypeList,
        memberPayload,
      ];
}
