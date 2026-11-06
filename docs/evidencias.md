# Evidencias de las pruebas

**Video demostrativo:** [Ver en YouTube](https://youtu.be/6sB3vWeXpH0)

Las capturas proceden del laboratorio ejecutado en GNS3, Ubuntu Server y la interfaz web de Zabbix. Cada figura se incluye junto a su verificación.

## 1. Topología física y red virtual
![Topología de GNS3 con R1, SW1, PC1 y Cloud1 VMnet4](../evidencias/05_Topologia_GNS3.png)

En GNS3, el equipo central puede conservar la etiqueta visual R2 aunque el hostname IOS sea `SW1`.

## 2. DHCP: concesiones del router R1
![R1 show ip dhcp binding](../evidencias/01_R1_DHCP_binding.png)

R1 ha asignado automáticamente las IP `10.7.63.100` y `10.7.63.101`.

## 3. Ubuntu como cliente DHCP
![Ubuntu ip -br addr](../evidencias/02_Ubuntu_cliente_DHCP.png)

La interfaz `ens33` obtiene `10.7.63.100/24` desde Cisco. La NIC `ens37` está en una red NAT distinta.

## 4. Enrutamiento de Ubuntu
![Ubuntu ip route](../evidencias/03_Ubuntu_rutas.png)

La red de laboratorio mantiene su ruta conectada y durante la instalación se dio prioridad a la ruta por VMware NAT para disponer de Internet.

## 5. Consulta SNMP desde Linux
![SNMPwalk del router R1](../evidencias/09_SNMPwalk_R1.png)
![SNMPwalk de R1 y SW1](../evidencias/10_SNMPwalk_R1_y_SW1.png)

Desde Ubuntu se consultaron los OID básicos de ambas direcciones mediante SNMPv2c.

## 6. Hosts visibles y SNMP disponible en Zabbix
![Data collection Hosts con R1 y SW1 SNMP verde](../evidencias/04_Zabbix_hosts_SNMP.png)

El monitor muestra ambos dispositivos habilitados, con interfaz `161/UDP`, plantilla Cisco IOS SNMP y disponibilidad verde.

## 7. Latest data: valores monitoreados
![Resumen de Latest data en Zabbix](../evidencias/06_Zabbix_latest_data_resumen.png)
![Datos SNMP de memoria y hardware en Zabbix](../evidencias/07_Zabbix_latest_data_memoria.png)
![Datos SNMP de conectividad e interfaces en Zabbix](../evidencias/08_Zabbix_latest_data_interfaces.png)

Se verificaron valores actuales de CPU, memoria, disponibilidad ICMP y estado/tráfico de interfaces.

## 8. Configuraciones completas observadas en Cisco IOS

**R1 — desde `version` hasta `end`:**

![R1 running-config, inicio](../evidencias/11_R1_running_config_inicio.png)
![R1 running-config, final con DHCP y SNMP](../evidencias/12_R1_running_config_fin.png)

**SW1 — desde `version` hasta `end`, incluidas todas las interfaces:**

![SW1 running-config, inicio](../evidencias/13_SW1_running_config_inicio.png)
![SW1 running-config, interfaces](../evidencias/14_SW1_running_config_medio.png)
![SW1 running-config, VLAN1 y líneas de acceso](../evidencias/15_SW1_running_config_fin.png)

Las capturas contienen únicamente redacción visual de la comunidad SNMP. La transcripción completa y depurada está disponible en [R1](../configuraciones/R1_running-config.txt) y [SW1](../configuraciones/SW1_running-config.txt).
