import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {

  CollectionReference _transactionRef = FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try{
      _transactionRef.add({
        'destination' : transactionModel.destination.toJson(),
        'amountOfTraveler' : transactionModel.amountOfTraveler,
        'selectedSeat' : transactionModel.selectedSeats,
        'insurance' : transactionModel.insurance,
        'refundable': transactionModel.refundable,
        'vat': transactionModel.vat,
        'price': transactionModel.price,
        'grandTotal': transactionModel.grandTotal,
      });
    } catch (e){
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await _transactionRef.get();
      List<TransactionModel> transactions = result.docs.map((e){
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transactions;
    } catch (e){
      throw e;
    }
  }
}