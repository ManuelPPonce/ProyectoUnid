import 'package:flutter/material.dart';
import 'package:proyecto_gestion/src/pages/registro_page.dart';

class AgregarCita extends StatefulWidget {
  AgregarCita({Key key}) : super(key: key);

  @override
  _AgregarCitaState createState() => _AgregarCitaState();
}

class _AgregarCitaState extends State<AgregarCita> {
  String nombreC, apellidoC, emailC, telefonoC, fechaC;

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Cita'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _nombreC(),
          Divider(),
          _apellidoP(),
          Divider(),
          _apellidoM(),
          Divider(),
          _email(),
          Divider(),
          _telefono(),
          Divider(),
          _fechaC(context),
        ],
      ),
    );
  }

  Widget _nombreC() {
    //TextFiel trabaja mejor independiente

    //TextFormFiel Trabaja mejor para validar formularios

    return TextField(
      //autofocus: true,

      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Nombre',
        labelText: 'Nombre',
      ),
      onChanged: (valor) {
        setState(() {
          nombreC = valor;
        });
      },
    );
  }

  Widget _apellidoP() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Apellido Paterno',
        labelText: 'Apellido Paterno',
      ),
      onChanged: (valor) {
        setState(() {
          nombreC = valor;
        });
      },
    );
  }

  Widget _apellidoM() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Apellido Materno',
        labelText: 'Apellido Materno',
      ),
      onChanged: (valor) {
        setState(() {
          apellidoC = valor;
        });
      },
    );
  }

  Widget _email() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'ejemplo@gmail.com',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email)),
      onChanged: (valor) {
        setState(() {
          emailC = valor;
        });
      },
    );
  }

  Widget _telefono() {
    return TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Telefono',
          labelText: 'Telefono',
          suffixIcon: Icon(Icons.phone)),
      onChanged: (valor) {
        setState(() {
          telefonoC = valor;
        });
      },
    );
  }

  Widget _fechaC(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de cita',
        labelText: 'Fecha de cita',
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate(context);
      },
    );
  }

  _selecDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );
    if (picked != null) {
      setState(() {
        fechaC = picked.toString();
        _inputFieldDateController.text = fechaC;
      });
    }
  }
}
