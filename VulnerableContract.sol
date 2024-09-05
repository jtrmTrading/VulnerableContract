// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableContract {
    // Esta función debería ser interna para que solo el contrato pueda llamarla.
    // Al marcarla como external, cualquier cuenta externa puede llamarla.
    function withdraw(uint _amount) external {
        require(_amount <= address(this).balance, "Insufficient funds");
        // Vulnerabilidad: el remitente puede ser cualquier dirección que llame a la función externa.
        // Debería verificarse que solo el propietario pueda retirar fondos.
        payable(msg.sender).transfer(_amount);
    }

    // Función pública sin validación adecuada de acceso
    function deposit() public payable {
        // Cualquiera puede depositar ETH en el contrato.
    }
}
