Generated mappings
==================
Step 1: Automatic commands
-------------------

	java -classpath "../bin/SrgTools.jar;../bin/asm-all-3.3.1.jar" ReverseSrg default/server_vanilla_bukkit_1.2.5.srg > generated/server_bukkit_vanilla_1.2.5.srg
	java -classpath "../bin/SrgTools.jar;../bin/asm-all-3.3.1.jar" ChainSrg generated/server_bukkit_vanilla_1.2.5.srg default/server_vanilla_mcp_1.2.5.srg > generated/server_bukkit_mcp_1.2.5_auto.srg
	java -classpath "../bin/SrgTools.jar;../bin/asm-all-3.3.1.jar" SrgCollisions --srg generated/server_bukkit_mcp_1.2.5_auto.srg --in ../jar/default/craftbukkit-1.2.5-R1.1-MCPC-SNAPSHOT-73.jar > generated/collisions.txt

Step 2: Some manual labour
--------------------------
Open generated/collisions.txt, and if it's not empty, draw up a set of custom rules remapping conflicting translations. e.g. the following:

	FD: net/minecraft/server/NetServerHandler/lastPosZ net/minecraft/src/NetServerHandler/lastPosZ
	FD: net/minecraft/server/NetServerHandler/q net/minecraft/src/NetServerHandler/lastPosZ

	FD: net/minecraft/server/NetServerHandler/lastPosX net/minecraft/src/NetServerHandler/lastPosX
	FD: net/minecraft/server/NetServerHandler/y net/minecraft/src/NetServerHandler/lastPosX

	FD: net/minecraft/server/NetServerHandler/lastPosY net/minecraft/src/NetServerHandler/lastPosY
	FD: net/minecraft/server/NetServerHandler/z net/minecraft/src/NetServerHandler/lastPosY
	
Could be turned into:

	FD: net/minecraft/server/NetServerHandler/lastPosZ net/minecraft/src/NetServerHandler/__bukkit__lastPosZ
	FD: net/minecraft/server/NetServerHandler/lastPosX net/minecraft/src/NetServerHandler/__bukkit__lastPosX
	FD: net/minecraft/server/NetServerHandler/lastPosY net/minecraft/src/NetServerHandler/__bukkit__lastPosY

It's probably best if everyone just added __bukkit__ in front of any variable added by Bukkit that conflicts.

Save this as fixcollisions.srg

Step 3: Automation!
-------------------
If you're not running linux, do this manually

	cat generated/server_bukkit_mcp_1.2.5_auto.srg > generated/server_bukkit_mcp_1.2.5.srg
	cat generated/fixcollisions.srg >> generated/server_bukkit_mcp_1.2.5.srg
	cat extra/packages.srg >> generated/server_bukkit_mcp_1.2.5.srg
	java -classpath "../bin/SrgTools.jar;../bin/asm-all-3.3.1.jar" ReverseSrg generated/server_bukkit_mcp_1.2.5.srg > generated/server_mcp_bukkit_1.2.5.srg

Done
----
Next up is the JAR section.