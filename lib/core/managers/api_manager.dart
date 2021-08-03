import 'package:flutter/material.dart';
import 'package:nvme/core/managers/static_data_manager.dart';
import 'package:nvme/ui/helper/app_colors.dart';

class APIDataManager {
  // static List generateDepartmentList({@required dynamic depatments}) {
  //   debugPrint("districts==>$depatments");
  //   List<Values> departmentList = List();
  //   List<String> departmentNames = [];
  //   for (int i = 0; i < depatments.length; i++) {
  //     departmentNames.add(depatments[i]['DepartmentName']);
  //     print(depatments[i]['DepartmentName']);
  //     print(depatments[i]['DepartmentId']);
  //     departmentList.add(
  //       Values(
  //           departmentName: depatments[i]['DepartmentName'],
  //           id: depatments[i]['id'],
  //           departmentId: depatments[i]['DepartmentId']),
  //     );
  //   }
  //   print("District List:$departmentList");
  //   return departmentList;
  // }




  // static List<NotificationItem> generateNotificationList(
  //     {@required dynamic notification}) {
  //   debugPrint("subcategory list ==>$notification");
  //   List<NotificationItem> oieServNotificationList = List();
  //   for (int i = 0; i < notification.length; i++) {
  //     oieServNotificationList.add(NotificationItem.fromJson(notification[i]));
  //   }
  //   return oieServNotificationList;
  // }

  // static List<SparePartItem> generateSparePartsList(
  //     {@required dynamic spareParts}) {
  //   List<SparePartItem> sparePartList = List();
  //   for (int i = 0; i < spareParts.length; i++) {
  //     sparePartList.add(SparePartItem.fromJson(spareParts[i]));
  //   }
  //   return sparePartList;
  // }

  static String getOrderStatus(int orderStatus) {
    switch (orderStatus) {
      case StaticDataManager.orderAssignToServiceProvider:
        return "Assigned";
      case StaticDataManager.orderAcceptedByServiceProvider:
        return "Accepted";
      case StaticDataManager.orderRejectedByServiceProvider:
        return "Pending";
      case StaticDataManager.orderCancelledByAdmin:
      case StaticDataManager.orderCancelledByCustomer:
        return "Cancelled";
      case StaticDataManager.orderRescheduledByUser:
      case StaticDataManager.orderRescheduledByAdmin:
        return "Rescheduled";
      case StaticDataManager.orderInProgress:
        return "In Progress";
      case StaticDataManager.orderAwaitingForSpareParts:
        return "Awating for Spare Parts";
      case StaticDataManager.orderRequestClosedByServiceProvider:
        return "Request Closed";
      case StaticDataManager.orderCompleted:
        return "Order Completed";
      case StaticDataManager.orderFullyPaid:
        return "Fully Paid";
      default:
        return "Order Placed";
    }
  }

  static Color getOrderStatusColor(int orderStatus) {
    switch (orderStatus) {
      case StaticDataManager.orderAcceptedByServiceProvider:
      case StaticDataManager.orderCompleted:
      case StaticDataManager.orderFullyPaid:
        return Colors.green;
      case StaticDataManager.orderCancelledByAdmin:
      case StaticDataManager.orderCancelledByCustomer:
        return Colors.red;
      case StaticDataManager.orderAssignToServiceProvider:
        return AppColor.colorSecondary;
      case StaticDataManager.orderRejectedByServiceProvider:
        return Colors.black45;
      case StaticDataManager.orderRequestClosedByServiceProvider:
        return Colors.brown;
      case StaticDataManager.orderRescheduledByUser:
      case StaticDataManager.orderRescheduledByAdmin:
        return Colors.blue;
    }
  }
}
