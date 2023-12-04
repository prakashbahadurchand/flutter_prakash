import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
// For Post Notification, Location,

class PermissionManager {
  // Base Functions

  static Future<bool> requestPermissionUI(
      BuildContext context, Permission permission) async {
    final status = await permission.request();

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      // Show rationale dialog if permission is denied but not permanently
      final shouldShowRationale = await permission.shouldShowRequestRationale;
      if (shouldShowRationale) {
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Permission Required'),
              content: const Text(
                  'This permission is required to perform this action.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Open Settings'),
                ),
              ],
            ),
          );
        }
        return false;
      } else {
        // Permission denied permanently, open app settings
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Permission Required'),
              content: const Text(
                  'Please grant the necessary permission in the app settings.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    await openAppSettings();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Open Settings'),
                ),
              ],
            ),
          );
        }
        return false;
      }
    }

    return false; // Permission denied by the user
  }

  static Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  static Future<bool> requestMultiplePermissions(
      List<Permission> permissions) async {
    final statuses = await permissions.request();
    return statuses.values.every((status) => status.isGranted);
  }

  static Future<bool> checkPermissionStatus(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }

  static Future<bool> checkMultiplePermissionStatuses(
      List<Permission> permissions) async {
    final statuses =
        await Future.wait(permissions.map((permission) => permission.status));
    return statuses.every((status) => status.isGranted);
  }

// Portable Functions

// Create check for camera, gallery file pick permission here code...
}
