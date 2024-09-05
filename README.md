Contrato Vulnerable: VulnerableContract.sol
Explicación de la vulnerabilidad:
1.	Visibilidad mal usada: La función withdraw es external, lo que significa que cualquier cuenta externa puede llamar a esta función y retirar fondos del contrato. Debería haberse definido como una función internal o protegida con algún control de acceso (como un modifier de solo propietario).
2.	Falta de control de acceso: No se verifica quién puede retirar fondos. Esto permite que cualquier persona que interactúe con el contrato lo vacíe.

Contrato Atacante: AttackerContract.sol
Explicación del ataque:
1.	El atacante despliega su contrato y lo conecta con la dirección del contrato vulnerable.
2.	Luego, el atacante llama a la función attack, que a su vez llama a la función withdraw del contrato vulnerable.
3.	Dado que la función withdraw no está protegida, el atacante puede retirar fondos a su propia dirección sin ninguna restricción.
