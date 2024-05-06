import 'dart:convert';

import 'package:crewmeister/core/resources/constants.dart';
import 'package:crewmeister/core/services/fixture_reader.dart';
import 'package:crewmeister/features/dashboard/data/models/absences_response_model.dart';
import 'package:crewmeister/features/dashboard/data/models/member_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_page_event.dart';
part 'dashboard_page_state.dart';

class DashboardPageBloc extends Bloc<DashboardPageEvent, DashboardPageState> {
  DashboardPageBloc()
      : super(const DashboardPageState(
          dashboardViewState: DashboardViewState.loading,
          absencesCopyData: [],
          absencesTypeList: [],
          absencesDetails: [],
          memberPayload: [],
          selectedDate: '',
          pageNumber: 0,
          pageSize: 0,
        )) {
    ///On page & on clicking rest option load set the necessary details for the page
    on<DashboardPageInitialEvent>(((event, emit) async {
      List<AbsencesPayload> absencesCopyData = [];
      List<AbsencesPayload> absencesTypeList = [];
      List<AbsencesPayload> absencesDetails = [];
      List<MemberPayload> memberPayload = [];

      ///
      const String absenceJson = 'absences.json';
      final String jsonMapData = await readJsonFile2(absenceJson);
      AbsencesResponseModel absencesJsonModel =
          AbsencesResponseModel.fromJson((json.decode(jsonMapData)));

      ///
      const String membersJson = 'members.json';
      final String membersMapData = await readJsonFile2(membersJson);
      MemberResponseModel membersJsonModel =
          MemberResponseModel.fromJson((json.decode(membersMapData)));
      memberPayload = membersJsonModel.payload ?? [];

      ///
      absencesCopyData = absencesJsonModel.payload ?? [];
      var seen = <String>{};
      absencesDetails = absencesJsonModel.payload ?? [];
      absencesTypeList = absencesDetails
          .where((absenceDetails) => seen.add(absenceDetails.type ?? ''))
          .toList();

      absencesTypeList.insert(0, AbsencesPayload(type: 'All'));

      ///load thee first 10 items for the UI
      absencesDetails = [];
      for (int a = 0; a < Constants.pageSize; a++) {
        absencesDetails.add(absencesCopyData[a]);
      }

      /// added future delay to give the efect of API call and loader
      await Future.delayed(
          Duration(seconds: (event.isFromReset ?? false) ? 0 : 5), () {
        emit(
          DashboardPageState(
            dashboardViewState: DashboardViewState.loaded,
            absencesResponseModel: absencesJsonModel,
            absencesCopyData: absencesCopyData,
            absencesTypeList: absencesTypeList,
            absencesDetails: absencesDetails,
            memberPayload: memberPayload,
            selectedDate: '',
            pageNumber: 0,
            pageSize: 10,
          ),
        );
      });
    }));

    ///Logic on tap and select the abseces type dropdown
    on<AbsenceTypeTapEvent>(((event, emit) async {
      List<AbsencesPayload> searchedGroup = [];
      List<AbsencesPayload> tempGroup = event.absencesCopyData;
      List<AbsencesPayload> resultData = [];

      String selectedValue = (event.selectedValue ?? '').toLowerCase();
      searchedGroup = tempGroup
          .where((o) => (o.type ?? '').contains(selectedValue.toLowerCase()))
          .toList();

      if (selectedValue.isEmpty || selectedValue.contains('all')) {
        resultData = event.absencesCopyData;
      } else {
        resultData = searchedGroup;
      }

      String selectedDateValue = (event.selectedDate ?? '');
      resultData = resultData
          .where((o) => (o.startDate ?? '').contains(selectedDateValue))
          .toList();

      emit(
        DashboardPageState(
          dashboardViewState: DashboardViewState.loaded,
          absencesCopyData: event.absencesCopyData,
          absencesTypeList: state.absencesTypeList,
          selectedAbsenceType: selectedValue,
          absencesDetails: resultData,
          memberPayload: state.memberPayload,
          selectedDate: event.selectedDate,
          pageNumber: event.pageNumber,
          pageSize: event.pageSize,
        ),
      );
    }));

    ///On tap of date option and handling its logic
    on<DatePickerTapEvent>(((event, emit) async {
      List<AbsencesPayload> searchedGroup = [];
      List<AbsencesPayload> tempGroup = event.absencesCopyData;
      List<AbsencesPayload> resultData = [];

      String selectedValue = (event.selectedValue ?? '').toLowerCase();
      searchedGroup = tempGroup
          .where((o) => (o.type ?? '').contains(selectedValue.toLowerCase()))
          .toList();

      if (selectedValue.isEmpty || selectedValue.contains('all')) {
        resultData = event.absencesCopyData;
      } else {
        resultData = searchedGroup;
      }

      String selectedDateValue = (event.selectedDate ?? '');
      resultData = resultData
          .where((o) => (o.startDate ?? '').contains(selectedDateValue))
          .toList();

      ///
      emit(
        DashboardPageState(
          dashboardViewState: DashboardViewState.loaded,
          absencesCopyData: event.absencesCopyData,
          absencesTypeList: state.absencesTypeList,
          selectedAbsenceType: selectedValue,
          absencesDetails: resultData,
          memberPayload: state.memberPayload,
          selectedDate: event.selectedDate,
          pageNumber: event.pageNumber,
          pageSize: event.pageSize,
        ),
      );
    }));

    /// load more logics
    on<LoadMoreEvent>(((event, emit) async {
      emit(
        DashboardPageState(
          dashboardViewState: DashboardViewState.loading,
          absencesCopyData: event.absencesCopyData,
          absencesTypeList: event.absencesTypeList,
          absencesDetails: event.absencesDetails,
          memberPayload: event.memberPayload,
          selectedDate: event.selectedValue,
          pageNumber: event.pageNumber,
          pageSize: event.pageSize,
        ),
      );

      await Future.delayed(const Duration(seconds: 3), () {
        List<AbsencesPayload> absencesDetails = event.absencesDetails;

        int startingFrom = event.absencesDetails.length;
        for (int a = 0; a < Constants.pageSize; a++) {
          if (startingFrom >= event.absencesCopyData.length) {
            break;
          }
          absencesDetails.add(event.absencesCopyData[a]);
          startingFrom = startingFrom + 1;
        }
        emit(
          DashboardPageState(
            dashboardViewState: DashboardViewState.loaded,
            absencesCopyData: event.absencesCopyData,
            absencesTypeList: event.absencesTypeList,
            absencesDetails: absencesDetails,
            memberPayload: event.memberPayload,
            selectedDate: event.selectedValue,
            pageNumber: event.pageNumber,
            pageSize: event.pageSize,
          ),
        );
      });
    }));
  }
}
