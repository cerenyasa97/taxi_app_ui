enum TripStatus{ONCOMING, COMPLETED, CANCELLED}

getStatus(TripStatus status){
  switch (status){
    case TripStatus.ONCOMING:
      return "oncoming";
    case TripStatus.COMPLETED:
      return "completed";
    case TripStatus.CANCELLED:
      return "cancelled";
  }
}