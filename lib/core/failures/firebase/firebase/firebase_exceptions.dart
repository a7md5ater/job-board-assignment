import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_exceptions.freezed.dart';

@freezed
class FirebaseExceptionHandler with _$FirebaseExceptionHandler {
  const factory FirebaseExceptionHandler.noInternetConnection() =
      NoInternetConnection;
  const factory FirebaseExceptionHandler.aborted() = Aborted;
  const factory FirebaseExceptionHandler.alreadyExists() = AlreadyExists;
  const factory FirebaseExceptionHandler.cancelled() = Cancelled;
  const factory FirebaseExceptionHandler.dataLoss() = DataLoss;
  const factory FirebaseExceptionHandler.deadLineExceeded() = DeadLineExceeded;
  const factory FirebaseExceptionHandler.failedPrecondition() =
      FailedPrecondition;
  const factory FirebaseExceptionHandler.internal() = Internal;
  const factory FirebaseExceptionHandler.invalidArgument() = InvalidArgument;
  const factory FirebaseExceptionHandler.notFound() = NotFound;
  const factory FirebaseExceptionHandler.ok() = Ok;
  const factory FirebaseExceptionHandler.outOfRange() = OutOfRange;
  const factory FirebaseExceptionHandler.permissionDenied() = PermissionDenied;
  const factory FirebaseExceptionHandler.resourceExhausted() =
      ResourceExhausted;

  const factory FirebaseExceptionHandler.unauthenticated() = Unauthenticated;
  const factory FirebaseExceptionHandler.unavailable() = Unavailable;
  const factory FirebaseExceptionHandler.unimplemented() = Unimplemented;
  const factory FirebaseExceptionHandler.unknown() = Unknown;
  const factory FirebaseExceptionHandler.undefined() = Undefined;
  const factory FirebaseExceptionHandler.objectNotFound() = ObjectNotFound;
  const factory FirebaseExceptionHandler.bucketNotFound() = BucketNotFound;
  const factory FirebaseExceptionHandler.projectNotFound() = ProjectNotFound;
  const factory FirebaseExceptionHandler.quotaExceeded() = QuotaExceeded;
  const factory FirebaseExceptionHandler.unauthorized() = Unauthorized;
  const factory FirebaseExceptionHandler.retryLimitExceeded() =
      RetryLimitExceeded;
  const factory FirebaseExceptionHandler.invalidChecksum() = InvalidChecksum;

  const factory FirebaseExceptionHandler.invalidEventName() = InvalidEventName;
  const factory FirebaseExceptionHandler.invalidUrl() = InvalidUrl;

  const factory FirebaseExceptionHandler.noDefaultBucket() = NoDefaultBucket;
  const factory FirebaseExceptionHandler.cannotSliceBlob() = CannotSliceBlob;
  const factory FirebaseExceptionHandler.serverFileWrongSize() =
      ServerFileWrongSize;
  static FirebaseExceptionHandler handleException(e) {
    FirebaseExceptionHandler status;
    switch (e.code) {
      case "aborted":
        status = const FirebaseExceptionHandler.aborted();
        break;
      case "no-internet-connection":
        status = const FirebaseExceptionHandler.noInternetConnection();
        break;
      case "already-exists":
        status = const FirebaseExceptionHandler.alreadyExists();
        break;
      case "cancelled":
        status = const FirebaseExceptionHandler.cancelled();
        break;
      case "data-loss":
        status = const FirebaseExceptionHandler.dataLoss();
        break;
      case "deadline-exceeded":
        status = const FirebaseExceptionHandler.deadLineExceeded();
        break;
      case "failed-precondition":
        status = const FirebaseExceptionHandler.failedPrecondition();
        break;
      case "internal":
        status = const FirebaseExceptionHandler.internal();
        break;
      case "invalid-argument":
        status = const FirebaseExceptionHandler.invalidArgument();
        break;
      case "not-found":
        status = const FirebaseExceptionHandler.notFound();
        break;
      case "ok":
        status = const FirebaseExceptionHandler.ok();
        break;
      case "out-of-range":
        status = const FirebaseExceptionHandler.outOfRange();
        break;
      case "permission-denied":
        status = const FirebaseExceptionHandler.permissionDenied();
        break;
      case "resource-exhausted":
        status = const FirebaseExceptionHandler.resourceExhausted();
        break;
      case "unauthenticated":
        status = const FirebaseExceptionHandler.unauthenticated();
        break;
      case "unavailable":
        status = const FirebaseExceptionHandler.unavailable();
        break;
      case "unimplemented":
        status = const FirebaseExceptionHandler.unimplemented();
        break;
      case "unknown":
        status = const FirebaseExceptionHandler.unknown();
        break;
      case "storage/unknown":
        status = const FirebaseExceptionHandler.unknown();
        break;
      case "storage/no-internet-connection":
        status = const FirebaseExceptionHandler.noInternetConnection();
        break;
      case "storage/object-not-found":
        status = const FirebaseExceptionHandler.objectNotFound();
        break;
      case "storage/bucket-not-found":
        status = const FirebaseExceptionHandler.bucketNotFound();
        break;
      case "storage/project-not-found":
        status = const FirebaseExceptionHandler.projectNotFound();
        break;
      case "storage/quota-exceeded":
        status = const FirebaseExceptionHandler.quotaExceeded();
        break;
      case "storage/unauthenticated":
        status = const FirebaseExceptionHandler.unauthenticated();
        break;
      case "storage/unauthorized":
        status = const FirebaseExceptionHandler.unauthorized();
        break;
      case "storage/retry-limit-exceeded":
        status = const FirebaseExceptionHandler.retryLimitExceeded();
        break;
      case "storage/invalid-checksum":
        status = const FirebaseExceptionHandler.invalidChecksum();
        break;
      case "storage/canceled":
        status = const FirebaseExceptionHandler.cancelled();
        break;
      case "storage/invalid-event-name":
        status = const FirebaseExceptionHandler.invalidEventName();
        break;
      case "storage/invalid-url":
        status = const FirebaseExceptionHandler.invalidUrl();
        break;
      case "storage/invalid-argument":
        status = const FirebaseExceptionHandler.invalidArgument();
        break;
      case "storage/no-default-bucket":
        status = const FirebaseExceptionHandler.noDefaultBucket();
        break;
      case "storage/cannot-slice-blob":
        status = const FirebaseExceptionHandler.cannotSliceBlob();
        break;
      case "storage/server-file-wrong-size":
        status = const FirebaseExceptionHandler.serverFileWrongSize();
        break;
      default:
        status = const FirebaseExceptionHandler.undefined();
    }

    return status;
  }

