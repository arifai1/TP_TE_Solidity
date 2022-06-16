// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Estudiante{
    //Opcional a. Lo que haria seria hacer un array de mappings que permita el ingreso de las notas de los 4 biemestres.
    string private _nombre;
    address private _docente;
    string private _curso;
    string private _apellido;
    bool private _aprobado;
    int _promedio;
    string[] private materias;
    mapping(string => uint) private _notas_materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        //_docente = docente_;
        _docente = msg.sender;
        
    }
    // Opcional b. Para poder hacer el opcional b se me ocurre que podríamos crear un array de tipo 
    // address en el que pongamos como primer item al msg.sender. Luego crearía una funcion 
    // set_otrosprofesores para que el owner pueda agregar nuevos docentes a la lista creada previamente 
    // Esto lo haria ingresando las address de cada profesor. Luego 
    // haría un for en el que recorra todo el array y un if para ver si ese docente está en ese array o no.
    // El if me va a devolver un True o False.
    // Lo haria con el require(funcion(msg.sender)) y así poder ver si esta permitido que ingrese las notas.
    
    //_docentes_permitidos = [msg.sender]

     function apellido() public view returns (string memory){
         return _apellido;
     }
     function nombre_completo() public view returns (string memory){
        return string.concat (_nombre, _apellido);    

    // function nombre_apellido(string memory nombre_, string memory apellido_) public view returns (string memory) {
    //     return nombre_apellido(nombre_, apellido_);
    }

    function curso() public view returns (string memory){
        return _curso;
    }


    function set_nota_materias(string memory materia, uint t) public{
        require(msg.sender == _docente, "Solo el docente puede setear notas");
        _notas_materias[materia] = t;
        materias.push(materia);
    }

    function nota_materia(string memory materia_) public view returns (uint){
        return _notas_materias[materia_];
    }

    function aprobo(string memory materia_) public view returns (bool){
        if(_notas_materias[materia_]<60){
            return false;
        }
        else{
            return true;
        }
    }

    function promedio() public view returns (uint){
        uint suma;
        uint prom;  
        for (uint i=0; i< materias.length; i++){
            suma += _notas_materias[materias[i]];
        }
        prom = suma/materias.length;
        return prom;
    }
}

//_notas_materias["lengua"] = 9;
//_notas_materias["mat"] = 3;

//{
//    "lengua": 9,
//    "mat": 3
//}

//_notas_materias["lengua"] < 9 

// for (uint i=0; i< materias.length; i++){
//                 if (materia != materias[i]){
//                      materias.push(materia);
//                 }
//                 else{
//                     materia.push(_notas_materias);
//                 }
//         }