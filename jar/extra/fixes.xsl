<?xml version="1.0" encoding="ASCII"?>

<!--
  Copy source document into target without changes.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" indent="yes" encoding="ASCII" />

<xsl:template match="class/method[@name='main' and @access='public static ' and @desc='([Ljava/lang/String;)V']">
	<method access="public static " name="main" desc="([Ljava/lang/String;)V">
	<exceptions/>
	<code>
		<Label name="0"/>
		<LineNumber line="8" start="0"/>
		<GETSTATIC owner="java/lang/System" name="err" desc="Ljava/io/PrintStream;"/>
		<LDC cst="This JAR file is not intended to be run. Please run against the unmodified Bukkit MCPC jar." desc="Ljava/lang/String;"/>
		<INVOKEVIRTUAL owner="java/io/PrintStream" name="println" desc="(Ljava/lang/String;)V"/>
		<Label name="1"/>
		<LineNumber line="9" start="1"/>
		<ICONST_0/>
		<INVOKESTATIC owner="java/lang/System" name="exit" desc="(I)V"/>
		<Label name="2"/>
		<LineNumber line="10" start="2"/>
		<RETURN/>
		<Label name="3"/>
		<LocalVar name="args" desc="[Ljava/lang/String;" start="0" end="3" var="0"/>
		<Max maxStack="2" maxLocals="1"/>
	</code>
	</method>
</xsl:template>
<!-- Mark getPlayer and getInventory as abstract, to force mod makers to implement them properly, or implement them as return null; specifically in border cases -->
<xsl:template match="class[@name='net/minecraft/src/Container']/method[@name='getPlayer' and @desc='()Lnet/minecraft/src/EntityPlayer;']">
	<method access="{@access}abstract " name="{@name}" desc="{@desc}">
		<exceptions/>
	</method>
</xsl:template>
<xsl:template match="class[@name='net/minecraft/src/Container']/method[@name='getInventory' and @desc='()Lnet/minecraft/src/IInventory;']">
	<method access="{@access}abstract " name="{@name}" desc="{@desc}">
		<exceptions/>
	</method>
</xsl:template>
<xsl:template match="class/method[@name='getMetadata' and @desc='(I)I']">
	<method access="{@access}abstract " name="{@name}" desc="{@desc}">
		<exceptions/>
	</method>
</xsl:template>

<!-- copy everything -->
<xsl:template match="@*|*|text()|processing-instruction()">
  <xsl:copy><xsl:apply-templates select="@*|*|text()|processing-instruction()"/></xsl:copy>
</xsl:template>
</xsl:stylesheet>