  static String generateExceptionMessage(
    FirebaseExceptionHandler FirebaseExceptionHandler,
  ) {
    String errorMessage = "";

    FirebaseExceptionHandler.when(
      noInternetConnection:
          () =>
              errorMessage =
                  "There is no internet connection , please check your connection and try again later.",
      aborted:
          () =>
              errorMessage =
                  "The operation was aborted, typically due to a concurrency issue like transaction aborts, etc.",
      alreadyExists: () => errorMessage = "Already exists.",
      cancelled:
          () =>
              errorMessage =
                  "The operation was cancelled (typically by the caller).",
      dataLoss: () => errorMessage = "Unrecoverable data loss or corruption.",
      deadLineExceeded:
          () =>
              errorMessage =
                  "Deadline expired before operation could complete.",
      failedPrecondition:
          () =>
              errorMessage =
                  "Operation was rejected because the system is not in a state required for the operation's execution.",
      internal: () => errorMessage = "Internal errors.",
      invalidArgument:
          () => errorMessage = "Client specified an invalid argument.",
      notFound: () => errorMessage = "Some requested document was not found.",
      ok: () => errorMessage = "The operation completed successfully.",
      outOfRange:
          () => errorMessage = "Operation was attempted past the valid range.",
      permissionDenied:
          () =>
              errorMessage =
                  "The caller does not have permission to execute the specified operation.",
      resourceExhausted:
          () =>
              errorMessage =
                  "Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space.",
      unauthenticated:
          () =>
              errorMessage =
                  "The request does not have valid authentication credentials for the operation.",
      unavailable: () => errorMessage = "The service is currently unavailable.",
      unimplemented:
          () =>
              errorMessage =
                  "Operation is not implemented or not supported/enabled.",
      unknown:
          () =>
              errorMessage =
                  "Unknown error or an error from a different error domain.",
      undefined: () => errorMessage = "Undefined error occurs",

      objectNotFound:
          () => errorMessage = "No object exists at the desired reference.",
      bucketNotFound:
          () => errorMessage = "No bucket is configured for Cloud Storage",
      projectNotFound:
          () => errorMessage = "No project is configured for Cloud Storage",
      quotaExceeded:
          () =>
              errorMessage =
                  "Quota on your Cloud Storage bucket has been exceeded. If you're on the no-cost tier, upgrade to a paid plan. If you're on a paid plan, reach out to Firebase support.",
      unauthorized:
          () =>
              errorMessage =
                  "User is not authorized to perform the desired action, check your security rules to ensure they are correct.",
      retryLimitExceeded:
          () =>
              errorMessage =
                  "The maximum time limit on an operation (upload, download, delete, etc.) has been exceeded. Try uploading again.",
      invalidChecksum:
          () =>
              errorMessage =
                  "File on the client does not match the checksum of the file received by the server. Try uploading again.",

      invalidEventName:
          () =>
              errorMessage =
                  "Invalid event name provided. Must be one of [running, progress, pause]",
      invalidUrl: () => errorMessage = "Invalid URL provided to refFromURL().",
      noDefaultBucket:
          () =>
              errorMessage =
                  "No bucket has been set in your config's storageBucket property.",
      cannotSliceBlob:
          () =>
              errorMessage =
                  "Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn't changed.",
      serverFileWrongSize:
          () =>
              errorMessage =
                  "File on the client does not match the size of the file received by the server. Try uploading again.",
    );
    return errorMessage;
  }
}
