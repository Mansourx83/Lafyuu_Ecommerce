import 'package:bloc/bloc.dart';
import 'package:ecommerce_trining/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(int productId)async {

    try {
      emit(ItemAddedLoading());
      final res = await CartRepository().addItemToCart(productId);

      final bool status = res.data['status'];
      final String message = res.data['message'];

      if(status){
       emit(ItemAddSuccesFully());
      }else if(message == "غير مصرح لك"){
       emit(NotAuthorizedInCart());
      }
    } on Exception catch (e) {

    }
  }
}
