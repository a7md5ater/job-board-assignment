import 'package:cloud_firestore/cloud_firestore.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/job_details/data/models/job_application_model.dart';
import '../../features/post_job/data/models/job_data.dart';
import 'collections_keys.dart';

abstract class FirebaseDatabase {
  Future<void> addUserToFirestore({required UserModel user});
  Future<UserModel> getCurrentUser({required String id});
  Future<void> postNewJob({required String userId, required JobData jobData});
  Future<void> updateJob({required String userId, required JobData jobData});
  Future<void> deleteJob({required String userId, required String jobId});

  Stream<QuerySnapshot<Map<String, dynamic>>> getJobs({required String userId});
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllJobs();

  Future<List<UserModel>> getJobSeekers();
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobSeekerJobs();
  Future<void> applyForJob({
    required JobData jobData,
    required JobApplicationModel application,
  });
  Future<List<JobData>> getSubmittedJobs({required String userId});
  Future<List<String>> getSubmittedApplicationsFromAllJobs({
    required String jobId,
  });
  Future<List<JobApplicationModel>> getSubmittedApplicationsFromAdminJobs({
    required String userId,
    required String jobId,
  });
}

class FirebaseDatabaseImpl implements FirebaseDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> addUserToFirestore({required UserModel user}) {
    return _db.collection(Collections.users).doc(user.id).set(user.toJson());
  }

  @override
  Future<UserModel> getCurrentUser({required String id}) async {
    final result = await _db.collection(Collections.users).doc(id).get();
    UserModel user = UserModel.fromJson(result.data()!);
    return user;
  }

  @override
  Future<void> postNewJob({
    required String userId,
    required JobData jobData,
  }) async {
    await _db
        .collection(Collections.users)
        .doc(userId)
        .collection(Collections.postedJobs)
        .doc(jobData.id)
        .set(jobData.toJson());

    await _db
        .collection(Collections.allJobs)
        .doc(jobData.id)
        .set(jobData.toJson());
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobs({
    required String userId,
  }) {
    return _db
        .collection(Collections.users)
        .doc(userId)
        .collection(Collections.postedJobs)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<void> updateJob({
    required String userId,
    required JobData jobData,
  }) async {
    await _db
        .collection(Collections.users)
        .doc(userId)
        .collection(Collections.postedJobs)
        .doc(jobData.id)
        .update(jobData.toJson());
    await _db
        .collection(Collections.allJobs)
        .doc(jobData.id)
        .update(jobData.toJson());
  }

  @override
  Future<void> deleteJob({
    required String userId,
    required String jobId,
  }) async {
    await _db
        .collection(Collections.users)
        .doc(userId)
        .collection(Collections.postedJobs)
        .doc(jobId)
        .delete();
    await _db.collection(Collections.allJobs).doc(jobId).delete();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllJobs() {
    return _db
        .collection(Collections.allJobs)
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<List<UserModel>> getJobSeekers() async {
    final result =
        await _db
            .collection(Collections.users)
            .where('role', isEqualTo: 'jobSeeker')
            .get();
    return result.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobSeekerJobs() {
    return _db
        .collection(Collections.allJobs)
        .where('status', isEqualTo: 'open')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Future<void> applyForJob({
    required JobData jobData,
    required JobApplicationModel application,
  }) async {
    await _db
        .collection(Collections.users)
        .doc(application.userId)
        .collection(Collections.submittedApplications)
        .doc(jobData.id)
        .set(jobData.toJson());

    await _db
        .collection(Collections.users)
        .doc(jobData.createdById)
        .collection(Collections.postedJobs)
        .doc(jobData.id)
        .collection(Collections.submittedApplications)
        .doc(application.userId)
        .set(application.toJson());

    await _db
        .collection(Collections.allJobs)
        .doc(jobData.id)
        .collection(Collections.submittedApplications)
        .doc(application.userId)
        .set(application.toJson());
  }

  @override
  Future<List<JobData>> getSubmittedJobs({required String userId}) async {
    final response =
        await _db
            .collection(Collections.users)
            .doc(userId)
            .collection(Collections.submittedApplications)
            .get();

    return response.docs.map((doc) => JobData.fromJson(doc.data())).toList();
  }

  @override
  Future<List<String>> getSubmittedApplicationsFromAllJobs({
    required String jobId,
  }) async {
    final response =
        await _db
            .collection(Collections.allJobs)
            .doc(jobId)
            .collection(Collections.submittedApplications)
            .get();

    return response.docs.map((doc) => doc.id).toList();
  }

  @override
  Future<List<JobApplicationModel>> getSubmittedApplicationsFromAdminJobs({
    required String userId,
    required String jobId,
  }) async {
    final response =
        await _db
            .collection(Collections.users)
            .doc(userId)
            .collection(Collections.postedJobs)
            .doc(jobId)
            .collection(Collections.submittedApplications)
            .get();
    return response.docs
        .map((doc) => JobApplicationModel.fromJson(doc.data()))
        .toList();
  }
}
