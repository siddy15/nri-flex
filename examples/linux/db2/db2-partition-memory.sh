#!/bin/sh

cd /home/$1/sqllib

. ./db2profile

db2 connect to $2

db2 -x "SELECT DBPARTITIONNUM, MAX_PARTITION_MEM/1048576 AS MAX_MEM_MB, CURRENT_PARTITION_MEM/1048576 AS CURRENT_MEM_MB FROM TABLE (SYSPROC.ADMIN_GET_DBP_MEM_USAGE()) AS T"

exit 0