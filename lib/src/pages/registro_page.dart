import 'package:flutter/material.dart';
import 'package:proyecto_gestion/src/bloc/login_bloc.dart';
import 'package:proyecto_gestion/src/bloc/provider.dart';
import 'package:proyecto_gestion/src/models/usuario_datos.dart';
import 'package:proyecto_gestion/src/provider/usuario_datos_provider.dart';
import 'package:proyecto_gestion/src/provider/usuario_provider.dart';
import 'package:proyecto_gestion/src/utils/utils.dart';

final usuarioProvider = new UsuarioProvider();
String fecha = '';
final nombre = TextEditingController();
TextEditingController _inputField = new TextEditingController();
Client usuario = new Client();
final usuarioData = new UsuariosDatosProvider();
final formKey = GlobalKey<FormState>();

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }
}

Widget _loginForm(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final bloc = Provider.of(context);

  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            height: 180.0,
          ),
        ),
        Container(
          width: size.width * 0.85,
          margin: EdgeInsets.symmetric(vertical: 30.0),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text(
                'Crear Cuenta',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 60.0,
              ),
              _nombre(),
              Divider(color: Colors.black38),
              SizedBox(height: 30.0),
              _apellido(),
              Divider(color: Colors.black38),
              SizedBox(height: 30.0),
              _date(context),
              Divider(color: Colors.black38),
              SizedBox(height: 30.0),
              _crearEmail(bloc),
              Divider(color: Colors.black38),
              SizedBox(height: 30.0),
              _crearPassword(bloc),
              Divider(color: Colors.black38),
              SizedBox(height: 30.0),
              _crearBoton(bloc),
            ],
          ),
        ),
        FlatButton(
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
            child: Text('¿Ya tienes cuentas?')),
        SizedBox(height: 100.0),
      ],
    ),
  );
}

Widget _date(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextField(
      style: TextStyle(color: Colors.black),
      enableInteractiveSelection: false,
      controller: _inputField,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.calendar_today, color: Colors.deepPurpleAccent),
        hintText: 'Fecha de nacimiento:',
        labelText: 'Fecha de nacimiento:',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate(context);
      },
    ),
  );
}

_selecDate(BuildContext context) async {
  DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1940),
      lastDate: new DateTime(2025));

  if (picked != null) {
    fecha = picked.toString();
    _inputField.text = fecha;
    usuario.fecha = fecha;
  }
}

Widget _apellido() {
  print(usuario.apellido);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      style: TextStyle(color: Colors.black),
      onSaved: (value) => usuario.apellido,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.account_box, color: Colors.deepPurpleAccent),
        hintText: 'Apellido',
        labelText: 'Apellido:',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
      ),
    ),
  );
}

Widget _nombre() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: TextFormField(
      style: TextStyle(color: Colors.black),
      controller: nombre,
      onSaved: (value) => usuario.nombre,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.account_box, color: Colors.deepPurpleAccent),
        hintText: 'Nombre',
        labelText: 'Nombre :',
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
      ),
    ),
  );
}

Widget _crearEmail(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    //initialData: initialData ,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          onSaved: (value) => usuario.correo,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.alternate_email, color: Colors.deepPurpleAccent),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.deepPurpleAccent),
            counterText: snapshot.data,
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        ),
      );
    },
  );
}

Widget _crearPassword(LoginBloc bloc) {
  return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.deepPurpleAccent),
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.grey),
              labelStyle: TextStyle(color: Colors.deepPurpleAccent),
              counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      });
}

Widget _crearBoton(LoginBloc bloc) {
  //formValidStream

  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15.0),
              child: Text('Ingresar'),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          elevation: 0.0,
          disabledColor: Colors.grey,
          color: Colors.deepPurpleAccent,
          textColor: Colors.black,
          onPressed: snapshot.hasData ? () => _register(bloc, context) : null);
    },
  );
}

_register(LoginBloc bloc, BuildContext context) async {
  final info = await usuarioProvider.nuevoUsuario(bloc.email, bloc.password);

  print("El nombre es $nombre");
  formKey.currentState.save();
  if (info['ok']) {
    Navigator.pushReplacementNamed(context, 'login');

    usuarioData.crearUsuario(usuario);
  } else {
    mostrarAlerta(context, info['mensaje']);
  }
  //Navigator.pushReplacementNamed(context, 'home');
}

Widget _crearFondo(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final fondoMorado = Container(
    height: size.height * 0.4,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
      Color.fromRGBO(63, 63, 156, 1.0),
      Color.fromRGBO(90, 70, 178, 1.0),
    ])),
  );

  final circulo = Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Color.fromRGBO(255, 255, 255, 0.05),
    ),
  );

  return Stack(
    children: <Widget>[
      fondoMorado,
      Positioned(top: 90.0, left: 30.0, child: circulo),
      Positioned(top: 200.0, right: 0.0, child: circulo),
      Positioned(bottom: -50.0, left: -10.0, child: circulo),
      Container(
        padding: EdgeInsets.only(top: 80.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 100,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              'Usuario',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            )
          ],
        ),
      )
    ],
  );
}
