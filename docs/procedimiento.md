# Procedimiento reproducible y comandos de validación

## A. Configuración Cisco R1
Los comandos relevantes para DHCP y SNMP fueron:
```cisco
interface FastEthernet0/0
 ip address 10.7.63.1 255.255.255.0
 no shutdown
!
ip dhcp excluded-address 10.7.63.1 10.7.63.99
ip dhcp excluded-address 10.7.63.254
ip dhcp pool LAN-ZABBIX
 network 10.7.63.0 255.255.255.0
 default-router 10.7.63.1
!
access-list 15 permit 10.7.63.0 0.0.0.255
snmp-server community <COMUNIDAD_SNMP_OCULTA> RO 15
snmp-server location LAB-GNS3-R1
snmp-server contact Administrador
```
El archivo íntegro de configuración está en `configuraciones/R1_running-config.txt`.

Verificación en modo privilegiado:
```cisco
show ip interface brief
show ip dhcp binding
show access-lists 15
show snmp
show running-config
```

## B. Configuración Cisco SW1
El SW1 es c2691 con módulo EtherSwitch y `hostname SW1`:
```cisco
interface Vlan1
 ip address 10.7.63.2 255.255.255.0
!
no ip routing
ip default-gateway 10.7.63.1
access-list 15 permit 10.7.63.0 0.0.0.255
snmp-server community <COMUNIDAD_SNMP_OCULTA> RO 15
snmp-server location LAB-GNS3-SW1
snmp-server contact Administrador
```
El archivo íntegro de configuración está en `configuraciones/SW1_running-config.txt`.

Verificación:
```cisco
show ip interface brief
show access-lists 15
show snmp
show running-config
```

## C. Cliente DHCP en Ubuntu
```bash
ip -br addr
ip route
ping -c 4 10.7.63.1
ping -c 4 10.7.63.2
```
`ens33` debe pertenecer a `10.7.63.0/24`. Durante la práctica se observó `10.7.63.100/24`. `ens37` se usa para VMware NAT, no para el tráfico SNMP de laboratorio.

En una prueba se utilizó temporalmente:
```bash
sudo ip route replace default via 192.168.209.2 dev ens37 metric 50
```
No constituye una configuración persistente y podría cambiar tras un reinicio.

## D. Instalar y probar SNMP desde Ubuntu
```bash
sudo apt update
sudo apt install -y snmp
```
Consultar sin colocar el valor sensible en la historia del shell:
```bash
read -r -s -p "Comunidad SNMP: " SNMP_COMM; echo
snmpwalk -v2c -c "$SNMP_COMM" 10.7.63.1 1.3.6.1.2.1.1
snmpwalk -v2c -c "$SNMP_COMM" 10.7.63.2 1.3.6.1.2.1.1
unset SNMP_COMM
```
Las respuestas deben incluir el OID `sysName.0` correspondiente a R1 y SW1.

## E. Zabbix
Zabbix Server 7.4.16 sobre Ubuntu 26.04.1, MariaDB y Apache; se instaló desde el repositorio oficial. En la consola:
```bash
sudo systemctl is-active zabbix-server mariadb apache2
```
Se comprobó que los servicios estaban activos. Se crearon hosts SNMP en `Data collection → Hosts` y se asoció `Cisco IOS by SNMP` para `10.7.63.1:161` y `10.7.63.2:161`. Se verificó la recepción en `Monitoring → Latest data`.

## F. Exportación y validación de configuración
En cada dispositivo:
```cisco
terminal length 0
show running-config
terminal length 24
```
Los archivos publicados incluyen todas las secciones del running-config transcrito (de `version` a `end`). En la copia pública, solo se suprimen secretos reales.

## G. Script de apoyo
`scripts/verificar-laboratorio.sh` permite repetir ping y snmpwalk desde Ubuntu utilizando la comunidad indicada por teclado sin imprimirla. Se proporciona como ayuda reproducible; los comandos y capturas del informe corresponden a las pruebas efectuadas durante el montaje.
