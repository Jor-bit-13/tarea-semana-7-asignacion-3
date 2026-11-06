# Configuraciones completas de los dispositivos Cisco

- [R1_running-config.txt](R1_running-config.txt) — R1, c2691, 1284 bytes reportados por IOS, con interfaz FastEthernet0/0, DHCP, ACL y SNMP.
- [SW1_running-config.txt](SW1_running-config.txt) — SW1, c2691 EtherSwitch, 1606 bytes reportados por IOS, con todas las interfaces Fa1/0–Fa1/15, VLAN1, ACL y SNMP.

**Fidelidad:** ambos archivos transcriben las configuraciones mostradas en las capturas de `show running-config` **hasta `end`**. Se excluyó únicamente el valor real de `snmp-server community` por privacidad. El valor `<COMUNIDAD_SNMP_OCULTA>` es una representación, no una instrucción IOS ejecutable. El tamaño en bytes puede diferir del valor original por la sustitución de la cadena.

No se han eliminado secciones de consola, AUX, VTY ni interfaces.
