import 'package:box_controller/models/Day.dart';
import 'package:box_controller/models/Week.dart';
import 'package:box_controller/services/weeks_Services.dart';
import 'package:get/get.dart';

class WeeksController  extends GetxController{
  final   WeeksServices _weeksServices = WeeksServices(); 
  RxList<Weeks> weeks =    <Weeks>[].obs; 
  RxList<Weeks> filteredWeeks = <Weeks>[].obs; 
  RxBool isLoading = false.obs; 
  
  @override
  void onInit(){
    super.onInit();
    fetchWeeks();
  }
  
  void fetchWeeks() async{
    isLoading.value = true;
    try{
      weeks.value = await _weeksServices.getAllWeeks();
      weeks.sort((a, b) => (a.status ?? "").compareTo(b.status ?? ""));
      filteredWeeks.value = weeks; 
    }catch (e){
      Get.snackbar('Error', 'No se puedieron cargar las semanas');
    }finally{
      isLoading.value= false; 
    }
  }

  Future<void>  addWeeks(Weeks  weeks) async{
    try{
      isLoading.value= true; 
      await _weeksServices.saveWeeks(weeks);
      fetchWeeks();      
    }catch(e){
      Get.snackbar("Error", "No se pudo realizar la operacion");
    }finally{
      isLoading.value= false; 
    }
  }


  Future<void> updateDayWeeks(Day day) async{
    try{
      isLoading.value=true; 
      Weeks? getWeek =  getWeeks(day); 
      if(getWeek != null){
        await _weeksServices.updateDay(getWeek.startDate.toIso8601String(), day); 
        
      }else{
          Weeks newWeek = Weeks(
          startDate: day.date,     
          status: 'pendiente',
        );

        String newWeekId = await _weeksServices.saveWeeks(newWeek);
        await _weeksServices.updateDay(newWeekId, day);

      }
    }catch(e){
      Get.snackbar("Error", "No es posible realizar la operacion");
    }finally{
      isLoading.value=false; 
    }
  }

  Weeks? getWeeks(Day day) {
    for (var w in weeks) {
      final isDateOK = w.startDate.isAfter(day.date) || w.startDate.isAtSameMomentAs(day.date);
      if (isDateOK && w.status == 'pendiente') {
        return w;
      }
    }
    return null;
  }
}