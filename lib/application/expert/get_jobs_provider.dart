import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/controller/expert_add_job_service.dart';
import 'package:skillmaestro/expert/controller/expert_add_shedule_service.dart';
import 'package:skillmaestro/expert/controller/expert_get_all_jobs_service.dart';
import 'package:skillmaestro/expert/controller/my_bookings_service.dart';
import 'package:skillmaestro/expert/model/all_booking_model.dart';
import 'package:skillmaestro/expert/model/booking_reponse_model.dart';
import 'package:skillmaestro/expert/model/expert_add_shedule_model.dart';

class ExpertAllJobsProvider with ChangeNotifier {
  Map<String, dynamic> expertJobs = {};
  Map<String, dynamic> expertSelectedJobs = {};
  Map<String, dynamic> booking = {};

  Map<String, dynamic> response = {};
  Future<Map<String, dynamic>> AllJobsForExpert() async {
    expertJobs = await AllJobService().getAllJobs();
    //log("----------------jobsMap---------$expertJobs");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return expertJobs;
  }

  Future<Map<String, dynamic>> selectedJobsByExpert() async {
    expertSelectedJobs = await AllJobService().getJobsByExpert();
    log("----------------expertjobs---------$expertSelectedJobs");
    notifyListeners();

    /*  FetchAllUsersDetails().fetchAllUsersDetails().then((value) {
      value = usersMap;
      
      return usersMap;
    }); */
    return expertSelectedJobs;
  }

  Future<void> AddExpertSkill(Set<String> skills) async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    await ExpertAddJobService().ExpertAddSkill(skills);

    notifyListeners();
  }

  Future<void> removeExpertSkill(String id) async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    await ExpertAddJobService().removeExpertSkill(id);

    notifyListeners();
  }

  Future<void> AddExpertShedule(
      List<DateTime> dates, BuildContext context) async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    await ExpertAddShedule().AddShedule(dates, context);

    notifyListeners();
  }

  Future<Map<String, dynamic>> GetExpertShedule() async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    Map<String, dynamic> response = await ExpertAddShedule().GetShedule();

    notifyListeners();
    return response;
  }

  Future<Map<String, dynamic>> GetMyBookings() async {
    //log("-----------+++++++++=-----jobsMap---------$skills");
    booking = await MyBookings().getAllBookings();
    log('=================providerbooking======$booking=================');

    notifyListeners();
    return booking;
  }
}
