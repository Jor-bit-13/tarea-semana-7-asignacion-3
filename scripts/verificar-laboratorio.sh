#!/usr/bin/env bash
# Script complementario y opcional de verificación del laboratorio SNMP.
# Para repetir las pruebas desde Ubuntu Server. No publicar secretos.
set -euo pipefail

for ip in 10.7.63.1 10.7.63.2; do
  echo "== PING a ${ip} =="
  ping -c 3 "${ip}"
done

if ! command -v snmpwalk >/dev/null 2>&1; then
  printf 'Falta snmpwalk. Instala con sudo apt install snmp\n' >&2
  exit 1
fi

read -rsp "Introduce la comunidad SNMP del laboratorio: " SNMP_COMM
printf '\n'
trap 'unset SNMP_COMM' EXIT
for ip in 10.7.63.1 10.7.63.2; do
  echo "== sysName de ${ip} =="
  snmpget -v2c -c "${SNMP_COMM}" -On "${ip}" 1.3.6.1.2.1.1.5.0
  echo "== sysUpTime de ${ip} =="
  snmpget -v2c -c "${SNMP_COMM}" -On "${ip}" 1.3.6.1.2.1.1.3.0
done
