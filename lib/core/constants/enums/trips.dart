enum Trips{ONCOMING, COMPLETED, CANCELLED}

getStatus(Trips status){
  switch (status){
    case Trips.ONCOMING:
      return "oncoming";
    case Trips.COMPLETED:
      return "completed";
    case Trips.CANCELLED:
      return "cancelled";
  }
}