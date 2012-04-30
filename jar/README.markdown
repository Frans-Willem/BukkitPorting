Generated JARs
==============
Step 1: Generate mappings
-------------------------
See the mappings directory for more information.

Step 2: Apply mappings
----------------------
Execute

	java -classpath "../bin/SrgTools.jar;../bin/asm-all-3.3.1.jar" ApplySrg --srg ../mappings/generated/server_bukkit_mcp_1.2.5.srg --inheritance default/craftbukkit-1.2.5-R1.2-MCPC-SNAPSHOT-76.jar --in default/craftbukkit-1.2.5-R1.2-MCPC-SNAPSHOT-76.jar --out generated/craftbukkit-1.2.5-R1.2-MCPC-SNAPSHOT-76.MCP.Pure.jar
	java -classpath "../bin/asm-all-3.3.1.jar" org.objectweb.asm.xml.Processor code code -in generated/craftbukkit-1.2.5-R1.2-MCPC-SNAPSHOT-76.MCP.Pure.jar -out generated/craftbukkit-1.2.5-R1.2-MCPC-SNAPSHOT-76.MCP.jar -xslt extra/fixes.xsl
