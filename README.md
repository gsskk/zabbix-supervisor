# zabbix-supervisor

## Description

Use zabbix to monitor all processes controlled by supervisor.

Test with zabbix 3.0 on CentOS 7.

## Installation

1. Copy files to zabbix-agents as follows:

   ```
   cp zabbix_agentd.d/supervisor_agentd.conf /etc/zabbix/zabbix_agentd.d/supervisor_agentd.conf
   cp scripts/zbx_discovery_supervisor.sh /etc/zabbix/scripts/zbx_discovery_supervisor.sh
   cp sudoer.d/zabbix /etc/sudoer.d/zabbix

   chown zabbix.zabbix /etc/zabbix/zabbix_agentd.d/supervisor_agentd.conf
   chown zabbix.zabbix /etc/zabbix/scripts/zbx_discovery_supervisor.sh
   chown root.root /etc/sudoer.d/zabbix
   chmod 644 /etc/sudoer.d/zabbix
   ```

   ​

2. Import templates/Template-Supervisor-autodiscovery.xml to zabbix web.

3. Restart zabbix-agents.

