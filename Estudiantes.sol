// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private _nombre;
    mapping(string => uint) private _notas_materias;
    address private _docente;
    string private _curso;
    string private _apellido;
    int private nota;
    bool private _aprobado;
    int _promedio;
    string[] private materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        //_docente = docente_;
        _docente = msg.sender;
        
    }
    function apellido() public view returns (string memory){
        return _apellido;
    }
    function nombre_completo() public view returns (string memory){
        return _nombre;
    }
    function curso() public view returns (string memory){
        return _curso;
    }
    function set_nota_materias(string memory materia, uint t) public{
        require(msg.sender == _docente, "Solo el docente puede setear notas");
        _notas_materias[materia] = t;
        materias.push(materia);
    }
    function get_nota(string memory materia_) public view returns (uint){
        return _notas_materias[materia_];
    }

    function aprobado() public view returns (bool){
        if(nota<6){
            return false;
        }
        else{
            return true;
        }
    }
    function promedio() public view returns (uint){
        uint notas;
        uint division = 0;
        uint long = materias.length;
        for (uint i; i<= long; i++){
            notas += _notas_materias[materias[i]];
            division++;
        }
        return notas/long;
    }
}

//_notas_materias["lengua"] = 9;
//_notas_materias["mat"] = 3;

//{
//    "lengua": 9,
//    "mat": 3
//}

//_notas_materias["lengua"] < 9 