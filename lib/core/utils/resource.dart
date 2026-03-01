enum ApiStatus{
  initial,
  loading,
  success,
  error;
}

class Resource<E>{
  E? data = null;
  late bool isLoading = false;
  late String? errorMessage;
  late ApiStatus status;

  Resource(this.status, this.data, this.isLoading, this.errorMessage);

  Resource.loading(){
    isLoading = true;
    status = ApiStatus.loading;
  }
  Resource.success(this.data){
    status = ApiStatus.success;
  }
  Resource.error(String error){
    errorMessage = error;
    status = ApiStatus.error;
  }
  Resource.initial(){
    status = ApiStatus.initial;
  }

}