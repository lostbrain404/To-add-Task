// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract ToDoList {
    struct Task {
        string  description ;
        bool    isCopmleted ; 
    }

    mapping(address=>Task[])private Tasks ;

    function addTask(string memory _description )public {
        Tasks[msg.sender].push(Task(_description,false));
    }

    function getTask(uint _index)public  view returns (string memory , bool){
        require(_index<Tasks[msg.sender].length,"Invalid Taks");
        Task memory _task = Tasks[msg.sender][_index];
        return (_task.description , _task.isCopmleted);
    }

    function getAllTasks()public view returns (Task[] memory){
        return Tasks[msg.sender];
    }
}
