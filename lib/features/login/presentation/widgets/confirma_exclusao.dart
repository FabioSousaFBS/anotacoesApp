import 'package:flutter/material.dart';

class ConfirmaExclusao extends StatefulWidget {
  const ConfirmaExclusao({super.key});

  @override
  State<ConfirmaExclusao> createState() => _ConfirmaExclusaoState();
}

class _ConfirmaExclusaoState extends State<ConfirmaExclusao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Column(          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Confirma a exclusão?", style: TextStyle(fontSize: 22,)),            
            ElevatedButton(
              onPressed: (){                
                Navigator.pop(context, true);
              },              
              child: Text("Confirmar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent)
            ),
            ElevatedButton(
              onPressed: (){                
                Navigator.pop(context, false);
              },              
              child: Text("Cancelar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey)
            )
          ],

        ),
      ),
    );
  }
}
