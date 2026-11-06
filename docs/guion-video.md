# Guion de la demostración individual (máximo 10 minutos)

**0:00–0:30** · Presentación personal: rostro y voz, fecha y hora actuales visibles; propósito: DHCP en Cisco y monitoreo SNMP desde Zabbix.

**0:30–1:30** · Mostrar topología GNS3 completa: R1 (10.7.63.1), SW1 (10.7.63.2), PC1 y Cloud VMnet4, y explicar Ubuntu conectado a esa misma red.

**1:30–2:40** · En R1 mostrar `show ip interface brief` y `show ip dhcp binding` con concesiones `10.7.63.100` y `10.7.63.101`.

**2:40–3:35** · En Ubuntu mostrar `ip -br addr` e `ip route`, destacando `ens33` como cliente DHCP de Cisco. La interfaz `ens37` es únicamente NAT para Internet.

**3:35–4:40** · En R1/SW1 mostrar la ACL y configuración `snmp-server community ... RO 15` con la comunidad tapada en pantalla, y explicar lectura solamente.

**4:40–5:45** · En Ubuntu mostrar consultas `snmpwalk` y datos `sysName` de R1 y SW1, sin exponer credenciales.

**5:45–7:15** · Zabbix → `Data collection → Hosts`: los hosts Router R1 y Switch SW1 con SNMP disponible (verde).

**7:15–8:40** · Zabbix → `Monitoring → Latest data`: CPU, memoria, ICMP, estado y tráfico de interfaces de ambos Cisco.

**8:40–9:30** · GitHub: mostrar documentación, diagrama, fotos, running-config completos y scripts. Resumen y cierre.

Mantén todo en menos de 10 minutos. El enlace de YouTube debe ir al **principio del README**. El archivo de entrega debe llamarse `<Nombre>_<Matrícula>_A3.txt` (según el formato exigido por el profesor), y contener el enlace del repositorio y del video. Verificar que el repositorio sea público antes del cierre.
