#!/bin/bash
rm -rf db_files/EMS.db
sqlite3 db_files/EMS.db < schema.sql