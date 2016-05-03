import os
from read_env import read_env

read_env()

if ('NONE' !== os.environ['REMOVE_RULES']):
    str = "\n\n"
        + "<LocationMatch .*>\n"
        + "    <IfModule mod_security2.c>\n"
        + "        SecRuleRemoveById " + os.environ['REMOVE_RULES'] + "\n"
        + "    </IfModule>\n"
        + "</LocationMatch>"

    with open("/etc/apache2/conf-available/security.conf", "a") as conf:
        conf.write(str)
